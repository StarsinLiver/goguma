package com.store.goguma.service;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.store.goguma.entity.EmojiHistory;
import com.store.goguma.entity.User;
import com.store.goguma.handler.exception.BackPageRestfulException;
import com.store.goguma.repository.EmojiHistoryRepository;
import com.store.goguma.repository.MyUserRepository;
import com.store.goguma.repository.UserRepository;
import com.store.goguma.user.dto.ModifyUserDto;
import com.store.goguma.user.dto.OauthDTO;
import com.store.goguma.user.dto.UserDTO;
import com.store.goguma.user.dto.my.EmojiHistoryReqDTO;
import com.store.goguma.user.dto.my.EmojiHistoryResDTO;
import com.store.goguma.utils.Define;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class UserService {
	
	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private MyUserRepository myUserRepository;
	
	// 유저 정보 조회
	public User readByuser(OauthDTO dto) {
		String userEmail = dto.getSocial() + dto.getEmail();
		log.info("readByuser1111111111111111111111: "+userEmail);
		
		User user = userRepository.selectByEmail(userEmail);
		
		
		
		return user;
	}
	
	// 유저 정보 수정
	public int modifyUser(ModifyUserDto dto) {
		log.info("ModifyUserDto : "+dto);
		
		String file = uploadProfile(dto);
		String address = dto.getAddr1() + dto.getAddr2();
		
		User userEntity = User.builder()
					.email(dto.getEmail())
					.social(dto.getSocial())
					.zip(dto.getZip())
					.tel(dto.getTel())
					.address(address)
					.file(file)
					.build();
		
		log.info("userEntity : "+userEntity);
		
		int result =userRepository.updateUser(userEntity);
		
		log.info("result : "+result);
		
		return 0;
	}
	
	// 유저 결제 내역
	public EmojiHistoryResDTO myEmojiHistory(int uId, EmojiHistoryReqDTO historyReqDTO) {
		int start = (historyReqDTO.getPg() - 1) * historyReqDTO.getSize();
		log.info("start : "+start);
		
		List<EmojiHistory> history = myUserRepository.findEmojiHistoryByUser(uId, start);
		int total = myUserRepository.countEmojiHistoryByUser(uId);
		log.info("total : "+total);
		
		return EmojiHistoryResDTO.builder()
				.emojiHistoryReqDTO(historyReqDTO)
				.dtoList(history)
				.total(total)
				.build();
	}
	
	// 프로필 사진 변경
	public String uploadProfile(ModifyUserDto dto) {
		
		log.info("fileUpload...1");
        MultipartFile mf = dto.getFile();
        log.info("fileUpload...2"+mf);
        
        if(!mf.isEmpty()){
        	
            // 파일 첨부 했을 경우
            String path = new File(Define.UPLOAD_USERIMAGE_FILE_DERECTORY).getAbsolutePath();
            log.info("fileUpload...3"+path);
            File directory = new File(Define.UPLOAD_USERIMAGE_FILE_DERECTORY);
            
            // 디렉토리가 존재하지 않으면 생성
            if (!directory.exists()) {
                directory.mkdirs();
            }

            // 파일 크기 검사
            if (mf.getSize() > Define.MAX_PROFILE_FILE_SIZE) {
                throw new RuntimeException("사진 용량이 250KB를 초과하였습니다.");
            }
            
            
            // 이름 중복처리
            String oName = mf.getOriginalFilename();
            String ext = oName.substring(oName.lastIndexOf("."));
            String sName = UUID.randomUUID().toString()+ext;

            log.info("fileUpload...4"+oName);

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
		if(user == null) {
			throw new BackPageRestfulException(Define.NOT_FOUND_USER, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		UserDTO dto = UserDTO.builder()
			.uId(user.getUId())
			.name(user.getName())
			.email(user.getEmail())
			.social(user.getSocial())
			.tel(user.getTel())
			.address(user.getAddress())
			.description(user.getAddress())
			.zip(user.getZip())
			.report(user.getReport())
            .createAt(user.getCreateAt())
            .updateAt(user.getUpdateAt())
            .deleteAt(user.getDeleteAt())
            .deleteYn(user.getDeleteYn())
            .role(user.getRole())
            .file(user.getFile())
            .build();
		
		return dto;
	}
}
