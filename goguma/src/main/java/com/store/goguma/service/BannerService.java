package com.store.goguma.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.store.goguma.entity.Banner;
import com.store.goguma.repository.BannerRepository;
import com.store.goguma.user.dto.my.RequestPageDTO;
import com.store.goguma.user.dto.my.ResponsePageDTO;
import com.store.goguma.utils.BannerType;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
@RequiredArgsConstructor
public class BannerService {
	
	private final BannerRepository bannerRepository;
	
	/**
	 * 배너 전체 조회
	 * @param pageDTO
	 * @return
	 */
	public ResponsePageDTO findAll(RequestPageDTO pageDTO) {
		int start = (pageDTO.getPg() -1) * pageDTO.getSize();
		
		List<Banner> list = bannerRepository.findAll(start , pageDTO.getSearch() , pageDTO.getSearchType());
		int count = bannerRepository.countFindAll(pageDTO.getSearch() , pageDTO.getSearchType());
		return ResponsePageDTO.builder()
				.requestPageDTO(pageDTO)
				.dtoList(list)
				.total(count)
				.build();
	}
	
	/**
	 * 배너 상세 조회
	 * @param id
	 * @return
	 */
	public Banner findById(int id) {
		
		
		
		return bannerRepository.findById(id);
	}
	
	/**
	 * 배너 등록
	 * @param banner
	 * @return
	 */
	@Transactional
	public int insert(Banner banner) {
		return bannerRepository.insert(banner);
	}
	
	/**
	 * 배너 업데이트
	 * @param banner
	 * @return
	 */
	@Transactional
	public int update(Banner banner) {
		return bannerRepository.update(banner);
	}
	
	/**
	 * 배너 삭제
	 * @param id
	 * @return
	 */
	@Transactional
	public int delete(int id) {
		return bannerRepository.delete(id);
	}
	
	/**
	 * 배너 전체 출력
	 * @param type 
	 * @return
	 */
	@Transactional
	public List<Banner> findByAll(BannerType type) {
		return bannerRepository.findByAll(type);
	}

	public void PlusBannerViewCount(int id) {

		bannerRepository.plusBannerViewCount(id);
	}
}
