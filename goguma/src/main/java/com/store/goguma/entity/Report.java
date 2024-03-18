package com.store.goguma.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
@Builder
public class Report {

	private Integer id;
	private Integer hostId;
	private Integer callId;
	private String reson;
	private String createAt;
	private String updateAt;
	private String deleteAt;
	private String deleteYn;
}
