package com.store.goguma.product.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.store.goguma.chat.dto.chatRoom.SaveRoomDTO;
import com.store.goguma.handler.exception.LoginRestfulException;
import com.store.goguma.product.dto.ProductDTO;
import com.store.goguma.product.dto.ProductUserDto;
import com.store.goguma.product.dto.WishListDTO;
import com.store.goguma.service.ChatRoomNameService;
import com.store.goguma.service.ChatRoomService;
import com.store.goguma.service.ProductService;
import com.store.goguma.service.UserService;
import com.store.goguma.service.WishListService;
import com.store.goguma.user.dto.OauthDTO;
import com.store.goguma.user.dto.UserDTO;
import com.store.goguma.utils.Define;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/product")
public class ProductController {
	
	@Autowired
	ProductService productService;
	@Autowired
	UserService userService;
	@Autowired
	ChatRoomService chatRoomService;
	@Autowired
	WishListService wishListService;
	@Autowired
	ChatRoomNameService chatRoomNameService;
	
	@Autowired
	HttpSession httpSession;
	
	// 상품 상세 페이지
	// http://localhost/productDetail?pId=1
	@GetMapping("/productDetail")
	public String productDetail(@RequestParam(value = "pId") Integer pId, Model model, HttpSession session) {
	    ProductDTO productDTO = productService.findAllBypId(pId);
	    List<ProductDTO> productList = productService.findAllProduct();
	    
	    // 찜 버튼을 눌렀을 때만 사용자 정보를 가져오도록 수정
	    OauthDTO user = (OauthDTO) session.getAttribute("principal");
	    Integer uId = null;
	    boolean prodWishlist = false;

	    if (user != null) {
	        uId = user.getUId();
	        prodWishlist = wishListService.prodWishlist(uId, pId);
	    }

	    model.addAttribute("prodWishlist", prodWishlist);

	    // 사용자 정보가 null이 아닌 경우, DTO에 사용자 정보 설정
	    UserDTO userDTO = null;
	    if (uId != null) {
	        userDTO = userService.findAllByuId(uId);
	    }
	    
	    log.info("사용자 정보: {}", user);
	    model.addAttribute("product", productDTO);
	    model.addAttribute("productList", productList);    
	    model.addAttribute("user", userDTO);
	    
	    return "/product/detail";
	}
	
	// 채팅 방 생성
	@PostMapping("/saveRoom")
	public String saveRoom(SaveRoomDTO dto) {
		
		
		OauthDTO user = (OauthDTO) httpSession.getAttribute("principal");
		if (user == null) {
			// 오류 로직 처리
		}
		
		// chat_room 저장
		dto.setUId(user.getUId());
		log.info("방개설 : "+ dto.toString());
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
	    	throw new LoginRestfulException(Define.ENTER_YOUR_LOGIN, HttpStatus	.INTERNAL_SERVER_ERROR);
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
			throw new LoginRestfulException(Define.ENTER_YOUR_LOGIN, HttpStatus	.INTERNAL_SERVER_ERROR);
		}
		dto.setPId(pId);
		dto.setUId(user.getUId());
		
		wishListService.deleteWishList(dto);
		
		return "redirect:/product/productDetail?pId=" + pId;
	}

	// 유저 상품 페이지
	// http://localhost/userProduct?uId=1
	@GetMapping("/userProduct")
	public String userProduct(@RequestParam(value = "uId") Integer uId, Model model)  {
	    
	    List<ProductUserDto> userProdList = productService.findByHostId(uId);
	    UserDTO userDTO = userService.findAllByuId(uId);
	    
	    
	    
	    model.addAttribute("userProdList", userProdList);
	    model.addAttribute("user", userDTO);
	    
	    return "product/userProduct";
	}	
	
	/**
	 * 페이지 이동하기
	 * @return
	 */
	@GetMapping("/product-list")
	public String productList() {
		return "product/product_list";
	}
}
