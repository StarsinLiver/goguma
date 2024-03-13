package com.store.goguma.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.store.goguma.admin.dto.PageReqDTO;
import com.store.goguma.entity.EmojiHistory;
import com.store.goguma.service.AdminService;
import com.store.goguma.user.dto.OauthDTO;
import com.store.goguma.user.dto.my.EmojiHistoryReqDTO;
import com.store.goguma.user.dto.my.EmojiHistoryResDTO;

import jakarta.servlet.http.HttpSession;
import lombok.extern.log4j.Log4j2;

@Log4j2
@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private HttpSession httpSession;

	@Autowired
	private AdminService adminService;

	// 관리자 마이 페이지
	// localhost://admin/modiUser
	@GetMapping("/user")
	public String User(Model model) {

		OauthDTO principal = (OauthDTO) httpSession.getAttribute("principal");
		
		OauthDTO updateUser = adminService.selectAdminByUid(principal.getUId());

		model.addAttribute("user", updateUser);
		
		log.info("셀렉트한 유저 마이페이지 데이터 "+ updateUser);
		

		return "admin/admin_user";
	}

	// admin 개인정보 update 페이지
	@GetMapping("/modify")
	public String adminModify(Model model) {

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

	// 이모지 페이지
	// 이모지 리스트 출력, 페이징
	@GetMapping("/emoji")
	public String managementEmoji() {

		
		
		return "admin/emoji_management";
	}

	
	/* 
	 * admin 상품 결제 이력 관리 페이지
	 * 결제 이력 리스트 출력, 페이징
     */ 
	@GetMapping("/history")
	public String salesHistory(EmojiHistoryReqDTO historyReqDTO, Model model, PageReqDTO page) {
		log.info("history로 들어오는 pagedto"+page);
		
		EmojiHistoryResDTO list = adminService.selectAllPayHistoryByY(historyReqDTO);	
		
		model.addAttribute("histories", list.getDtoList());
		model.addAttribute("pg", list.getPg());
		model.addAttribute("start", list.getStart());
		model.addAttribute("end", list.getEnd());
		model.addAttribute("last", list.getLast());
		
		
		return "admin/admin_payment_history";
	}

	// admin 활불 사유 검색 ajax
	@PostMapping("/payment-reason")
	public String paymentReasonProc(String merchantId) {
		
		// merchantId로 환불 사유 검색
		EmojiHistory cancel = adminService.selectCancelByMaerchantId(merchantId); 
		 
		String reason = cancel.getCancelReason();
		
		log.info("돌아오는 리즌 데이터 확인: "+reason);
		
		return reason;
	}
	
	// admin 환불 처리 ajax
	@PostMapping("/payment-confirm")
	public void updateConfirmPayment(String merchantId) {
		
		// merchantId로 환불 사유 검색
		adminService.updateConfirmPayment(merchantId); 
		
	}
	
	
	
	@GetMapping("/notice")
	public String managementNotice() {

		return "";
	}

	@GetMapping("/report")
	public String managementReport() {

		return "";
	}

	@GetMapping("/product")
	public String managementProduct() {

		return "";
	}

	@GetMapping("/banner")
	public String managementBanner() {

		return "";
	}

}
