package com.store.goguma.product.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.store.goguma.product.dto.ProductSearchDto;
import com.store.goguma.product.utils.ProductType;
import com.store.goguma.service.ProductService;
import com.store.goguma.utils.page.PageReq;
import com.store.goguma.utils.page.PageRes;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
@RequestMapping("/product")
@RequiredArgsConstructor
public class ProductRestController {

	private final ProductService productService;

	@GetMapping("/search-product")
	public ResponseEntity<?> searchProduct(
			@RequestParam(value = "sortWishList", defaultValue = "N") String sortWishList,
			@RequestParam(value = "sortChatRoom", defaultValue = "N") String sortChatRoom,
			@RequestParam(value = "sortHighPrice", defaultValue = "N") String sortHighPrice,
			@RequestParam(value = "sortLowPrice", defaultValue = "N") String sortLowPrice,
			@RequestParam(value = "search", defaultValue = "") String search,
			@RequestParam(value = "searchAddress", defaultValue = "") String searchAddress,
			@RequestParam(value = "lowPrice", defaultValue = "0") Integer lowPrice,
			@RequestParam(value = "highPrice", defaultValue = "999999999") Integer highPrice,
			@RequestParam(value = "page", defaultValue = "0") Integer page,
			@RequestParam(value = "size", defaultValue = "20") Integer size) {
		try {

			log.info("들어 오는감");
			log.info("sortWishList : " + sortWishList);
			log.info("sortChatRoom : " + sortChatRoom);
			log.info("sortHighPrice : " + sortHighPrice);
			log.info("sortLowPrice : " + sortLowPrice);
			log.info("search : " + search);
			log.info("searchAddress : " + searchAddress);
			log.info("lowPrice : " + lowPrice);
			log.info("highPrice : " + highPrice);
			log.info("page : " + page);
			log.info("size : " + size);
			// 가격 작은 값이 높은값보다 높다면
			if (lowPrice > highPrice) {
				return new ResponseEntity<>(ProductType.NO_VALID_PRICE, HttpStatus.BAD_REQUEST);
			}
			// 0 보다 작은 값을 가져왔다면
			if (lowPrice < 0) {
				return new ResponseEntity<>(ProductType.NO_VALID_PRICE, HttpStatus.BAD_REQUEST);
			}
			if (highPrice < 0) {
				return new ResponseEntity<>(ProductType.NO_VALID_PRICE, HttpStatus.BAD_REQUEST);
			}

			PageReq pageReq = new PageReq(page, size);
			PageRes<ProductSearchDto> pageRes = productService.searchAll(search, searchAddress, lowPrice, highPrice,
					sortWishList, sortChatRoom, sortLowPrice, sortHighPrice, pageReq);

			return new ResponseEntity<>(pageRes, HttpStatus.OK);
		} catch (Exception e) {
			log.info(e.getMessage());
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
}
