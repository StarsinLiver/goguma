package com.store.goguma.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.store.goguma.category.dto.CategoryRequestDto;
import com.store.goguma.category.dto.CategoryRequestDto.SubCateObject;
import com.store.goguma.category.dto.CategoryResponseDto;
import com.store.goguma.category.dto.CategoryResponseDto.subResponseDto;
import com.store.goguma.entity.BoardCategoryMain;
import com.store.goguma.entity.BoardCategorySub;
import com.store.goguma.repository.CategoryRepository;
import com.store.goguma.utils.Define;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
public class CategoryService {

	private final CategoryRepository repository;

	@Transactional
	public boolean addCategory(List<CategoryRequestDto> dtos, MultipartFile file) {
		Map<String, String> map = backgroundFileUpload(file);
		log.info("dtos : {} " , dtos);
		log.info("addCategory : map  : {} " , map);
		for(int i = 0; i < dtos.size(); i++) {
			if(dtos.get(i).getFlag() == 1) {
				subCatoryAdd(dtos.get(i).getSubList(), map, 999);
			}else if(dtos.get(i).getFlag() == 2) {
				int result = repository.mainCategoryModify(dtos.get(i).toEntity());
				if(result == 0) {
					throw new RuntimeException("메인카테고리 수정 실패");
				}
				subCatoryAdd(dtos.get(i).getSubList(), map, 999);
			}else if(dtos.get(i).getFlag() == 3) {
				int result = repository.mainCategoryCreate(dtos.get(i).toEntity());
				if(result == 0) {
					throw new RuntimeException("메인카테고리 추가 실패");
				}
				int mainIndex = repository.getMainIndex();
				subCatoryAdd(dtos.get(i).getSubList(), map, mainIndex);
			}
		}
		return true;
	}
	
	//=======================================================================================================================================================
	@Transactional
	public void subCatoryAdd(List<SubCateObject> list, Map<String, String> map, int mainIndex) {// 전부 서브카테고리
		
		log.info("map : {}" , map);
		log.info("list : {}" , list);
		log.info("mainIndex : {}" , mainIndex);
		for(int k = 0; k < list.size(); k++) {
			if(list.get(k).getFlag() == 2) {// 기존 수정
				int result = repository.subCategoryModify(list.get(k).toEntity());
				if(result == 0) {
					throw new RuntimeException("서브카테고리 수정 실패");
				}
			}else if(list.get(k).getFlag() == 3) {// 신규 생성
				BoardCategorySub entity = list.get(k).toEntity();
				entity.setGroupId(mainIndex);
				int result = repository.subCategoryCreate(entity);
				if(result == 0) {
					throw new RuntimeException("서브카테고리 추가 실패");
				}
			}else if(list.get(k).getFlag() == 4) {// 신규 라디오(이미지 포함)
				BoardCategorySub entity = list.get(k).toEntity();
				entity.setFont(list.get(k).getFont());
				entity.setBackground(map.get("background"));
				entity.setFile(map.get("file"));
				entity.setListType(list.get(k).getListType());
				entity.setGroupId(mainIndex);
				int result = repository.subCategoryCreate(entity);
				if(result == 0) {
					throw new RuntimeException("서브카테고리 추가 실패");
				}
			}else if(list.get(k).getFlag() == 5) {// 기존 라디오(이미지 포함)
				BoardCategorySub entity = list.get(k).toEntity();
				entity.setFont(list.get(k).getFont());
				entity.setBackground(map.get("background"));
				entity.setFile(map.get("file"));
				entity.setListType(list.get(k).getListType());
				int result = repository.subCategoryModify(entity);
				if(result == 0) {
					throw new RuntimeException("서브카테고리 수정 실패");
				}
			}
		}
	}
	//=======================================================================================================================================================
	public Map<String, String> backgroundFileUpload(MultipartFile file) {// 파일만 c드라이브에 업로드됨
		Map<String, String> map = new HashMap<>();
        if(file == null) {
        	map.put("background", "");
            map.put("file", "");
            return map;
        }else {
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
                map.put("background", file.getOriginalFilename());
                map.put("file", fileName);
                return map;
            }
        }
		return null;
	}
	//=======================================================================================================================================================
	
	public List<CategoryResponseDto> getList() {
		List<BoardCategoryMain> mainList = repository.getMainList();
		List<BoardCategorySub> subList = repository.getSubList();
		List<CategoryResponseDto> mainResp = new ArrayList<>();
		
		for(int i = 0; i < mainList.size(); i++) {
			CategoryResponseDto mainDto = new CategoryResponseDto();
			mainDto.setIndex(mainList.get(i).getId());
			mainDto.setName(mainList.get(i).getName());
			mainResp.add(mainDto);
		}
		
		for(int i = 0; i < mainList.size(); i++) {
			List<subResponseDto> subResp = new ArrayList<>();
			for(int k = 0; k < subList.size(); k++) {
				if(mainList.get(i).getId() == subList.get(k).getGroupId()) {
					subResponseDto subDto = new subResponseDto();
					subDto.setMainIndex(subList.get(k).getGroupId());
					subDto.setIndex(subList.get(k).getId());
					subDto.setName(subList.get(k).getName());
					subResp.add(subDto);
					mainResp.get(i).setSubList(subResp);
				}
			}// for(int k
		}
		return mainResp;
	}

	public boolean categoryRemove(int id, String checkTitle) {
		int checkFlag = 0;
		if(checkTitle != null && checkTitle != "") {
			if(checkTitle.equals("main")) {
				checkFlag = repository.mainCategoryRemove(id);
			}else {
				checkFlag = repository.subCategoryRemove(id);
			}
		}
		return checkFlag != 0;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
