package com.store.goguma.service;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.store.goguma.entity.User;
import com.store.goguma.handler.exception.BackPageRestfulException;
import com.store.goguma.repository.MyUserRepository;
import com.store.goguma.repository.ProductHistoryRepository;
import com.store.goguma.repository.ReportRepository;
import com.store.goguma.repository.UserRepository;
import com.store.goguma.user.dto.ModifyUserDto;
import com.store.goguma.user.dto.OauthDTO;
import com.store.goguma.user.dto.UserDTO;
import com.store.goguma.user.dto.UserProfileDto;
import com.store.goguma.user.dto.my.ProductHistoryDTO;
import com.store.goguma.user.dto.my.ProductHostDTO;
import com.store.goguma.user.dto.my.QnaUserDTO;
import com.store.goguma.user.dto.my.RequestPageDTO;
import com.store.goguma.user.dto.my.ResponsePageDTO;
import com.store.goguma.user.dto.my.UserEmojiDTO;
import com.store.goguma.user.dto.my.WishProductDTO;
import com.store.goguma.utils.Define;
import com.store.goguma.utils.UserRole;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
@RequiredArgsConstructor
public class UserService {

	private final UserRepository userRepository;
	private final MyUserRepository myUserRepository;
	private final ProductHistoryRepository productHistoryRepository;
	private final ReportRepository reportRepository;
	

	// 유저 정보 조회
	public User readByuser(OauthDTO dto) {
		String userEmail = dto.getSocial() + dto.getEmail();

		User user = userRepository.selectByEmail(userEmail);
		return user;
	}

	// 유저 정보 수정
	@Transactional
	public int modifyUser(ModifyUserDto dto) {
		log.info("ModifyUserDto : " + dto);

		String file = uploadProfile(dto);
		String address = dto.getAddr1() + dto.getAddr2();

		User userEntity = User.builder().email(dto.getEmail()).social(dto.getSocial()).zip(dto.getZip())
				.tel(dto.getTel()).address(address).file(file).build();

		log.info("userEntity : " + userEntity);

		int result = userRepository.updateUser(userEntity);

		log.info("result : " + result);

		return 0;
	}

	// 결제 내역 이모티콘 상세
	public UserEmojiDTO EmojiHistoryDetail(String id) {
		return myUserRepository.findEmojiHistoryBymerchantId(id);
	}

	// 유저 결제 내역
	public ResponsePageDTO myEmojiHistory(int uId, RequestPageDTO historyReqDTO) {
		int start = (historyReqDTO.getPg() - 1) * historyReqDTO.getSize();
		log.info("start : " + start);

		List<UserEmojiDTO> history = myUserRepository.findEmojiHistoryByUser(uId, start);
		int total = myUserRepository.countEmojiHistoryByUser(uId);
		log.info("total : " + total);

		return ResponsePageDTO.builder().requestPageDTO(historyReqDTO).dtoList(history).total(total).build();
	}

	// 이모티콘 환불
	@Transactional
	public UserEmojiDTO cancelEmoji(String merchantid, int uId, String reason) {
		// 환불 요청
		int result = myUserRepository.updateEmojiHistoryCancel(merchantid, uId, reason);
		// 기간 제한
		if (result > 1) {
			throw new BackPageRestfulException("기한이 지났습니다.", HttpStatus.BAD_REQUEST);
		}
		// 이모티콘 결제 정보 조회
		UserEmojiDTO dto = myUserRepository.findEmojiHistoryBymerchantId(merchantid);

		return dto;
	}

	// 구매 거래 내역
	public ResponsePageDTO productList(int uId, RequestPageDTO requestPageDTO) {
		int start = (requestPageDTO.getPg() - 1) * requestPageDTO.getSize();

		List<ProductHistoryDTO> dto = myUserRepository.myReadByproducthistory(uId, start);
		int total = myUserRepository.countProductHistoryByUser(uId);

		return ResponsePageDTO.builder().requestPageDTO(requestPageDTO).dtoList(dto).total(total).build();
	}

	// 유저 상품 목록
	public ResponsePageDTO productHostList(int uId, RequestPageDTO requestPageDTO) {
		int start = (requestPageDTO.getPg() - 1) * requestPageDTO.getSize();
		log.info("start : " + start);

		List<ProductHostDTO> dto = myUserRepository.selectProductHostByUid(uId, start);
		int total = myUserRepository.countProductHostByUid(uId);

		return ResponsePageDTO.builder().requestPageDTO(requestPageDTO).dtoList(dto).total(total).build();
	}

	// 내 문의하기 내역
	public ResponsePageDTO qnaList(RequestPageDTO requestPageDTO, int uId) {
		int start = (requestPageDTO.getPg() - 1) * requestPageDTO.getSize();

		String search = requestPageDTO.getSearch();
		String searchType = requestPageDTO.getSearchType();

		List<QnaUserDTO> dto = myUserRepository.findQnaByUid(uId, start, search, searchType);
		int total = myUserRepository.countQnaByUid(uId, search, searchType);

		return ResponsePageDTO.builder().requestPageDTO(requestPageDTO).dtoList(dto).total(total).build();
	}

	// 문의하기 글 삭제
	@Transactional
	public int deleteQna(Integer[] qnaIds) {
		int deletedCount = 0;

		for (int qnaId : qnaIds) {
			int result = myUserRepository.updateDeleteByQnaId(qnaId);
			log.info("qnaId : " + qnaId);
			if (result > 0) {
				deletedCount++;
			}
		}

		return deletedCount;
	}

	// 이모티콘 목록
	public ResponsePageDTO imojiList(RequestPageDTO requestPageDTO, int uId) {
		int start = (requestPageDTO.getPg() - 1) * requestPageDTO.getSize();

		List<UserEmojiDTO> list = myUserRepository.selectAllImoji(uId, start);
		int total = myUserRepository.countImoji(uId);

		return ResponsePageDTO.builder().requestPageDTO(requestPageDTO).dtoList(list).total(total).build();
	}

	// 찜 목록
	public ResponsePageDTO wishList(RequestPageDTO requestPageDTO, int uId) {
		int start = (requestPageDTO.getPg() - 1) * requestPageDTO.getSize();

		List<WishProductDTO> list = myUserRepository.selectWishListByUid(uId, start);
		int total = myUserRepository.countWishListByUid(uId);

		return ResponsePageDTO.builder().requestPageDTO(requestPageDTO).dtoList(list).total(total).build();
	}

	// 프로필 사진 변경
	public String uploadProfile(ModifyUserDto dto) {

		log.info("fileUpload...1");
		MultipartFile mf = dto.getFile();
		log.info("fileUpload...2" + mf);

		if (!mf.isEmpty()) {

			// 파일 첨부 했을 경우
			String path = new File(Define.UPLOAD_USERIMAGE_FILE_DERECTORY).getAbsolutePath();
			log.info("fileUpload...3" + path);
			File directory = new File(Define.UPLOAD_USERIMAGE_FILE_DERECTORY);

			// 디렉토리가 존재하지 않으면 생성
			if (!directory.exists()) {
				directory.mkdirs();
			}

			// 파일 크기 검사
			if (mf.getSize() > Define.MAX_PROFILE_FILE_SIZE) {
//				throw new RuntimeException("사진 용량이 250KB를 초과하였습니다.");
				throw new BackPageRestfulException("사진 용량이 250KB를 초과하였습니다." ,HttpStatus.BAD_REQUEST);
			}

			// 이름 중복처리
			String oName = mf.getOriginalFilename();
			String ext = oName.substring(oName.lastIndexOf("."));
			String sName = UUID.randomUUID().toString() + ext;

			log.info("fileUpload...4" + oName);

			try {
				log.info("fileUpload...5");

				// 파일 등록
				mf.transferTo(new File(path, sName));
			} catch (IOException e) {
				throw new RuntimeException("프로필 변경에 실패했습니다.");
			}

			return sName;

		}
		// 파일 첨부 안했을 경우
		return null;

	}

	// u_id로 유저 조회
	public UserDTO findAllByuId(Integer uId) {

		User user = userRepository.findAllByuId(uId);
		if (user == null) {
			throw new BackPageRestfulException(Define.NOT_FOUND_USER, HttpStatus.INTERNAL_SERVER_ERROR);
		}

		UserDTO dto = UserDTO.builder().uId(user.getUId()).name(user.getName()).email(user.getEmail())
				.social(user.getSocial()).tel(user.getTel()).address(user.getAddress()).description(user.getAddress())
				.zip(user.getZip()).report(user.getReport()).createAt(user.getCreateAt()).updateAt(user.getUpdateAt())
				.deleteAt(user.getDeleteAt()).deleteYn(user.getDeleteYn()).role(user.getRole()).file(user.getFile())
				.build();

		return dto;
	}

	// 모든 유저 카운트
	public int countUserAll() {
		return userRepository.countUserAll();
	}

	// 관리자 모든 유저 정보 조회
	public ResponsePageDTO findAll(RequestPageDTO pageDTO) {
		int start = (pageDTO.getPg() - 1) * pageDTO.getSize();
		List<User> list = userRepository.findAll(start, pageDTO.getSearch());
		int count = userRepository.countFindAll(pageDTO.getSearch());

		return ResponsePageDTO.builder().requestPageDTO(pageDTO).dtoList(list).total(count).build();
	}

	// 관리자가 권한 수정
	@Transactional
	public int adminUpdateUserRole(int uId, UserRole role) {
		return userRepository.adminUpdateUserRole(uId, role);
	}

	// 해당 유저의 온도 확인
	public int getTemperatureUser(int uId) {

		int historyCount = productHistoryRepository.countTemperatureUser(uId);
		int reportCount = reportRepository.countTemperatureUser(uId);

		int score = Define.DEFAULT_TEMPERATURE_SCORE + (historyCount * Define.FIVE) - (reportCount * Define.FIVE);
		// 0 미만 불가
		score = score < 0 ? 0 : score;
		// 100 초과 불가
		score = score > 100 ? 100 : score;

		return score;
	}
	
	// 화면에 표시될 컬러
	public int getTemperatureUserByScore(int score) {
		if(score <= 20) {
			return 1;
		} else if (score <= 40) {
			return 2;
		} else if (score <= 60) {
			return 3;
		} else if (score <= 80) {
			return 4;
		} else if (score <= 90) {
			return 5;
		} else if (score <= 100) {
			return 6;
		}
		return 1;
	}
	
	/**
	 * 유저 정보 상세 조회
	 * @param userId
	 * @return
	 */
	public UserProfileDto findProfileById(int userId) {
		return userRepository.findProfileById(userId);
	}
	
	/**
	 * 유저 정보 삭제
	 * @param userId
	 * @return
	 */
	public int deleteUser(int userId) {
		return userRepository.deleteUser(userId);
	}
}
