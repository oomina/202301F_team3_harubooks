package kr.or.ddit.controller.omn.books;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.commons.lang3.StringUtils;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.service.omn.books.IMngBookRequestService;
import kr.or.ddit.vo.omn.MngPaginationInfoVO;
import kr.or.ddit.vo.omn.NewBookRequestVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/mng/bookRequest")
@PreAuthorize("hasRole('ROLE_ADMIN')")
public class MngBookRequestController {
	
	@Inject
	private IMngBookRequestService service;
	
	// 도서 등록 요청 리스트
	@ResponseBody
	@GetMapping(value = "/selectRequestList", produces = "application/json;charset=utf-8")
	public Map<String, Object> selectRequestList(
			@RequestParam(name = "page", required = false, defaultValue = "1") int currentPage,
			@RequestParam(required = false, defaultValue = "id") String searchType,
			@RequestParam(required = false, defaultValue = "") String searchWord,
			String nbr_no){
		
		log.info("selectRequestList()실행");
		
		Map<String, Object> map = new HashMap<>();
		MngPaginationInfoVO<NewBookRequestVO> pagingVO = new MngPaginationInfoVO<>();
		
		if(StringUtils.isNotBlank(searchWord)) {
			pagingVO.setSearchType(searchType);
			pagingVO.setSearchWord(searchWord);
			map.put("searchType", searchType);
			map.put("searchWord", searchWord);
		}
		
		pagingVO.setCurrentPage(currentPage);
		pagingVO.setNbr_no(nbr_no);
		int totalRecord = service.requestCount(pagingVO);
		pagingVO.setTotalRecord(totalRecord);
		int allRecord = service.requestAllCount(nbr_no);
		pagingVO.setAllRecord(allRecord);
		List<NewBookRequestVO> dataList = service.selectRequestList(pagingVO);
		pagingVO.setDataList(dataList);
		map.put("pagingVO", pagingVO);
		
		return map;
	}
	
	// 도서 등록 요청 승인
	@ResponseBody
	@PostMapping(value = "/booksInsert", produces = "text/plain; charset=utf-8")
	public String booksInsert(@RequestBody List<NewBookRequestVO> booksList) throws IOException {
		log.info("booksInsert()실행");
		int cnt = service.booksInsert(booksList);
		String result = "";
		if(cnt > 0) {
			result = "success";
		} else {
			result = "fail";
		}
		return result;
	}
	
	// 도서 등록 요청 거절
	@ResponseBody
	@PutMapping(value = "/requestRefuse", produces = "text/plain; charset=utf-8")
	public String requestRefuse(@RequestBody List<NewBookRequestVO> refuseList) {
		log.info("requestRefuse()실행");
		int cnt = service.requestRefuse(refuseList);
		String result = "";
		if(cnt > 0) {
			result = "success";
		} else {
			result = "fail";
		}
		return result;
	}
	
	// 신규 도서 신청 개수
	@ResponseBody
	@GetMapping("/bookreqcnt")
	public int countBookReq() {
		log.info("countBookReq");
		return service.countBookReq();
	}
}
