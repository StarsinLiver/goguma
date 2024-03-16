package com.store.goguma.service;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.store.goguma.admin.dto.EmojiModifyDTO;
import com.store.goguma.entity.Emoji;
import com.store.goguma.repository.AdminRepository;
import com.store.goguma.utils.Define;

@Service
// 업로드된 이모지 파일 업데이트 하기 위한 서비스
public class AdminModifyEmojiService {

	@Autowired
	private AdminRepository repository;

	public boolean emojiFileUpload(EmojiModifyDTO dto, List<MultipartFile> files) {
		String fileName = uploadProcess(files.get(0));
		if(fileName != null) {
			int uploadResult = 0;
			dto.setFile(fileName);
			int mainResult = repository.mainModify(dto.toEntity());
			if(mainResult != 0) {
				for(int i = 1; i < files.size(); i++) {
					String subFileName = uploadProcess(files.get(i));
					if(subFileName != null) {
						Emoji emoji = Emoji.builder()
								.file(subFileName)
								.name("emoji_" + dto.getId() + "_" + i)
								.groupId(dto.getGroupId())
								.build();
						uploadResult += repository.subModify(emoji);
					}
				}
			}
			if(uploadResult != files.size() -1) {
				throw new RuntimeException("emoji 테이블 update 실패.");
			}
			return true;
		}
		return false;
	}

	public String uploadProcess(MultipartFile file) {// 파일만 c드라이브에 업로드됨
        if (file.isEmpty() == false) {
            if (file.getSize() > com.store.goguma.utils.Define.MAX_IMG_FILE_SIZE) {// 5메가 제한
                throw new RuntimeException("파일 크기가 큽니다.");
            }

            String saveDirectory = Define.UPLOAD_EMOJI_FILE_DERECTORY;
            File dir = new File(saveDirectory);
            if (!dir.exists()) {
                dir.mkdir();
            }

            UUID uuid = UUID.randomUUID();
            String fileName = uuid + "_" + file.getOriginalFilename();

            String uploadPath = Define.UPLOAD_EMOJI_FILE_DERECTORY + File.separator + fileName;
            File destination = new File(uploadPath);

            try {
                file.transferTo(destination);
            } catch (IllegalStateException | IOException e) {
                e.printStackTrace();
            }
            return fileName;
        }
		return null;
	}
	
	
}
