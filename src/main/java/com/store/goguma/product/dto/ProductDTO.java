package com.store.goguma.product.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@ToString
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ProductDTO {

    private Integer pId;
    private String address;
    private String name;
    private Integer price;
    private Integer hostId;
    private String description;
    private String file;
    private Integer mainCategoryId;
    private Integer subCategoryId;
    private String createAt;
    private String updateAt;
    private String deleteAt;
    private String deleteYn;
    private String confirmYn;
}
