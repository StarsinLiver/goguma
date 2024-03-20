package com.store.goguma.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.store.goguma.cs.dto.FaqRequestDto;
import com.store.goguma.entity.Faq;
import com.store.goguma.repository.FaqRepository;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class FaqService {
	
	@Autowired
	private FaqRepository repository;

	public List<Faq> getFaqList() {
		return repository.getFaqList();
	}

	public boolean faqWrite(FaqRequestDto dto) {
		int result = repository.faqWrite(dto.toEntity());
		return result != 0;
	}
	
	/**
	 * 상세 조회
	 * @param id
	 * @return
	 */
	public Faq findById(int id) {
		return repository.findById(id);
	}

	/**
	 * 자주 묻는 질문 업데이트
	 * @param faq
	 * @return
	 */
	public int update(Faq faq) {
		return repository.update(faq);
	}
	
	/**
	 * 자주 묻는 질문 삭제
	 * @param id
	 * @return
	 */
	public int deleteById(int id) {
		return repository.deleteById(id);
	}
}
