package com.store.goguma.product.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.store.goguma.product.dto.ProductDTO;
import com.store.goguma.service.ProductService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class ProductController {
	
	@Autowired
	ProductService productService;

	@GetMapping("/productDetail")
    public String productDetail(@RequestParam(value = "pId") Integer pId, Model model) {
		ProductDTO productDTO = productService.findAllBypId(pId);
        List<ProductDTO> productList = productService.findAllProduct();
        
        log.info(productList.toString());

        model.addAttribute("product", productDTO);
        model.addAttribute("productList", productList);
        
        return "/product/detail";
	}
	
	@GetMapping("/userProduct")
    public String userProduct(@RequestParam(name = "pId", required = true) Integer pId, Model model)  {
		
        ProductDTO productDTO = productService.findAllBypId(pId);
        
        model.addAttribute("product", productDTO);
        
        return "/product/userProduct";
	}
}
