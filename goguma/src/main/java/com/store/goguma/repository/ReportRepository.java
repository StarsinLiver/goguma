package com.store.goguma.repository;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.store.goguma.entity.Report;


@Mapper
public interface ReportRepository {

	public int addReport(Report report);

	public boolean existsByHostIdAndCallId(@Param("hostId") Integer hostId, @Param("callId")  Integer callId);
	
	// 관리자가 신고 취소를 했을 때
	public int update(int id);
	
	public int countTemperatureUser(int userId);
}
