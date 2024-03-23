package com.store.goguma.service;

import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.store.goguma.entity.Report;
import com.store.goguma.handler.exception.ReportException;
import com.store.goguma.report.dto.ReportDTO;
import com.store.goguma.repository.ReportRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ReportService {


	private final ReportRepository reportRepository;
	
	// 상품 페이지 - 유저 신고하기
	@Transactional
	public void addReport(ReportDTO dto) {
        // 호스트 ID와 유저 ID를 사용하여 이미 신고한 경우인지 확인
        boolean alreadyReported = reportRepository.existsByHostIdAndCallId(dto.getHostId(), dto.getCallId());
        if (alreadyReported) {
            throw new ReportException("이미 신고한 유저입니다.", HttpStatus.BAD_REQUEST);
        }
        
		Report report = Report.builder()
				.hostId(dto.getHostId())
				.callId(dto.getCallId())
				.reason(dto.getReason())
				.build();
		
		reportRepository.addReport(report);
	}
	
	/**
	 * 관리자가 신고 취소를 했을 때
	 * @param id
	 * @return
	 */
	@Transactional
	public int update(int id) {
		return reportRepository.update(id);
	}
}
