package com.store.goguma.product.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.store.goguma.product.dto.ProductDTO;
import com.store.goguma.service.ProductService;
import com.store.goguma.service.UserService;
import com.store.goguma.user.dto.UserDTO;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class ProductController {
	
	@Autowired
	ProductService productService;
	@Autowired
	UserService userService;
	
	
	// 상품 상세 페이지
	// http://localhost/productDetail?pId=1
	@GetMapping("/productDetail")
    public String productDetail(@RequestParam(value = "pId") Integer pId, Model model) {
		ProductDTO productDTO = productService.findAllBypId(pId);
        List<ProductDTO> productList = productService.findAllProduct();
        
        log.info(productList.toString());

        model.addAttribute("product", productDTO);
        model.addAttribute("productList", productList);
        
        return "/product/detail";
	}
	
	// 유저 상품 페이지
	// http://localhost/userProduct?uId=1
	@GetMapping("/userProduct")
	public String userProduct(@RequestParam(value = "uId") Integer uId, Model model)  {
	    
	    List<ProductDTO> userProdList = productService.findByHostId(uId);
	    UserDTO userDTO = userService.findAllByuId(uId);

	    userProdList.get(0).getPid();
	    log.info("유저상품 : " +userProdList.toString());
	    
	    model.addAttribute("userProdList", userProdList);
	    model.addAttribute("user", userDTO);
	    
	    return "product/userProduct";
	}	
}
