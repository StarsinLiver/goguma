package com.store.goguma.freeboard.controller;

import java.util.Arrays;
import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.store.goguma.entity.BoardCategoryMain;
import com.store.goguma.entity.BoardCategorySub;
import com.store.goguma.freeboard.dto.CategoryDTO;
import com.store.goguma.freeboard.dto.FreeBoardListDTO;
import com.store.goguma.freeboard.dto.FreeBoardPageDTO;
import com.store.goguma.service.BoardService;
import com.store.goguma.service.FreeBoardService;
import com.store.goguma.user.dto.OauthDTO;

import ch.qos.logback.core.model.Model;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
@RequiredArgsConstructor
@RequestMapping("/free-board")
public class FreeboardRestController {

	private final BoardService boardService;
	private final FreeBoardService freeBoardService;
	private final HttpSession httpSession;

	/**
	 * 모든 메인 카테고리 찾기
	 * @return
	 */
	@GetMapping("/maincategory")
	public ResponseEntity<?> getMainCategory() {
		try {
			OauthDTO user = (OauthDTO) httpSession.getAttribute("principal");
			if (user == null) {
				return new ResponseEntity<>(com.store.goguma.utils.Define.ENTER_YOUR_LOGIN, HttpStatus.BAD_REQUEST);
			}

			// 모든 메인 카테고리 찾기
			List<BoardCategoryMain> list = boardService.findAll();
			log.info("메인 카테고리 : {}" , list);
			if (list.isEmpty() == false) {
				return new ResponseEntity<>(list, HttpStatus.OK);
			}
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		} catch (Exception e) {
			log.info(e.getMessage());
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	/**
	 * 해당 유저의 게시물이 들어 있는 서브 카테고리 가져오기
	 * 
	 * @param param
	 * @return
	 */
	@GetMapping("/user/subcategory/{id}")
	public ResponseEntity<?> getSubcategoryByUserId(@PathVariable(value = "id") Integer param) {
		try {

			OauthDTO user = (OauthDTO) httpSession.getAttribute("principal");
			if (user == null) {
				return new ResponseEntity<>(com.store.goguma.utils.Define.ENTER_YOUR_LOGIN, HttpStatus.BAD_REQUEST);
			}

			List<BoardCategorySub> list = freeBoardService.findSubCategoryByMainCateogry(user.getUId(), param);

			if (list.isEmpty() == false) {
				return new ResponseEntity<>(list, HttpStatus.OK);
			}
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);

		} catch (Exception e) {
			log.info(e.getMessage());
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	/**
	 * 모든 서브 카테고리 가져오기
	 * 
	 * @param param
	 * @return
	 */
	@GetMapping("/subcategory/{id}")
	public ResponseEntity<?> getSubcategoryAll(@PathVariable(value = "id") Integer param) {
		try {

			OauthDTO user = (OauthDTO) httpSession.getAttribute("principal");
			if (user == null) {
				return new ResponseEntity<>(com.store.goguma.utils.Define.ENTER_YOUR_LOGIN, HttpStatus.BAD_REQUEST);
			}

			List<BoardCategorySub> list = boardService.findByGroupId(param);

			if (list.isEmpty() == false) {
				return new ResponseEntity<>(list, HttpStatus.OK);
			}
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);

		} catch (Exception e) {
			log.info(e.getMessage());
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	

	@DeleteMapping("/delete")
	public ResponseEntity<?> deleteBoard(@RequestBody Integer[] array) {
		try {

			OauthDTO user = (OauthDTO) httpSession.getAttribute("principal");
			if (user == null) {
				return new ResponseEntity<>(com.store.goguma.utils.Define.ENTER_YOUR_LOGIN, HttpStatus.BAD_REQUEST);
			}

			log.info("array : {} ", Arrays.toString(array));

			List<Integer> list = Arrays.asList(array);
			log.info("list : {}", list);
			int result = freeBoardService.deleteBoardById(list);
			if (result == 0) {
				return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
			}
			return new ResponseEntity<>(HttpStatus.OK);
		} catch (Exception e) {
			log.info(e.getMessage());
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}

	}
	
	// 자유 게시판 리스트 컨트롤러
	@GetMapping("/listAll")
	@ResponseBody
	public FreeBoardListDTO BoardList(FreeBoardPageDTO page, Model model){

		
		log.info("리스트 컨트롤러 들오는지 확인 해보기 위해 쓰는 로그 ");
		log.info("page dto 확인: "+ page.toString());
		
		
		FreeBoardListDTO result = freeBoardService.selectArticleAllBycateNid(page);
		
		
		log.info("relust 값 확인 하기: "+ result.toString());
		
		return result;	
	}  
	// 자유 게시판 카테고리 생성
	@GetMapping("/category")
	@ResponseBody
	public List<CategoryDTO> CategoryProc(){
		
		
		
		List<CategoryDTO> result = freeBoardService.selectSideCateAll();
		
		log.info("카테고리 컨트롤러 리절트값 확인: " + result);
		
		
		return result;	
	}  
	

}
