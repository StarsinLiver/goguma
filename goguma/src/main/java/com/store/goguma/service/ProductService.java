package com.store.goguma.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.store.goguma.entity.Product;
import com.store.goguma.product.dto.ProductDTO;
import com.store.goguma.product.dto.ProductSearchDto;
import com.store.goguma.product.dto.ProductUserDto;
import com.store.goguma.repository.ProductRepository;
import com.store.goguma.utils.page.PageReq;
import com.store.goguma.utils.page.PageRes;

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
	public List<ProductUserDto> findByHostId(Integer hostId) {

	    List<ProductUserDto> userProdList = productRepository.findByHostId(hostId);
	    return userProdList;
	}
	
	/**
	 * 전체 검색 조회
	 * @param search
	 * @param searchAdress
	 * @param lowPrice
	 * @param highPrice
	 * @param sortWishList
	 * @param sortChatRoom
	 * @param sortLowPrice
	 * @param sortHighPrice
	 * @param page
	 * @return
	 */
	public PageRes<ProductSearchDto> searchAll(String search , String searchAddress ,int lowPrice , int highPrice , String sortWishList , String sortChatRoom , String sortLowPrice , String sortHighPrice , PageReq page) {

		List<ProductSearchDto> list = productRepository.searchAll(search, searchAddress, lowPrice, highPrice, sortWishList, sortChatRoom, sortLowPrice, sortHighPrice, page);
		int count = productRepository.countSearchAll(search, searchAddress, lowPrice, highPrice);
		PageRes<ProductSearchDto> pageRes = new PageRes<>(list , page.getPage() , count , page.getSize());
		return pageRes;
	}
}
