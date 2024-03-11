package com.store.goguma.service;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.store.goguma.emoji.dto.EmojiUploadDto;
import com.store.goguma.entity.Emoji;
import com.store.goguma.repository.EmojiRepository;
import com.store.goguma.utils.Define;

/**
 * @fileName : EmojiUploadService.java
 * @Project : goguma
 * @Date : 2024. 3. 11.
 * @작성자 : 강민
 * @설명 : 
 */

@Service
public class EmojiUploadService {
	
	@Autowired
	private EmojiRepository repository;

	public boolean emojiFileUpload(EmojiUploadDto dto, List<MultipartFile> files) {
		if(uploadProcess(files.get(0)) != null) {
			// main_emoji insert
			// 성공하면 for 돌려서 emoji insert(name은 하드코딩 하는걸로..)
			int uploadResult = 0;
			dto.setFile(uploadProcess(files.get(0)));
			int mainResult = repository.mainUpload(dto.toEntity());
			if(mainResult != 0) {
				Integer groupId = repository.getMainLastId();
				for(int i = 1; i < files.size(); i++) {
					if(uploadProcess(files.get(i)) != null) {
						Emoji emoji = Emoji.builder()
								.file(uploadProcess(files.get(i)))
								.name(null)// 하드코딩 하는걸로..
								.groupId(groupId)
								.build();
						uploadResult += repository.subUpload(emoji);
					}
				}
			}
			if(uploadResult != files.size() -1) {
				throw new RuntimeException("emoji 테이블 insert 실패.");
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

            String saveDirectory = Define.UPLOAD_FILE_DERECTORY;
            File dir = new File(saveDirectory);
            if (!dir.exists()) {
                dir.mkdir();
            }

            UUID uuid = UUID.randomUUID();
            String fileName = uuid + "_" + file.getOriginalFilename();

            String uploadPath = Define.UPLOAD_FILE_DERECTORY + File.separator + fileName;
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
