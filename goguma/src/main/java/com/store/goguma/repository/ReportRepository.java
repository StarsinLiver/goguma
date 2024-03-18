package com.store.goguma.repository;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.store.goguma.entity.Report;


@Mapper
public interface ReportRepository {

	public int addReport(Report report);

	public boolean existsByHostIdAndCallId(@Param("hostId") Integer hostId, @Param("callId")  Integer callId);
}
