package com.store.goguma.report.dto;

import com.store.goguma.product.dto.ProductDTO;

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
public class ReportDTO {

	private Integer id;
	private Integer hostId;
	private Integer callId;
	private String reson;
	private String createAt;
	private String updateAt;
	private String deleteAt;
	private String deleteYn;
	private Integer pId;
}
