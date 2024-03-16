package com.store.goguma.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.store.goguma.admin.dto.AdminReportDTO;
import com.store.goguma.admin.dto.EmojiModifyDTO;
import com.store.goguma.admin.dto.PageReqDTO;
import com.store.goguma.entity.EmojiHistory;
import com.store.goguma.report.dto.ReportDTO;
import com.store.goguma.repository.AdminRepository;
import com.store.goguma.user.dto.OauthDTO;
import com.store.goguma.user.dto.my.EmojiHistoryReqDTO;
import com.store.goguma.user.dto.my.EmojiHistoryResDTO;

import lombok.extern.log4j.Log4j2;


@Log4j2
@Service
public class AdminService {

	@Autowired
	private AdminRepository repository;
	
	@Autowired
	private EmojiUploadService emojiService;
	
	
	// adminUser 업데이트 
	public void modifyAdminByEmail(OauthDTO dto) {
		
		repository.modifyAdminByEmail(dto);
	}

	// adminUser Uid로 select 
	public OauthDTO selectAdminByUid(Integer uId) {
	
		return repository.selectAdminByUid(uId);
		
		
	}

	// 환불 사유 페이징, 리스트 출력
	public EmojiHistoryResDTO selectAllPayHistoryByY(EmojiHistoryReqDTO historyReqDTO) {
		
		int start = (historyReqDTO.getPg() - 1) * historyReqDTO.getSize();
		log.info("start : "+start);
		
		List<EmojiHistory> history = repository.findEmojiHistoryByUser(start);
		int total = repository.countEmojiHistoryByCancleY();
		log.info("total : "+total);
		
		
		
		return EmojiHistoryResDTO.builder()
				.emojiHistoryReqDTO(historyReqDTO)
				.dtoList(history)
				.total(total)
				.build();
	}

	// 환불 사유 검색
	public EmojiHistory selectCancelByMaerchantId(String merchantId) {

		return repository.selectCancelByMaerchantId(merchantId);
		
	}
	
	// 환불 완료
	public void updateConfirmPayment(String merchantId) {
		
		repository.updateConfirmPayment(merchantId);
		
	}

	public boolean modifyAdminEmojiModify(EmojiModifyDTO dto, List<MultipartFile> file) {

		String fileName = emojiService.uploadFileProcess(file.get(0));
		
		
		
		
		return repository.modifyAdminEmojiModify(dto);
	}

	public AdminReportDTO selectReportAll(PageReqDTO dto) {

		int start = (dto.getPg() - 1) * dto.getSize();
		log.info("start : "+start);
		
		List<ReportDTO> report = repository.selecReportAll(start);
		int total = repository.countReportAll();
		
		
		return AdminReportDTO.builder()
						.pageReqDTO(dto)
						.dtoList(report)
						.total(total)
						.build()
						;
	}

	public ReportDTO selectReportReasonById(int id) {

		return repository.selectReportReasonById(id);
		
	}


	
	
	
	
	
}
