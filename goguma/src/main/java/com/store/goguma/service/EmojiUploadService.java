package com.store.goguma.service;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.store.goguma.emoji.dto.EmojiHistoryReqDto;
import com.store.goguma.emoji.dto.EmojiUploadDto;
import com.store.goguma.entity.Emoji;
import com.store.goguma.entity.MainEmoji;
import com.store.goguma.handler.exception.BackPageRestfulException;
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
		String fileName = uploadProcess(files.get(0));
		if(fileName != null) {
			int uploadResult = 0;
			dto.setFile(fileName);
			int mainResult = repository.mainUpload(dto.toEntity());
			if(mainResult != 0) {
				Integer groupId = repository.getMainLastId();
				for(int i = 1; i < files.size(); i++) {
					String subFileName = uploadProcess(files.get(i));
					if(subFileName != null) {
						Emoji emoji = Emoji.builder()
								.file(subFileName)
								.name("emoji_" + groupId + "_" + i)
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

	// -------------------------- sanha
	public String uploadFileProcess(MultipartFile file) {// 파일만 c드라이브에 업로드됨
        if (file.isEmpty() == false) {
            if (file.getSize() > com.store.goguma.utils.Define.MAX_IMG_FILE_SIZE) {// 5메가 제한
                throw new BackPageRestfulException("파일 크기가 큽니다." , HttpStatus.BAD_REQUEST);
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
	// --------------------------

	public List<MainEmoji> getEmojiMainList(int num) {
		List<MainEmoji> list = null;
		if(num == 0) {
			list = repository.getEmojiMainListHome();
		}else if(num == 1) {
			list = repository.getEmojiMainListPopular();
		}else {
			list = repository.getEmojiMainList();
		}
		return list;
	}

	public List<Emoji> getEmojiDetailList(int num) {
		return repository.getEmojiDetailList(num);
	}

	public MainEmoji getEmojiDetailMain(int num) {
		return repository.getEmojiDetailMain(num);
	}

	@Transactional
	public boolean emojiOrder(EmojiHistoryReqDto dto) {
		int result = repository.emojiOrder(dto.toEntity());
		if(result == 0) {
			throw new RuntimeException("emoji_history 등록 실패!");
		}
		MainEmoji mainEmoji = repository.getMainEmoji(dto.getMainEmojiId());
		if(mainEmoji != null) {
			mainEmoji.setDownloadCount(mainEmoji.getDownloadCount() + 1);
			int mainResult = repository.mainEmojiDownloadCountPlus(mainEmoji);
			if(mainResult == 0) {
				throw new RuntimeException("main_emoji download_count 수정 실패");
			}
			return true;
		}
		return false;
	}

	public List<MainEmoji> emojiSearch(String title) {
		return repository.emojiSearch(title);
	}


}
