package com.store.goguma.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.store.goguma.cs.dto.NoticeRequestDto;
import com.store.goguma.entity.Notice;
import com.store.goguma.repository.NoticeRepository;
import com.store.goguma.user.dto.my.RequestPageDTO;
import com.store.goguma.user.dto.my.ResponsePageDTO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
@RequiredArgsConstructor
public class NoticeService {
	
	
	private final NoticeRepository repository;

	/**
	 * 전체 공지 사항 가져오기
	 * @return
	 */
	public List<com.store.goguma.entity.Notice> getNoticeList() {
		return repository.getNoticeList();
	}
	
	/**
	 * 어드민 공지사항 가져오기
	 * @param id
	 * @return
	 */
	public ResponsePageDTO adminFindAll(RequestPageDTO dto) {
		int start = (dto.getPg() - 1) * dto.getSize();
		
		List<Notice> list = repository.adminFindAll(start, dto.getSearch(), dto.getSearchType());
		int count = repository.countAdminFindAll(dto.getSearch(), dto.getSearchType());
		
		return ResponsePageDTO.builder().requestPageDTO(dto).dtoList(list).total(count).build();
	}
	

	public Notice getNoticeDetail(int id) {
		return repository.getNoticeDetail(id);
	}

	public boolean getNoticeWrite(NoticeRequestDto dto) {
		int result = repository.getNoticeWrite(dto.toEntity());
		return result != 0;
	}
	@Transactional
	public boolean noticeDelete(int id) {
		int result = repository.noticeDelete(id);
		return result != 0;
	}
	@Transactional
	public boolean noticeUpdate(NoticeRequestDto dto) {
		int result = repository.noticeUpdate(dto.toEntity());
		return result != 0;
	}
	
	public List<Notice>  findLimitEightFromMain() {
		return repository.findLimitEightFromMain();
	}
}
