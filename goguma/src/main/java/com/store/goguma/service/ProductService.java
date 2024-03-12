package com.store.goguma.service;

import java.util.ArrayList;
import java.util.List;

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
	
	public List<ProductDTO> findAllProduct() {
	    List<Product> productList = productRepository.findAllProduct();

	    List<ProductDTO> productDTOList = new ArrayList<>();

	    for (Product product : productList) {
	        ProductDTO productDTO = ProductDTO.builder()
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

	        productDTOList.add(productDTO);
	    }
	    return productDTOList;
	}
	
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
	
	// 유저가 등록한 상품목록 조회
	public List<ProductDTO> findByHostId(Integer hostId) {

	    List<Product> userProdList = productRepository.findByHostId(hostId);
	    List<ProductDTO> userProdListDTO = new ArrayList<>();

	    for (Product product : userProdList) {
	        ProductDTO productDTO = new ProductDTO();
	        productDTO.setPId(product.getPId());
	        productDTO.setAddress(product.getAddress());
	        productDTO.setName(product.getName());
	        productDTO.setPrice(product.getPrice());
	        productDTO.setHostId(product.getHostId());
	        productDTO.setDescription(product.getDescription());
	        productDTO.setFile(product.getFile());
	        productDTO.setMainCategoryId(product.getMainCategoryId());
	        productDTO.setSubCategoryId(product.getSubCategoryId());
	        productDTO.setCreateAt(product.getCreateAt());
	        productDTO.setUpdateAt(product.getUpdateAt());
	        productDTO.setDeleteAt(product.getDeleteAt());
	        productDTO.setDeleteYn(product.getDeleteYn());
	        productDTO.setConfirmYn(product.getConfirmYn());

	        userProdListDTO.add(productDTO);
	    }
	    return userProdListDTO;
	}
}
