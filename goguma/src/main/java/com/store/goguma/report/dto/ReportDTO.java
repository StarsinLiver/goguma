package com.store.goguma.report.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ReportDTO {

	private Integer id;
	private Integer hostId;
	private Integer callId;
	private String reason;
	private String createAt;
	private String updateAt;
	private String deleteAt;
	private String deleteYn;
	private Integer pId;
	private String hostName;
	private String callName;
	private String hostEmail;
	private String callEmail;
}
