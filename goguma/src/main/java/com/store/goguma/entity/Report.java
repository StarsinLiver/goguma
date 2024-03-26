package com.store.goguma.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Report {

	private Integer id;
	private Integer hostId;
	private Integer callId;
	private String reason;
	private String createAt;
	private String updateAt;
	private String deleteAt;
	private String deleteYn;
}
