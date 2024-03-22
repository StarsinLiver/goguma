package com.store.goguma.product.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.store.goguma.chat.dto.chatRoom.SaveRoomDTO;
import com.store.goguma.entity.Product;
import com.store.goguma.handler.exception.BackPageRestfulException;
import com.store.goguma.handler.exception.ChatRoomException;
import com.store.goguma.handler.exception.LoginRestfulException;
import com.store.goguma.product.dto.ProductDTO;
import com.store.goguma.product.dto.ProductUserDto;
import com.store.goguma.product.dto.ProductWriteFormDTO;
import com.store.goguma.product.dto.WishListDTO;
import com.store.goguma.report.dto.ReportDTO;
import com.store.goguma.service.ChatRoomNameService;
import com.store.goguma.service.ChatRoomService;
import com.store.goguma.service.EmojiUploadService;
import com.store.goguma.service.ProductService;
import com.store.goguma.service.ReportService;
import com.store.goguma.service.UserService;
import com.store.goguma.service.WishListService;
import com.store.goguma.user.dto.OauthDTO;
import com.store.goguma.user.dto.UserDTO;
import com.store.goguma.utils.Define;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/product")
@RequiredArgsConstructor
public class ProductController {

	private final ProductService productService;
	private final UserService userService;
	private final ChatRoomService chatRoomService;
	private final WishListService wishListService;
	private final ChatRoomNameService chatRoomNameService;
	private final ReportService reportService;
	private final HttpSession httpSession;
	private final EmojiUploadService fileService;

	// 상품 상세 페이지
	// http://localhost/productDetail?pId=1
	@GetMapping("/productDetail")
	public String productDetail(@RequestParam(value = "pId") Integer pId, Model model, HttpSession session) {
		ProductDTO productDTO = productService.findAllBypId(pId);
		List<ProductDTO> userProdList = productService.findWishAndChat(pId);
		log.info("상품 정보: {}", productDTO);
		log.info("userProdList : {}", userProdList);
		// 찜 버튼을 눌렀을 때만 사용자 정보를 가져오도록 수정
		OauthDTO user = (OauthDTO) session.getAttribute("principal");
		Integer uId = null;
		boolean prodWishlist = false;

		if (user != null) {
			uId = user.getUId();
			prodWishlist = wishListService.prodWishlist(uId, pId);
		}

		// 사용자 정보가 null이 아닌 경우, DTO에 사용자 정보 설정
		UserDTO userDTO = userService.findAllByuId(productDTO.getHostId());
		int isExistChatRoom = 0;
		if (uId != null) {
			isExistChatRoom = chatRoomService.isExistChatRoom(pId, uId);
		}

		// 상품의 찜 개수 조회
		Integer wishlistCount = wishListService.getCountWishlist(pId);
		log.info("사용자 정보: {}", userDTO);

		int temperature = userService.getTemperatureUser(productDTO.getHostId());
		int color = userService.getTemperatureUserByScore(temperature);
		model.addAttribute("product", productDTO);
		model.addAttribute("productList", userProdList);
		model.addAttribute("user", userDTO);
		model.addAttribute("prodWishlist", prodWishlist);
		model.addAttribute("isExistChatRoom", isExistChatRoom);
		model.addAttribute("wishlistCount", wishlistCount);
		model.addAttribute("temperature", temperature);
		model.addAttribute("color", color);

		return "/product/detail";
	}

	// 채팅 방 생성
	@PostMapping("/saveRoom")
	public String saveRoom(SaveRoomDTO dto) {

		OauthDTO user = (OauthDTO) httpSession.getAttribute("principal");
		if (user == null) {
			throw new LoginRestfulException(Define.ENTER_YOUR_LOGIN, HttpStatus.INTERNAL_SERVER_ERROR);
		}

		// 채팅 중복 조회
		int existingChatRoomCount = chatRoomService.isExistChatRoom(dto.getPId(), user.getUId());
		if (existingChatRoomCount > 0) {
			// 이미 채팅방이 존재하는 경우
			throw new ChatRoomException("이미 생성된 채팅방이 존재합니다.", HttpStatus.BAD_REQUEST);
		}

		// chat_room 저장
		dto.setUId(user.getUId());
		log.info("방개설 : " + dto.toString());
		int key = chatRoomService.saveRoom(dto);

		// chat_room_name 저장
		chatRoomNameService.save(user.getUId(), key, dto.getName());

		return "redirect:/product/productDetail?pId=" + dto.getPId();
	}

	// 찜 하기
	@PostMapping("/addWishList")
	public String addWishList(WishListDTO dto, @RequestParam(value = "pId") Integer pId, HttpSession session) {
		OauthDTO user = (OauthDTO) session.getAttribute("principal");

		if (user == null) {
			throw new LoginRestfulException(Define.ENTER_YOUR_LOGIN, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		dto.setPId(pId);
		dto.setUId(user.getUId());

		wishListService.addWishList(dto);

		return "redirect:/product/productDetail?pId=" + pId;
	}

	// 찜 삭제
	@PostMapping("/deleteWishList")
	public String deleteWishList(WishListDTO dto, @RequestParam(value = "pId") Integer pId, HttpSession session) {
		OauthDTO user = (OauthDTO) session.getAttribute("principal");

		if (user == null) {
			throw new LoginRestfulException(Define.ENTER_YOUR_LOGIN, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		dto.setPId(pId);
		dto.setUId(user.getUId());

		wishListService.deleteWishList(dto);

		return "redirect:/product/productDetail?pId=" + pId;
	}

	// 유저 신고
	@PostMapping("/addReport")
	public String addReport(ReportDTO dto, Integer pId, Integer hostId, HttpSession session) {
		OauthDTO user = (OauthDTO) session.getAttribute("principal");

		if (user == null) {
			throw new LoginRestfulException(Define.ENTER_YOUR_LOGIN, HttpStatus.INTERNAL_SERVER_ERROR);
		}

		dto.setHostId(hostId);
		dto.setCallId(user.getUId());

		reportService.addReport(dto);

		return "redirect:/product/productDetail?pId=" + pId;
	}

	// 유저 상품 페이지
	// http://localhost/userProduct?uId=1
	@GetMapping("/userProduct")
	public String userProduct(@RequestParam(value = "uId") Integer uId, Model model) {

		List<ProductUserDto> userProdList = productService.findByHostId(uId);
		UserDTO userDTO = userService.findAllByuId(uId);

		model.addAttribute("userProdList", userProdList);
		model.addAttribute("user", userDTO);

		return "product/userProduct";
	}

	// http://localhost/product/register
	// 상품 등록 페이지
	@GetMapping("/write")
	public String registerPage() {
		OauthDTO user = (OauthDTO) httpSession.getAttribute("principal");

		if (user == null) {
			throw new LoginRestfulException(Define.ENTER_YOUR_LOGIN, HttpStatus.INTERNAL_SERVER_ERROR);
		}

		return "product/product_register";
	}

	// 상품 등록
	@PostMapping("/write")
	public String productRegister(ProductWriteFormDTO dto) {
		OauthDTO user = (OauthDTO) httpSession.getAttribute("principal");
		if (user == null) {
			throw new LoginRestfulException(Define.ENTER_YOUR_LOGIN, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		int uId = user.getUId();

		log.info("등록" + dto);
		log.info("돈 타입 : ");

		if (dto.getName() == null || dto.getName().isEmpty())
			throw new BackPageRestfulException(Define.NO_VALID_TITLE, HttpStatus.BAD_REQUEST);

		if (dto.getAddr1() == null || dto.getAddr1().isEmpty()) {
			throw new BackPageRestfulException(Define.NO_VALID_ADDRESS, HttpStatus.BAD_REQUEST);
		}
		if (dto.getAddr2() == null || dto.getAddr2().isEmpty()) {
			throw new BackPageRestfulException(Define.NO_VALID_ADDRESS, HttpStatus.BAD_REQUEST);
		}
		if (dto.getPrice() == null || dto.getPrice() < 0) {
			throw new BackPageRestfulException(Define.NO_VALID_PRICE, HttpStatus.BAD_REQUEST);
		}
		if(dto.getDescription() == null || dto.getDescription().isEmpty()) {
			throw new BackPageRestfulException(Define.NO_VALID_DESCRIPTION, HttpStatus.BAD_REQUEST);
		}
		if (dto.getFile().get(0).getSize() == 0) {
			throw new BackPageRestfulException(Define.NO_VALID_FILE, HttpStatus.BAD_REQUEST);
		}

		productService.writeProduct(dto, uId);

		return "redirect:/product/product-list";
	}

	/**
	 * 상품 수정 폼 이동
	 * @param id
	 * @param model
	 * @return
	 */
	@GetMapping("/write/update/{id}")
	public String productUpdateForm(@PathVariable(value = "id") Integer id, Model model) {
		OauthDTO user = (OauthDTO) httpSession.getAttribute("principal");
		if (user == null) {
			throw new LoginRestfulException(Define.ENTER_YOUR_LOGIN, HttpStatus.INTERNAL_SERVER_ERROR);
		}

		// 상품 상세 조회
		Product product = productService.findById(id);

		if (product == null) {
			throw new BackPageRestfulException(Define.INTERVAL_SERVER_ERROR, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		log.info("상품 수정 폼 : {}" , product);
		model.addAttribute("product", product);
		return "product/product_update";
	}
	
	@PutMapping("/write/update")
	public String productUpdate(ProductWriteFormDTO dto) {
		OauthDTO user = (OauthDTO) httpSession.getAttribute("principal");
		if (user == null) {
			throw new LoginRestfulException(Define.ENTER_YOUR_LOGIN, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		if (dto.getName() == null || dto.getName().isEmpty())
			throw new BackPageRestfulException(Define.NO_VALID_TITLE, HttpStatus.BAD_REQUEST);

		if (dto.getAddr1() == null || dto.getAddr1().isEmpty()) {
			throw new BackPageRestfulException(Define.NO_VALID_ADDRESS, HttpStatus.BAD_REQUEST);
		}
		if (dto.getAddr2() == null || dto.getAddr2().isEmpty()) {
			throw new BackPageRestfulException(Define.NO_VALID_ADDRESS, HttpStatus.BAD_REQUEST);
		}
		if (dto.getPrice() == null || dto.getPrice() < 0) {
			throw new BackPageRestfulException(Define.NO_VALID_PRICE, HttpStatus.BAD_REQUEST);
		}
		if(dto.getDescription() == null || dto.getDescription().isEmpty()) {
			throw new BackPageRestfulException(Define.NO_VALID_DESCRIPTION, HttpStatus.BAD_REQUEST);
		}
		Product entity = productService.findById(dto.getPId());
		
		if (dto.getFile().get(0).getSize() != 0) {
			String filePath = "";
			// 등록 작업
			for(MultipartFile i : dto.getFile()) {
				String convertFile = fileService.uploadFileProcess(i);
				filePath += convertFile + ",";
			}
			// 위의 작업이 끝났다면
			filePath.substring(0 , filePath.length() - 2);
			entity.setFile(filePath);
		} 
		
		entity.setName(dto.getName());
		entity.setAddress(dto.getAddr1() + " " + dto.getAddr2());
		entity.setPrice(dto.getPrice());
		entity.setDescription(dto.getDescription());
		
		int result = productService.updateProduct(entity);
		if(result == 0) {
			throw new BackPageRestfulException(Define.INTERVAL_SERVER_ERROR, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return "redirect:/product/product-list";
	}
	
	@DeleteMapping("/delete/{pId}")
	public String deleteProduct(@PathVariable(value = "pId") Integer pId) {
		OauthDTO user = (OauthDTO) httpSession.getAttribute("principal");
		if (user == null) {
			throw new LoginRestfulException(Define.ENTER_YOUR_LOGIN, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		int result = productService.adminDeleteProduct(pId);
		if(result == 0) {
			throw new BackPageRestfulException(Define.INTERVAL_SERVER_ERROR, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return "redirect:/product/product-list";
	}

	/**
	 * 페이지 이동하기
	 * 
	 * @return
	 */
	@GetMapping("/product-list")
	public String productList() {
		return "product/product_list";
	}
}
