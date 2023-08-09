package kr.or.ddit.controller.omn.books;

import java.util.List;

import javax.inject.Inject;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.service.omn.books.IMngCategoryService;
import kr.or.ddit.vo.omn.MngCategoryVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/mng/category")
@PreAuthorize("hasRole('ROLE_ADMIN')")
public class MngCategoryController {
	
	@Inject
	private IMngCategoryService service;
	
	// 카테고리 대분류 조회
	@ResponseBody
	@GetMapping(value = "/categoryMainList", produces = "application/json;charset=utf-8")
	public List<MngCategoryVO> categoryMainList(){
		log.info("categoryMainList()실행");
		return service.categoryMainList();
	}
	
	// 카테고리 소분류 조회
	@ResponseBody
	@GetMapping(value = "/categoryMidList", produces = "application/json;charset=utf-8")
	public List<MngCategoryVO> categoryMidList(){
		log.info("categoryMidList()실행");
		return service.categoryMidList();
	}
	
	// 카테고리 추가
	@ResponseBody
	@PostMapping(value = "/categoryInsert")
	public String categoryInsert(@RequestBody MngCategoryVO mngCategoryVO) {
		log.info("categoryInsert()실행");
		int cnt = service.categoryInsert(mngCategoryVO);
		String result = "";
		if(cnt > 0) {
			result = "success";
		} else {
			result = "fail";
		}
		return result;
	}
	
	// 카테고리 수정
	@ResponseBody
	@PutMapping(value = "/categoryUpdate", produces = "text/plain; charset=utf-8")
	public String categoryUpdate(@RequestBody MngCategoryVO mngCategoryVO) {
		log.info("categoryUpdate()실행");
		log.info("mngCategoryVO(" + mngCategoryVO);
		int cnt = service.categoryUpdate(mngCategoryVO);
		String result = "";
		if(cnt > 0) {
			result = "success";
		} else {
			result = "fail";
		}
		return result;
	}
	
	// 카테고리 삭제
	@ResponseBody
	@DeleteMapping(value = "/categoryDelete", produces = "text/plain; charset=utf-8")
	public String categoryDelete(@RequestBody MngCategoryVO mngCategoryVO){
		log.info("categoryDelete()실행");
		int cnt = service.categoryDelete(mngCategoryVO);
		String result = "";
		if(cnt > 0) {
			result = "success";
		} else {
			result = "fail";
		}
		return result;
	}
}
