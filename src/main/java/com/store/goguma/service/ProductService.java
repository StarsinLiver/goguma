package com.store.goguma.service;

import java.util.List;

import org.apache.http.HttpStatus;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.store.goguma.entity.Product;
import com.store.goguma.product.dto.ProductDTO;
import com.store.goguma.repository.ProductRepository;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class ProductService {

	@Autowired
	ProductRepository productRepository;
	
	public ProductDTO findAllBypId(Integer pId) {
		
		Product product = productRepository.findAllBypId(pId);
		
//		// 확인
//		if (product == null) {
//			throw new CustomRestfulException("해당 상품이 없거나 오류가 발생하였습니다.", HttpStatus.SC_INTERNAL_SERVER_ERROR);
//		}
		
        ProductDTO dto = ProductDTO.builder()
                .pId(product.getPId())
                .address(product.getAddress())
                .name(product.getName())
                .price(product.getPrice())
                .hostId(product.getHostId())
                .description(product.getDescription())
                .file(product.getFile())
                .mainCategoryId(product.getMainCategoryId())
                .subCategoryId(product.getSubCategoryId())
                .createAt(product.getCreateAt())
                .updateAt(product.getUpdateAt())
                .deleteAt(product.getDeleteAt())
                .deleteYn(product.getDeleteYn())
                .confirmYn(product.getConfirmYn())
                .build();
        
        return dto;
		
	}
}
