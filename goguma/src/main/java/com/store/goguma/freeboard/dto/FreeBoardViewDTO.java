package com.store.goguma.freeboard.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class FreeBoardViewDTO {

	private Integer freeBoardId;
	private Integer view;
}
