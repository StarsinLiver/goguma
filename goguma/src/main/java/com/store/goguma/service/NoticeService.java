package com.store.goguma.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.store.goguma.entity.Notice;
import com.store.goguma.repository.NoticeRepository;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class NoticeService {
	
	@Autowired
	private NoticeRepository repository;

	public List<com.store.goguma.entity.Notice> getNoticeList() {
		return repository.getNoticeList();
	}

	public Notice getNoticeDetail(int id) {
		return repository.getNoticeDetail(id);
	}
	

}
