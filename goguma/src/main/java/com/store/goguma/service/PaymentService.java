package com.store.goguma.service;

import org.json.simple.JSONObject;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import com.store.goguma.utils.payment.PaymentRefundDto;
import com.store.goguma.utils.payment.PaymentTokenDto;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class PaymentService {

	
	public final static RestTemplate restTemplate = new RestTemplate();

	
	public String getFortOneToken() {
//      1. 토큰 가져오기
//    Request Header 설정
      HttpHeaders headers = new HttpHeaders();
      headers.setContentType(MediaType.APPLICATION_JSON);

      // Request Body 설정
      JSONObject requestBody = new JSONObject();
      requestBody.put("imp_key", "6640183131657097"); // Rest API 키
      requestBody.put("imp_secret", "84d17513864db7cea3a806d2c138d6b2e87c5d6294b41586130ef7c4b6c2804f65a0b6cc4f2a673e"); // Rest API Secret 키

//헤더 + 바디 결합
      HttpEntity<?> entity = new HttpEntity(requestBody.toString(), headers);

//API 호출
      ResponseEntity<PaymentTokenDto> reqToken = restTemplate.exchange("https://api.iamport.kr/users/getToken", HttpMethod.POST, entity, PaymentTokenDto.class);


      String token = reqToken.getBody().getResponse().accessToken;


      log.info("토큰 정보 : " + token);
      
      return token;
	}
	
	
	/**
	 * 환불 정책 , Amount
	 * 
	 * @param token
	 * @param merchant_uid
	 * @param impUid
	 * @param reason
	 * @return
	 */
	public boolean refund(String token, String merchantUid, String reason , double amount) {
//      3. 검증 했다 치고 만약 검증이 잘못 됫다면 환불(취소)
//      네이버 페이 시 param 에 extra 넣어야 함 (나중에 추가할 수도)
//      파라미터 타입은 FormData
//      토큰이 필요한듯?

		// 시간 차이에 amount 값 확인
		// 포트원에 결제 정보 조회 == 결제 정보 사후 검증하기
		// Request Header 설정
		HttpHeaders headers3 = new HttpHeaders();
		headers3.setContentType(MediaType.APPLICATION_FORM_URLENCODED);
		headers3.add("Authorization", token);

		// Request Body 설정
		MultiValueMap<String, String> params3 = new LinkedMultiValueMap<>();
		// params3.add("imp_uid", impUid); // 내 키 (주의) (필수) <- 수정 imp_uid 또는 merchant_uid 둘 중 하나만 있어야함
		params3.add("merchant_uid", merchantUid); // 상품 넘버 (필수) -- 객체에서 가져오기
		params3.add("reason", reason); // 환불 사유 (선택)
		params3.add("amount", String.valueOf(amount)); // 환불 계좌 예금주 (선택)
		params3.add("refund_holder", ""); // 환불 계좌 예금주 (선택)
		params3.add("refund_bank", ""); // 환불 계좌 은행 코드 (부산은행) (선택)
		params3.add("refund_account", ""); // 환불 계좌 번호 (선택)
		params3.add("refund_tel", ""); // 환불 계좌 예금주 연락처 (선택)
//        params3.add("extra","");       // 네이버 페이 사용시 사용   (네이버페이 사용시 필수)

// 헤더 + 바디 결합
		HttpEntity<MultiValueMap<String, String>> entity3 = new HttpEntity<>(params3, headers3);

// API 호출
		// code = 0 이 환불 완료 / 나머지 환불 취소 오류
		ResponseEntity<PaymentRefundDto> refund = restTemplate.exchange("https://api.iamport.kr/payments/cancel", HttpMethod.POST,
				entity3, PaymentRefundDto.class);
		log.info("환불 신청 : " + refund);

//        Api 검증 
		if (refund.getBody() == null || refund.getBody().getCode() != 0) {
			log.info("환불 신청 메시지 : " + refund.getBody().getMessage());
			return false;
		}
		return true;
	}
}
