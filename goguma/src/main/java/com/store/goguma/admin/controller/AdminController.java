package com.store.goguma.admin.controller;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.store.goguma.admin.dto.AdminAnswerDto;
import com.store.goguma.admin.dto.AdminBannerDto;
import com.store.goguma.admin.dto.AdminChatRoomAndMessageDto;
import com.store.goguma.admin.dto.AdminChatRoomDto;
import com.store.goguma.admin.dto.AdminQnaDto;
import com.store.goguma.admin.dto.AdminResponsePageDto;
import com.store.goguma.admin.dto.PageReqDTO;
import com.store.goguma.entity.Banner;
import com.store.goguma.entity.EmojiHistory;
import com.store.goguma.entity.Faq;
import com.store.goguma.entity.MainEmoji;
import com.store.goguma.handler.exception.BackPageRestfulException;
import com.store.goguma.handler.exception.LoginRestfulException;
import com.store.goguma.service.AdminService;
import com.store.goguma.service.BannerService;
import com.store.goguma.service.ChatMessageService;
import com.store.goguma.service.ChatRoomService;
import com.store.goguma.service.EmojiHistoryService;
import com.store.goguma.service.EmojiUploadService;
import com.store.goguma.service.FaqService;
import com.store.goguma.service.FreeBoardService;
import com.store.goguma.service.NoticeService;
import com.store.goguma.service.ProductService;
import com.store.goguma.service.QnaService;
import com.store.goguma.service.ReportService;
import com.store.goguma.service.UserService;
import com.store.goguma.user.dto.OauthDTO;
import com.store.goguma.user.dto.my.RequestPageDTO;
import com.store.goguma.user.dto.my.ResponsePageDTO;
import com.store.goguma.utils.Define;
import com.store.goguma.utils.UserRole;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Log4j2
@Controller
@RequestMapping("/admin")
@RequiredArgsConstructor
public class AdminController {

	private final HttpSession httpSession;
	private final AdminService adminService;
	private final EmojiHistoryService emojiHistoryService;
	private final EmojiUploadService emojiUploadService;
	private final ReportService reportService;
	private final ProductService productService;
	private final UserService userService;
	private final ChatRoomService chatRoomService;
	private final ChatMessageService chatMessageService;
	private final QnaService qnaService;
	private final BannerService bannerService;
	private final EmojiUploadService fileService;
	private final NoticeService noticeService;
	private final FaqService faqService;
	private final FreeBoardService freeBoardService;

	// 관리자 마이 페이지
	// localhost://admin/modiUser
	@GetMapping("/user")
	public String User(Model model) {

		OauthDTO user = (OauthDTO) httpSession.getAttribute("principal");
		if (user == null) {
			throw new LoginRestfulException(com.store.goguma.utils.Define.ENTER_YOUR_LOGIN, HttpStatus.BAD_REQUEST);
		}

		OauthDTO updateUser = adminService.selectAdminByUid(user.getUId());

		model.addAttribute("user", updateUser);

		log.info("셀렉트한 유저 마이페이지 데이터 " + updateUser);

		return "admin/admin_user";
	}

	// admin 개인정보 update 페이지
	@GetMapping("/modify")
	public String adminModify(Model model) {

		OauthDTO user = (OauthDTO) httpSession.getAttribute("principal");
		if (user == null) {
			throw new LoginRestfulException(com.store.goguma.utils.Define.ENTER_YOUR_LOGIN, HttpStatus.BAD_REQUEST);
		}

		return "admin/admin_modi";
	}

	// admin 롤을 가진 user의 개인정보 updateProc
	@PostMapping("/modify")
	public String adminModifyProc(OauthDTO dto, Model model) {

		OauthDTO principal = (OauthDTO) httpSession.getAttribute("principal");

		String addr1 = dto.getAddr1();
		String addr2 = dto.getAddr2();
		String address = addr1 + addr2;

		dto.setAddress(address);
		dto.setEmail(principal.getEmail());
		dto.setSocial(principal.getSocial());
		dto.setRole(principal.getRole());

		adminService.modifyAdminByEmail(dto);

		return "redirect:/admin/user";
	}

	/*
	 * admin 상품 결제 이력 관리 페이지 결제 이력 리스트 출력, 페이징
	 */
	@GetMapping("/history")
	public String salesHistory(RequestPageDTO historyReqDTO, Model model, PageReqDTO page) {

		OauthDTO user = (OauthDTO) httpSession.getAttribute("principal");
		if (user == null) {
			throw new LoginRestfulException(com.store.goguma.utils.Define.ENTER_YOUR_LOGIN, HttpStatus.BAD_REQUEST);
		}

		log.info("history로 들어오는 pagedto" + page);
		if (historyReqDTO.getSearchType() == null) {
			historyReqDTO.setSearchType("merchantId");
		}
		if (historyReqDTO.getSearch() == null) {
			historyReqDTO.setSearch("");
		}

		log.info("검색 : {}", historyReqDTO);

		ResponsePageDTO list = adminService.selectAllPayHistoryByY(historyReqDTO);

		model.addAttribute("histories", list.getDtoList());
		model.addAttribute("pg", list.getPg());
		model.addAttribute("start", list.getStart());
		model.addAttribute("end", list.getEnd());
		model.addAttribute("last", list.getLast());

		return "admin/admin_payment_history";
	}

	// admin 활불 사유 검색 ajax
	@PostMapping("/payment-reason")
	@ResponseBody
	public EmojiHistory paymentReasonProc(String merchantId) {

		// merchantId로 환불 사유 검색
		EmojiHistory cancel = adminService.selectCancelByMaerchantId(merchantId);

		String reason = cancel.getCancelReason();

		log.info("돌아오는 리즌 데이터 확인: " + reason);

		return cancel;
	}

	// 이모지 페이지
	// 이모지 리스트 출력, 페이징
	@GetMapping("/emoji")
	public String managementEmoji() {

		OauthDTO user = (OauthDTO) httpSession.getAttribute("principal");
		if (user == null) {
			throw new LoginRestfulException(com.store.goguma.utils.Define.ENTER_YOUR_LOGIN, HttpStatus.BAD_REQUEST);
		}

		log.info("여기는 거치니?");

		return "admin/emoji_management";
	}



	// admin emoji detail 페이지
	@GetMapping("/emoji/detail/{id}")
	public String detail() {
		return "admin/emoji_detail";
	}

	/**
	 * 신고 관리
	 * 
	 * @param model
	 * @param dto
	 * @param page
	 * @return
	 */
	@GetMapping("/report")
	public String managementReport(RequestPageDTO page, Model model) {

		OauthDTO user = (OauthDTO) httpSession.getAttribute("principal");
		if (user == null) {
			throw new LoginRestfulException(com.store.goguma.utils.Define.ENTER_YOUR_LOGIN, HttpStatus.BAD_REQUEST);
		}
		if (page.getSearchType() == null) {
			page.setSearchType("id");
		}
		if (page.getSearch() == null) {
			page.setSearch("");
		}

		ResponsePageDTO report = adminService.selectReportAll(page);

		model.addAttribute("report", report.getDtoList());
		model.addAttribute("pg", report.getPg());
		model.addAttribute("start", report.getStart());
		model.addAttribute("end", report.getEnd());
		model.addAttribute("last", report.getLast());

		return "admin/admin_management_report";
	}

	/**
	 * 유저간 거래 상품 관리 페이지
	 * 
	 * @param requestPageDTO
	 * @param model
	 * @return
	 */
	@GetMapping("/product")
	public String managementProduct(RequestPageDTO requestPageDTO, Model model) {

		OauthDTO user = (OauthDTO) httpSession.getAttribute("principal");
		if (user == null) {
			throw new LoginRestfulException(com.store.goguma.utils.Define.ENTER_YOUR_LOGIN, HttpStatus.BAD_REQUEST);
		}

		log.info("타입 : {}", requestPageDTO.getSearchType());
		if (requestPageDTO.getSearchType() == null) {
			requestPageDTO.setSearchType("productName");
		}
		if (requestPageDTO.getSearch() == null) {
			requestPageDTO.setSearch("");
		}
		// 페이징 객체
		ResponsePageDTO res = productService.adminFindAll(requestPageDTO);

		model.addAttribute("productList", res.getDtoList());
		model.addAttribute("pg", res.getPg());
		model.addAttribute("start", res.getStart());
		model.addAttribute("end", res.getEnd());
		model.addAttribute("last", res.getLast());
		return "admin/admin_management_product";
	}

	/**
	 * 상품 삭제
	 * 
	 * @param pId
	 * @return
	 */
	@DeleteMapping("/product/delete/{pid}")
	public String deleteProduct(@PathVariable(value = "pid") Integer pId) {

		OauthDTO user = (OauthDTO) httpSession.getAttribute("principal");
		if (user == null) {
			throw new LoginRestfulException(com.store.goguma.utils.Define.ENTER_YOUR_LOGIN, HttpStatus.BAD_REQUEST);
		}

		int result = productService.adminDeleteProduct(pId);
		if (result == 0) {
			throw new BackPageRestfulException(Define.INTERVAL_SERVER_ERROR, HttpStatus.INTERNAL_SERVER_ERROR);
		}

		return "redirect:/admin/product";
	}


	/**
	 * 유저 권한 관리
	 * 
	 * @param requestPageDTO
	 * @param model
	 * @return
	 */
	@GetMapping("/user/role-management")
	public String userRoleManagement(RequestPageDTO requestPageDTO, Model model) {

		OauthDTO user = (OauthDTO) httpSession.getAttribute("principal");
		if (user == null) {
			throw new LoginRestfulException(com.store.goguma.utils.Define.ENTER_YOUR_LOGIN, HttpStatus.BAD_REQUEST);
		}

		// 만약 검색어가 null 일 경우
		String search = (requestPageDTO.getSearch() == null) ? "" : requestPageDTO.getSearch();
		requestPageDTO.setSearch(search);
		ResponsePageDTO res = userService.findAll(requestPageDTO);

		model.addAttribute("userList", res.getDtoList());
		model.addAttribute("pg", res.getPg());
		model.addAttribute("start", res.getStart());
		model.addAttribute("end", res.getEnd());
		model.addAttribute("last", res.getLast());
		return "admin/admin_management_user_role";
	}

	@PutMapping("/user/role-management/{uId}")
	public String putMethodName(@PathVariable(value = "uId") Integer uId, UserRole role) {

		OauthDTO user = (OauthDTO) httpSession.getAttribute("principal");
		if (user == null) {
			throw new LoginRestfulException(com.store.goguma.utils.Define.ENTER_YOUR_LOGIN, HttpStatus.BAD_REQUEST);
		}

		log.info("유저 role : {}", role);

		int result = userService.adminUpdateUserRole(uId, role);
		if (result == 0) {
			throw new BackPageRestfulException(Define.INTERVAL_SERVER_ERROR, HttpStatus.INTERNAL_SERVER_ERROR);
		}

		return "redirect:/admin/user/role-management";
	}

	/**
	 * 신고 관리
	 * 
	 * @param id
	 * @return
	 */
	@PutMapping("/update-report/{id}")
	public String updateReport(@PathVariable(value = "id") Integer id) {

		OauthDTO user = (OauthDTO) httpSession.getAttribute("principal");
		if (user == null) {
			throw new LoginRestfulException(com.store.goguma.utils.Define.ENTER_YOUR_LOGIN, HttpStatus.BAD_REQUEST);
		}

		int result = reportService.update(id);

		if (result == 0) {
			throw new BackPageRestfulException(Define.INTERVAL_SERVER_ERROR, HttpStatus.INTERNAL_SERVER_ERROR);
		}

		return "redirect:/admin/report";
	}

	/**
	 * 채팅방 로그 관리
	 * 
	 * @return
	 */
	@GetMapping("/chat")
	public String chatManagement(RequestPageDTO request, Model model) {

		OauthDTO user = (OauthDTO) httpSession.getAttribute("principal");
		if (user == null) {
			throw new LoginRestfulException(com.store.goguma.utils.Define.ENTER_YOUR_LOGIN, HttpStatus.BAD_REQUEST);
		}

		// 검색 기본 default 값
		String search = request.getSearch() == null ? "" : request.getSearch();
		request.setSearch(search);
		String searchType = request.getSearchType() == null ? "productName" : request.getSearchType();
		request.setSearchType(searchType);
		log.info("검색 검색 : {}", request.toString());
		// 모든 채팅방 가져오기
		AdminResponsePageDto<AdminChatRoomDto> res = chatRoomService.adminFindAllByRoomName(request);

		// 채팅방 , 채팅 로그 목록 전부 가져오기
		List<AdminChatRoomAndMessageDto> list = new ArrayList<>();

		// 문제있는 코드 - 너무 connectPool 많이 쓰게됨
		res.getDtoList().forEach(
				(e) -> list.add(new AdminChatRoomAndMessageDto(e, chatMessageService.findAllByRoomId(e.getRoomId()))));

		model.addAttribute("chatList", list);
		model.addAttribute("pg", res.getPg());
		model.addAttribute("start", res.getStart());
		model.addAttribute("end", res.getEnd());
		model.addAttribute("last", res.getLast());
		return "admin/admin_management_chat";
	}

	/**
	 * 채팅방 삭제하기
	 * 
	 * @param id
	 * @return
	 */
	@DeleteMapping("/chat-room/delete/{id}")
	public String deleteChatRoom(@PathVariable(value = "id") Integer id) {

		OauthDTO user = (OauthDTO) httpSession.getAttribute("principal");
		if (user == null) {
			throw new LoginRestfulException(com.store.goguma.utils.Define.ENTER_YOUR_LOGIN, HttpStatus.BAD_REQUEST);
		}

		// 채팅방 삭제
		int result = chatRoomService.deleteChatRoom(id);
		if (result == 0) {
			throw new BackPageRestfulException(Define.INTERVAL_SERVER_ERROR, HttpStatus.INTERNAL_SERVER_ERROR);
		}

		return "redirect:/admin/chat";
	}

	/**
	 * QNA 문의 내역 확인하기
	 */
	@GetMapping("/qna")
	public String selectQna(RequestPageDTO req, Model model) {
		OauthDTO user = (OauthDTO) httpSession.getAttribute("principal");
		if (user == null) {
			throw new LoginRestfulException(com.store.goguma.utils.Define.ENTER_YOUR_LOGIN, HttpStatus.BAD_REQUEST);
		}

		String search = req.getSearch() == null ? "" : req.getSearch();
		String option = req.getSearchType() == null || req.getSearchType().equals("") ? "" : req.getSearchType();
		req.setSearch(search);
		req.setSearchType(option);
		ResponsePageDTO res = qnaService.adminFindAll(req);

		model.addAttribute("qnaList", res.getDtoList());
		model.addAttribute("pg", res.getPg());
		model.addAttribute("start", res.getStart());
		model.addAttribute("end", res.getEnd());
		model.addAttribute("last", res.getLast());
		// qna 모든 글 가져오기
		return "admin/admin_management_qna";
	}

	/**
	 * qna 상세 조회
	 * 
	 * @param qid
	 * @param model
	 * @return
	 */
	@GetMapping("/qna/{qid}")
	public String writeQnaForm(@PathVariable(value = "qid") Integer qid, Model model) {

		OauthDTO user = (OauthDTO) httpSession.getAttribute("principal");
		if (user == null) {
			throw new LoginRestfulException(com.store.goguma.utils.Define.ENTER_YOUR_LOGIN, HttpStatus.BAD_REQUEST);
		}

		AdminQnaDto adminQnaDto = qnaService.adminFindByQid(qid);

		model.addAttribute("qna", adminQnaDto);
		return "admin/admin_write_qna";
	}

	/**
	 * 답변 작성하기
	 * 
	 * @param id
	 * @param dto
	 * @return
	 */
	@PutMapping("/qna/answer/{id}")
	public String adminAnswer(@PathVariable(value = "id") Integer id, AdminAnswerDto dto) {

		OauthDTO user = (OauthDTO) httpSession.getAttribute("principal");
		if (user == null) {
			throw new LoginRestfulException(com.store.goguma.utils.Define.ENTER_YOUR_LOGIN, HttpStatus.BAD_REQUEST);
		}

		if (dto.getAnswerContent() == null || dto.getAnswerContent().isEmpty()) {
			throw new BackPageRestfulException(Define.NO_VALID_CONTENT, HttpStatus.INTERNAL_SERVER_ERROR);
		}

		dto.setAdminId(user.getUId());
		dto.setQid(id);

		int result = qnaService.adminAnswerQna(dto);
		if (result == 0) {
			throw new BackPageRestfulException(Define.INTERVAL_SERVER_ERROR, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return "redirect:/admin/qna";
	}

	/**
	 * QNA 답변 삭제하기
	 * 
	 * @param id
	 * @return
	 */
	@DeleteMapping("/qna/delete/{id}")
	public String adminQnaDelete(@PathVariable(value = "id") Integer id) {
		OauthDTO user = (OauthDTO) httpSession.getAttribute("principal");
		if (user == null) {
			throw new LoginRestfulException(com.store.goguma.utils.Define.ENTER_YOUR_LOGIN, HttpStatus.BAD_REQUEST);
		}

		int result = qnaService.adminDeleteQna(id);
		if (result == 0) {
			throw new BackPageRestfulException(Define.INTERVAL_SERVER_ERROR, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return "redirect:/admin/qna";
	}

	/**
	 * 배너 전체 조회
	 * 
	 * @param req
	 * @param model
	 * @return
	 */
	@GetMapping("/banner")
	public String adminBannerForm(RequestPageDTO req, Model model) {

		OauthDTO user = (OauthDTO) httpSession.getAttribute("principal");
		if (user == null) {
			throw new LoginRestfulException(com.store.goguma.utils.Define.ENTER_YOUR_LOGIN, HttpStatus.BAD_REQUEST);
		}

		if (req.getSearchType() == null) {
			req.setSearchType("title");
		}
		if (req.getSearch() == null) {
			req.setSearch("");
		}

		log.info("받은 데이터 {}", req);
		ResponsePageDTO res = bannerService.findAll(req);

		model.addAttribute("bannerList", res.getDtoList());
		model.addAttribute("pg", res.getPg());
		model.addAttribute("start", res.getStart());
		model.addAttribute("end", res.getEnd());
		model.addAttribute("last", res.getLast());
		return "admin/admin_management_banner";
	}

	/**
	 * 배너 등록 폼 이동
	 * 
	 * @return
	 */
	@GetMapping("/banner/add")
	public String adminBannerAddForm() {
		OauthDTO user = (OauthDTO) httpSession.getAttribute("principal");
		if (user == null) {
			throw new LoginRestfulException(com.store.goguma.utils.Define.ENTER_YOUR_LOGIN, HttpStatus.BAD_REQUEST);
		}

		return "admin/admin_management_banner_add";
	}

	/**
	 * 배너 등록
	 * 
	 * @param banner
	 * @return
	 */
	@PostMapping("/banner/add")
	public String adminBannerAdd(AdminBannerDto banner) {
		OauthDTO user = (OauthDTO) httpSession.getAttribute("principal");
		if (user == null) {
			throw new LoginRestfulException(com.store.goguma.utils.Define.ENTER_YOUR_LOGIN, HttpStatus.BAD_REQUEST);
		}

		// 유효성 검사
		if (banner.getTitle() == null || banner.getTitle().isEmpty()) {
			throw new BackPageRestfulException(Define.NO_VALID_TITLE, HttpStatus.BAD_REQUEST);
		}
		if (banner.getClient() == null || banner.getClient().isEmpty()) {
			throw new BackPageRestfulException(Define.NO_VALID_CLIENT, HttpStatus.BAD_REQUEST);
		}
		if (banner.getPrice() < 0) {
			throw new BackPageRestfulException(Define.NO_VALID_PRICE, HttpStatus.BAD_REQUEST);
		}
		if (banner.getType() == null) {
			throw new BackPageRestfulException(Define.NO_VALID_TYPE, HttpStatus.BAD_REQUEST);
		}
		if (banner.getFile().getSize() == 0) {
			throw new BackPageRestfulException(Define.NO_VALID_FILE, HttpStatus.BAD_REQUEST);
		}
		if(banner.getUrl() == null || banner.getUrl().isEmpty()) {
			throw new BackPageRestfulException(Define.NO_VALID_URL, HttpStatus.BAD_REQUEST);
		}
		String file = fileService.uploadFileProcess(banner.getFile());

		Banner enttiy = Banner.builder().title(banner.getTitle()).client(banner.getClient()).price(banner.getPrice())
				.type(banner.getType()).file(file).url(banner.getUrl()).build();

		int result = bannerService.insert(enttiy);
		if (result == 0) {
			throw new BackPageRestfulException(Define.INTERVAL_SERVER_ERROR, HttpStatus.INTERNAL_SERVER_ERROR);
		}

		return "redirect:/admin/banner";
	}

	@GetMapping("/banner/update/{id}")
	public String adminBannerUpdate(@PathVariable(value = "id") Integer id, Model model) {
		OauthDTO user = (OauthDTO) httpSession.getAttribute("principal");
		if (user == null) {
			throw new LoginRestfulException(com.store.goguma.utils.Define.ENTER_YOUR_LOGIN, HttpStatus.BAD_REQUEST);
		}

		Banner banner = bannerService.findById(id);

		model.addAttribute("banner", banner);
		return "admin/admin_management_banner_update";
	}

	@PutMapping("/banner/update/{id}")
	public String putMethodName(@PathVariable(value = "id") Integer id, AdminBannerDto banner) {

		OauthDTO user = (OauthDTO) httpSession.getAttribute("principal");
		if (user == null) {
			throw new LoginRestfulException(com.store.goguma.utils.Define.ENTER_YOUR_LOGIN, HttpStatus.BAD_REQUEST);
		}
		Banner entity = bannerService.findById(id);
		// 유효성 검사
		if (banner.getTitle() == null || banner.getTitle().isEmpty()) {
			throw new BackPageRestfulException(Define.NO_VALID_TITLE, HttpStatus.BAD_REQUEST);
		}

		if (banner.getClient() == null || banner.getClient().isEmpty()) {
			throw new BackPageRestfulException(Define.NO_VALID_CLIENT, HttpStatus.BAD_REQUEST);
		}
		if (banner.getPrice() < 0) {
			throw new BackPageRestfulException(Define.NO_VALID_PRICE, HttpStatus.BAD_REQUEST);
		}
		if (banner.getType() == null) {
			throw new BackPageRestfulException(Define.NO_VALID_TYPE, HttpStatus.BAD_REQUEST);
		}

		if (banner.getFile().getSize() != 0) {
			String file = fileService.uploadFileProcess(banner.getFile());
			entity.setFile(file);
		}
		if (banner.getUseYn() == null || banner.getUseYn().isEmpty()) {
			throw new BackPageRestfulException(Define.INTERVAL_SERVER_ERROR, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(banner.getUrl() == null || banner.getUrl().isEmpty()) {
			throw new BackPageRestfulException(Define.NO_VALID_URL, HttpStatus.BAD_REQUEST);
		}
		
		entity.setClient(banner.getClient());
		entity.setTitle(banner.getTitle());
		entity.setPrice(banner.getPrice());
		entity.setType(banner.getType());
		entity.setUseYn(banner.getUseYn());
		entity.setUrl(banner.getUrl());

		int result = bannerService.update(entity);
		if (result == 0) {
			throw new BackPageRestfulException(Define.INTERVAL_SERVER_ERROR, HttpStatus.INTERNAL_SERVER_ERROR);
		}

		return "redirect:/admin/banner";
	}

	/**
	 * 공지 관리
	 * 
	 * @return
	 */
	@GetMapping("/notice")
	public String noticeAdminList(RequestPageDTO req, Model model) {

		OauthDTO user = (OauthDTO) httpSession.getAttribute("principal");
		if (user == null) {
			throw new LoginRestfulException(com.store.goguma.utils.Define.ENTER_YOUR_LOGIN, HttpStatus.BAD_REQUEST);
		}

		if (req.getSearchType() == null) {
			req.setSearchType("title");
		}
		if (req.getSearch() == null) {
			req.setSearch("");
		}

		log.info("로그 : {}", req);

		ResponsePageDTO res = noticeService.adminFindAll(req);

		model.addAttribute("noticeList", res.getDtoList());
		model.addAttribute("pg", res.getPg());
		model.addAttribute("start", res.getStart());
		model.addAttribute("end", res.getEnd());
		model.addAttribute("last", res.getLast());
		return "admin/admin_management_notice";
	}

	/**
	 * 자주 묻는 질문 관리
	 * @param model
	 * @return
	 */
	@GetMapping("/faq")
	public String faqAdminList(Model model) {
		
		OauthDTO user = (OauthDTO) httpSession.getAttribute("principal");
		if (user == null) {
			throw new LoginRestfulException(com.store.goguma.utils.Define.ENTER_YOUR_LOGIN, HttpStatus.BAD_REQUEST);
		}

		List<Faq> list =  faqService.getFaqList();
		model.addAttribute("faqList" , list);
		return "admin/admin_management_faq";
	}
	
	/**
	 * 자주 묻는 질문 업데이트 폼 이동
	 * @param model
	 * @return
	 */
	@GetMapping("/faq/{id}")
	public String faqUpdateForm(@PathVariable(value = "id") Integer id,  Model model) {
		OauthDTO user = (OauthDTO) httpSession.getAttribute("principal");
		if (user == null) {
			throw new LoginRestfulException(com.store.goguma.utils.Define.ENTER_YOUR_LOGIN, HttpStatus.BAD_REQUEST);
		}
			
		Faq faq = faqService.findById(id);
		if(faq == null) {
				throw new BackPageRestfulException(Define.INTERVAL_SERVER_ERROR, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		model.addAttribute("faq" , faq);
		return "admin/admin_management_faq_update";
	}
	
	/**
	 * 자주 묻는 질문 수정
	 * @param id
	 * @param faq
	 * @return
	 */
	@PutMapping("/faq/{id}")
	public String faqUpdate(@PathVariable(value = "id") Integer id , Faq faq) {
		
		OauthDTO user = (OauthDTO) httpSession.getAttribute("principal");
		if (user == null) {
			throw new LoginRestfulException(com.store.goguma.utils.Define.ENTER_YOUR_LOGIN, HttpStatus.BAD_REQUEST);
		}
		
		if (faq.getTitle() == null || faq.getTitle().isEmpty()) {
			throw new BackPageRestfulException(Define.NO_VALID_TITLE, HttpStatus.BAD_REQUEST);
		}
		if (faq.getContent() == null || faq.getContent().isEmpty()) {
			throw new BackPageRestfulException(Define.NO_VALID_CONTENT, HttpStatus.BAD_REQUEST);
		}
		
		
		int result = faqService.update(faq);
		if (result == 0) {
			throw new BackPageRestfulException(Define.INTERVAL_SERVER_ERROR, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return "redirect:/admin/faq";
	}
	
	/**
	 * 자주 묻는 질문 삭제
	 * @param id
	 * @return
	 */
	@DeleteMapping("/faq/{id}")
	public String faqDelete(@PathVariable(value = "id") Integer id) {
		OauthDTO user = (OauthDTO) httpSession.getAttribute("principal");
		if (user == null) {
			throw new LoginRestfulException(com.store.goguma.utils.Define.ENTER_YOUR_LOGIN, HttpStatus.BAD_REQUEST);
		}
		
		int result = faqService.deleteById(id);
		if (result == 0) {
			throw new BackPageRestfulException(Define.INTERVAL_SERVER_ERROR, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return "redirect:/admin/faq";
	}

	@GetMapping("/freeboard") 
	public String freeboardListForm(RequestPageDTO req, Model model) {
		
		OauthDTO user = (OauthDTO) httpSession.getAttribute("principal");
		if (user == null) {
			throw new LoginRestfulException(com.store.goguma.utils.Define.ENTER_YOUR_LOGIN, HttpStatus.BAD_REQUEST);
		}
		if (req.getMainCategory() == null) {
			req.setMainCategory(0);
			req.setSubCategory(0);
		}
		
 		ResponsePageDTO res = freeBoardService.adminFindAll(req);
		
		model.addAttribute("freeBoardList", res.getDtoList());
		model.addAttribute("pg", res.getPg());
		model.addAttribute("start", res.getStart());
		model.addAttribute("end", res.getEnd());
		model.addAttribute("last", res.getLast());
		return "admin/admin_free_board";
	}
	
	@DeleteMapping("/freeboard/delete/{id}")
	public String deleteFreeBoard(@PathVariable(value = "id") Integer id) {
		OauthDTO user = (OauthDTO) httpSession.getAttribute("principal");
		if (user == null) {
			throw new LoginRestfulException(com.store.goguma.utils.Define.ENTER_YOUR_LOGIN, HttpStatus.BAD_REQUEST);
		}
		
		int result = freeBoardService.deleteById(id);
		if(result == 0) {
			throw new BackPageRestfulException(Define.INTERVAL_SERVER_ERROR, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return "redirect:/admin/freeboard";
	}
	
	// free_board 생성 페이지
	@GetMapping("/create/freeBoard")
	public String Create_freeBoard() {
		
		
		return "admin/freeBoard_create";
	}

	
	
	
	// free_board 관리 페이지
	@GetMapping("/modify/freeBoard")
	public String Modify_freeBoard() {
		
		
		return "admin/freeBoard_modify";
	}

}
