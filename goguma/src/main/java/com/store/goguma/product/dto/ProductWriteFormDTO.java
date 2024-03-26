package com.store.goguma.product.dto;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ProductWriteFormDTO {

	private Integer pId;
	private String zip;
	private String addr1;
	private String addr2;
	private String name;
	private Integer price;
	private Integer hostId;
	private String description;
	private List<MultipartFile> file;
	private Integer mainCategoryId;
	private Integer subCategoryId;
	private String createAt;
	private String updateAt;
	private String deleteAt;
	private String deleteYn;
	private String confirmYn;
	private Integer countChatRoom;
	private Integer countWishList;
}
