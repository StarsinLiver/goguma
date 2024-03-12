package com.store.goguma.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;

import com.store.goguma.service.OauthService;
import com.store.goguma.user.dto.GoogleProfile;
import com.store.goguma.user.dto.KakaoProfile;
import com.store.goguma.user.dto.NaverProfile;
import com.store.goguma.user.dto.OAuthToken;
import com.store.goguma.user.dto.OauthDTO;
import com.store.goguma.user.dto.OauthResisterDTO;

import jakarta.servlet.http.HttpSession;
import lombok.extern.log4j.Log4j2;

@Log4j2
@RequestMapping("/oauth")
@Controller
public class OauthController {

	@Autowired
	private HttpSession httpSession;

	@Autowired
	private OauthService oauthService;

	/*
	 * @RequestMapping("/user") 때문에 /user 가 달려있다. 카카오 디벨로퍼에서 redirect key 를 줄바꿈으로
	 * 10개까지 등록 가능하다. 해서 http://localhost:80/user/kakao-callback?code="xxxxxxxxxx"
	 * 처럼 만들어준다. 즉 /user대문을 달아도 요청 가능하게 해주자.
	 */
	// http://localhost:80/oauth/kakao-callback?code="xxxxxxxxx"
	// 카카오 로그인
	@GetMapping("/kakao-callback")
	public String kakaoCallback(@RequestParam String code) {

		// POST 방식 , Header 구성, body 구성
		System.out.println("code :  " + code);

		RestTemplate rt1 = new RestTemplate();
		// 헤더 구성
		HttpHeaders headers1 = new HttpHeaders();
		headers1.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
		// body 구성
		MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
		params.add("grant_type", "authorization_code");
		params.add("client_id", "aeff9f33b9d74346008005686767c513");
		params.add("redirect_uri", "http://localhost/oauth/kakao-callback");
		params.add("code", code);

		System.out.println("params:  " + params.toString());

		// 헤더 + 바디 결합
		HttpEntity<MultiValueMap<String, String>> reqMsg = new HttpEntity<>(params, headers1);

		System.out.println("reqMsg:   " + reqMsg.toString());

		ResponseEntity<OAuthToken> response = rt1.exchange("https://kauth.kakao.com/oauth/token", HttpMethod.POST,
				reqMsg, OAuthToken.class);

		System.out.println("response:  " + response.toString());

		System.out.println("================================================");

		// 다시 요청하기 -- 인증 토큰 -- 사용자 정보 요청
		RestTemplate rt2 = new RestTemplate();
		// 헤더
		HttpHeaders headers2 = new HttpHeaders();
		headers2.add("Authorization", "Bearer " + response.getBody().getAccessToken());
		headers2.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
		// 바디 x
		// 결합
		HttpEntity<MultiValueMap<String, String>> kakaoInfo = new HttpEntity<>(headers2);
		ResponseEntity<KakaoProfile> response2 = rt2.exchange("https://kapi.kakao.com/v2/user/me", HttpMethod.POST,
				kakaoInfo, KakaoProfile.class);

		System.out.println(response2.getBody());

		/*
		 * 로그인 처리 단 최초 요청 사용자라면 회원 가입 처리 후 로그인 처리
		 * 
		 * 현재 로그인시 signUpFormDto와
		 */

		// 최초 사용자 판단 여부 -- 사용자 username 존재 여부 확인
		// 로컬의 유저네임과 카카오의 유저네임이 동일 할 수 있음(문제 발생)
		KakaoProfile kakaoProfile = response2.getBody();

		OauthResisterDTO dto = OauthResisterDTO.builder().email(kakaoProfile.getKakao_account().getEmail())
				.name(kakaoProfile.getProperties().getNickname()).social("kakao_").build();

		OauthDTO oldUser = oauthService.readUserByUserEmail(dto.getEmail(), dto.getSocial());

		if (oldUser != null) {
			httpSession.setAttribute("principal", oldUser);

			return "redirect:/";
		} else {
			httpSession.setAttribute("principal", dto);

			return "redirect:/oauth/register";
		}

		/*
		 * 
		 * 최초 가입이라면 oldUser에는 null이 담겨 있다. 해서 아래 두가지 처리
		 * oldUser.setUsername(dto.getUsername());
		 * oldUser.setFullname(dto.getFullname());
		 *
		 */
		/*
		 * if(oldUser == null) { oauthService.createUser(dto);
		 * 
		 * 
		 * 267라인 oldUser가 null 값이 들어올 때 java.lang.NullPointerException Cannot invoke
		 * "com.tenco.bank.repository.entity.User.setUsername(String)" because "oldUser"
		 * is null
		 * 
		 * 
		 * oldUser= new ResOauthUserDTO();
		 * 
		 * oldUser.setUsername(dto.getUsername());
		 * oldUser.setFullname(dto.getFullname()); }
		 */

		// 로그인 처리

		// 단 최초 요청 사용자라면 회원 가입 처리 후 로그인 처리

	}

	// 구글 로그인
	@GetMapping("/google-callback")
	public String googleCallback(@RequestParam("code") String accessCode) {

		RestTemplate rt1 = new RestTemplate();
		MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
		params.add("code", accessCode);
		params.add("client_id", "904444894015-12c8uvpetvighnf4n2083r1g0b6ibv62.apps.googleusercontent.com");
		params.add("client_secret", "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");
		params.add("redirect_uri", "http://localhost/oauth/google-callback");
		params.add("grant_type", "authorization_code");

		ResponseEntity<OAuthToken> response1 = rt1.postForEntity("https://oauth2.googleapis.com/token", params,
				OAuthToken.class);

		// 액세스 토큰 -> 사용자 정보
		RestTemplate rt2 = new RestTemplate();
		HttpHeaders headers2 = new HttpHeaders();

		headers2.add("Authorization", "Bearer " + response1.getBody().getAccessToken());
		HttpEntity<MultiValueMap<String, String>> googleInfo = new HttpEntity<>(headers2);
		ResponseEntity<GoogleProfile> response2 = rt2.exchange("https://www.googleapis.com/userinfo/v2/me",
				HttpMethod.GET, googleInfo, GoogleProfile.class);

		System.out.println(response2.getBody());
		GoogleProfile googleProfile = response2.getBody();
		System.out.println(response2.getBody());
		OauthResisterDTO dto = OauthResisterDTO.builder().name(googleProfile.getName()).email(googleProfile.getEmail())
				.social("google_").build();

		OauthDTO oldUser = oauthService.readUserByUserEmail(dto.getEmail(), dto.getSocial());

		if (oldUser != null) {

			httpSession.setAttribute("principal", oldUser);

			return "redirect:/";
		} else {

			httpSession.setAttribute("principal", dto);

			return "redirect:/oauth/register";
		}

	}

	// 네이버 로그인
	@GetMapping("/naver-callback")
	public String naverCallback(@RequestParam("code") String accessCode) {

		RestTemplate rt1 = new RestTemplate();
		HttpHeaders headers1 = new HttpHeaders();
		headers1.add("Content-type", "application/x-www-form-urlencoded; charset=utf-8");
		MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
		params.add("grant_type", "authorization_code");
		params.add("client_id", "OoIwslayQE_qOrByEI0U");
		params.add("client_secret", "Ij6j_GrSZd");
		params.add("code", accessCode);
		params.add("state", "STATE_STRING");

		HttpEntity<MultiValueMap<String, String>> reqMsg = new HttpEntity<>(params, headers1);

		ResponseEntity<OAuthToken> response = rt1.exchange("https://nid.naver.com/oauth2.0/token", HttpMethod.POST,
				reqMsg, OAuthToken.class);

		RestTemplate rt2 = new RestTemplate();
		HttpHeaders headers2 = new HttpHeaders();
		headers2.add("Authorization", "Bearer " + response.getBody().getAccessToken());
		headers2.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
		HttpEntity<MultiValueMap<String, String>> naverInfo = new HttpEntity<>(headers2);

		ResponseEntity<NaverProfile> response2 = rt2.exchange("https://openapi.naver.com/v1/nid/me", HttpMethod.POST,
				naverInfo, NaverProfile.class);

		NaverProfile naverProfile = response2.getBody();
		
		OauthResisterDTO dto = OauthResisterDTO.builder()
				.name(naverProfile.getResponse().getName())
				.email(naverProfile.getResponse().getEmail())
				.social("naver_").build();
		
		OauthDTO oldUser = oauthService.readUserByUserEmail(dto.getEmail(), dto.getSocial());

		if (oldUser != null) {

			httpSession.setAttribute("principal", oldUser);

			return "main";
		} else {

			httpSession.setAttribute("principal", dto);

			return "redirect:/oauth/register";
		}


	}

	// localhost://oauth/register
	// 최초 로그인 추가정보 페이지
	@GetMapping("/register")
	public String OauthRegister() {

		return "login/oauthRegister";
	}

	
	// 최초 로그인 추가정보 프로세스
	@PostMapping("/register")
	public String OauthRegisterProc(OauthResisterDTO dto) {

		OauthResisterDTO user = (OauthResisterDTO) httpSession.getAttribute("principal");

		String address = dto.getAddr1() + dto.getAddr2();

		OauthResisterDTO userDTO = OauthResisterDTO.builder().email(user.getEmail()).address(address)
				.name(user.getName()).social(user.getSocial()).zip(dto.getZip()).tel(dto.getTel()).file(user.getFile())
				.build();

		int result = oauthService.createUser(userDTO);
		OauthDTO oldUser = oauthService.readUserByUserEmail(user.getEmail(), user.getSocial());
		log.info(oldUser.toString());

		httpSession.setAttribute("principal", oldUser);

		return "redirect:/";
	}

}
