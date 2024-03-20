package com.store.goguma.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.store.goguma.entity.Faq;

@Mapper
public interface FaqRepository {

	public List<Faq> getFaqList();

	public int faqWrite(Faq entity);

	public Faq findById(int id);
	public int update(Faq faq);
	public int deleteById(int id);
}
