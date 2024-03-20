package com.store.goguma.service;

import org.springframework.stereotype.Service;

import com.store.goguma.entity.FreeBoardRecommendation;
import com.store.goguma.freeboard.dto.FreeBoardRecommendationDTO;
import com.store.goguma.repository.FreeBoardRecommendationRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class FreeBoardRecommendationService {

	private final FreeBoardRecommendationRepository freeBoardRecommendationRepository;
	
	public void addRecommendation(FreeBoardRecommendationDTO dto) {
		
		FreeBoardRecommendation fbRecommendation = FreeBoardRecommendation.builder()
				.freeBoardId(dto.getFreeBoardId())
				.uId(dto.getUId())
				.build();
		
		freeBoardRecommendationRepository.addRecommendation(fbRecommendation);
	}
	
	public void deleteRecommendation(FreeBoardRecommendationDTO dto) {
		
		FreeBoardRecommendation fbRecommendation = FreeBoardRecommendation.builder()
				.freeBoardId(dto.getFreeBoardId())
				.uId(dto.getUId())
				.build();
		
		freeBoardRecommendationRepository.deleteRecommendation(fbRecommendation);
	}
	
    // 이미 좋아요 했는지 확인
    public boolean findRecommendation(int uId, int freeBoardId) {
        int count = freeBoardRecommendationRepository.findRecommendation(freeBoardId, uId);

        return count > 0;
    }
}
