package kr.or.ddit.controller.omn.sales;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.commons.lang3.StringUtils;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.service.omn.sales.IPubSalesService;
import kr.or.ddit.vo.omn.MngPaginationInfoVO;
import kr.or.ddit.vo.omn.SalesVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/pub/sales")
@PreAuthorize("hasRole('ROLE_PUBLISHER')")
public class PubSalesController {
	
	@Inject
	private IPubSalesService service;
	
	@ResponseBody
	@GetMapping(value = "/selectSalesList", produces = "application/json;charset=utf-8")
	public Map<String, Object> selectSalesList(
			@RequestParam(name = "page", required = false, defaultValue = "1") int currentPage,
			@RequestParam(required = false, defaultValue = "no") String searchType,
			@RequestParam(required = false, defaultValue = "") String searchWord,
			String order_no){
		
		log.info("selectSalesList()실행");
		String id = SecurityContextHolder.getContext().getAuthentication().getName();
		log.info("출판사 로그인 id :::" + id);
		Map<String, Object> map = new HashMap<>();
		MngPaginationInfoVO<SalesVO> pagingVO = new MngPaginationInfoVO<>();
		pagingVO.setAe_id(id);
		if(StringUtils.isNotBlank(searchWord)) {
			pagingVO.setSearchType(searchType);
			pagingVO.setSearchWord(searchWord);
			map.put("searchType", searchType);
			map.put("searchWord", searchWord);
		}
		
		pagingVO.setCurrentPage(currentPage);
		pagingVO.setOrder_no(order_no);
		int totalRecord = service.salesCount(pagingVO);
		pagingVO.setTotalRecord(totalRecord);
		int allRecord = service.salesAllCount(id);
		pagingVO.setAllRecord(allRecord);
		List<SalesVO> dataList = service.selectSalesList(pagingVO);
		pagingVO.setDataList(dataList);
		map.put("pagingVO", pagingVO);
		
		return map;
	}
	
	// 도서 판매량 Best5
	@ResponseBody
	@GetMapping(value = "/bestBooks", produces = "application/json;charset=utf-8")
	public List<SalesVO> bestBooks(SalesVO salesVO){
		log.info("bestBooks()실행");
		String id = SecurityContextHolder.getContext().getAuthentication().getName();
		log.info("출판사 로그인 id :::" + id);
		salesVO.setAe_id(id);
		return service.bestBooks(salesVO);
	}
	
	// 월별 판매량
	@ResponseBody
	@GetMapping(value = "/monthlyCnt", produces = "application/json;charset=utf-8")
	public List<SalesVO> monthlyCnt(SalesVO salesVO){
		log.info("monthlyCnt()실행");
		String id = SecurityContextHolder.getContext().getAuthentication().getName();
		log.info("출판사 로그인 id :::" + id);
		salesVO.setAe_id(id);
		List<SalesVO> vo = service.monthlyCnt(salesVO);
		for(SalesVO svo : vo) {
			log.info("월 : "+svo.getMonth());
			
		}
		return service.monthlyCnt(salesVO);
	}
	
	// 월별 매출액
	@ResponseBody
	@GetMapping(value = "/monthlySales", produces = "application/json;charset=utf-8")
	public List<SalesVO> monthlySales(SalesVO salesVO){
		log.info("monthlySales()실행");
		String id = SecurityContextHolder.getContext().getAuthentication().getName();
		log.info("출판사 로그인 id :::" + id);
		salesVO.setAe_id(id);
		return service.monthlySales(salesVO);
	}
}