package com.store.goguma.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.store.goguma.entity.EmojiHistory;
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
	
	// adminUser 업데이트 
	public void modifyAdminByEmail(OauthDTO dto) {
		
		repository.modifyAdminByEmail(dto);
	}

	// adminUser Uid로 select 
	public OauthDTO selectAdminByUid(Integer uId) {
	
		return repository.selectAdminByUid(uId);
		
		
	}


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

	
	
	
}
