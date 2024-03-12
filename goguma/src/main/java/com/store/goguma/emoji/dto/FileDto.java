package com.store.goguma.emoji.dto;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @fileName : FileDto.java
 * @Project : goguma
 * @Date : 2024. 3. 11.
 * @작성자 : 강민
 * @설명 : 
 */

@NoArgsConstructor
@AllArgsConstructor
@Data
public class FileDto {

	private List<MultipartFile> file;
}
