package kr.or.ddit.controller.ljy.mng;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.controller.ljy.excel.ExcelUtils;
import kr.or.ddit.service.ljy.RemainMngService;
import kr.or.ddit.vo.ljy.PoMngVO;
import kr.or.ddit.vo.ljy.RemainMngVO;
import kr.or.ddit.vo.omn.MngPaginationInfoVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/mng/remain")
@Slf4j
@PreAuthorize("hasRole('ROLE_ADMIN')")
public class RemainRestController {
	
	@Resource(name="uploadExcel")
	private String filePath;
	
	@Autowired
	private RemainMngService remainService;
	
	// 재고 리스트
	@ResponseBody
	@GetMapping(value = "/list" , produces = "application/json;charset=utf-8")
	public Map<String, Object> remainList(
			@RequestParam(name = "page", required = false, defaultValue = "1") int currentPage,
			@RequestParam(name="searchType", required = false, defaultValue = "title") String searchType,
			@RequestParam(name="searchWord",required = false, defaultValue = "") String searchWord,
			@RequestParam(name="status", required = false, defaultValue = "") String status
			){
		log.info("remainList controller 도착");
		log.info("status " + status);
		Map<String, Object> remainMap = new HashMap<>();
		MngPaginationInfoVO<RemainMngVO> mngPaginationInfoVO = new MngPaginationInfoVO<RemainMngVO>();
		System.out.println("===============================searchWord"  + searchWord);
		System.out.println("===============================searchType"  + searchType);
		if(StringUtils.isNotBlank(searchWord)) {	// 검색을 함
			mngPaginationInfoVO.setSearchType(searchType);
			mngPaginationInfoVO.setSearchWord(searchWord);
			remainMap.put("searchWord", searchWord);
			remainMap.put("searchType", searchType);
		}
		if("search".equals(status)) {
			mngPaginationInfoVO.setScreenSize(1000);
		}
		mngPaginationInfoVO.setCurrentPage(currentPage);
		int totalRecord = remainService.remainListCnt(mngPaginationInfoVO);
		mngPaginationInfoVO.setTotalRecord(totalRecord);
		List<RemainMngVO> dataList = remainService.remainList(mngPaginationInfoVO); 
		mngPaginationInfoVO.setDataList(dataList);
		
		remainMap.put("mngPaginationInfoVO", mngPaginationInfoVO);
		return remainMap;
	}
	
	// 재고 상태에 따른 리스트
	@ResponseBody
	@GetMapping(value = "/list/{bm_cnt_status}" , produces = "application/json;charset=utf-8")
	public Map<String, Object> remainListCntStatus(
			@PathVariable("bm_cnt_status") int bm_cnt_status,
			@RequestParam(name = "page", required = false, defaultValue = "1") int currentPage,
			@RequestParam(name = "ae_id", required = false) String ae_id,
			@RequestParam(name="status", required = false, defaultValue = "") String status
			){
		log.info("remainList controller 도착");
		Map<String, Object> remainMap = new HashMap<>();
		MngPaginationInfoVO<RemainMngVO> mngPaginationInfoVO = new MngPaginationInfoVO<RemainMngVO>();
		mngPaginationInfoVO.setBm_cnt_status(bm_cnt_status);
		if("po".equals(status)) {
			mngPaginationInfoVO.setScreenSize(1000);
		}
		mngPaginationInfoVO.setAe_id(ae_id);
		mngPaginationInfoVO.setCurrentPage(currentPage);
		int totalRecord = remainService.remainListCnt(mngPaginationInfoVO);
		mngPaginationInfoVO.setTotalRecord(totalRecord);
		List<RemainMngVO> dataList = remainService.remainList(mngPaginationInfoVO); 
		mngPaginationInfoVO.setDataList(dataList);
		
		remainMap.put("mngPaginationInfoVO", mngPaginationInfoVO);
		return remainMap;
	}
	
	// 수동 발주신청 
	@ResponseBody
	@PostMapping("/po")
	public String poOne(@RequestBody PoMngVO poMngVO) {
		log.info("poOne controller 도착");
		log.info("" + poMngVO);
		int cnt = remainService.poOne(poMngVO);
		String res = "";
		if(cnt >0 ) {
			res = "success";
		} else {
			res = "fail";
		}
		return res;
	}
	
	// list로 발주 신청 
	@ResponseBody
	@PostMapping(value = "/poreqlist")
	public String poReqList(@RequestBody List<PoMngVO> poList) {
		log.info("poReqList controller 도착");
		String rslt = "";
		String res = remainService.poReqList(poList);
		if(res.equals("success")) {
			rslt = "success";
		} else {
			rslt = res;
		}
		return res;
	}
	
	// 책 1개 재고 가져오기
	@ResponseBody
	@GetMapping("/detail/{book_no}")
	public RemainMngVO remainOne(@PathVariable String book_no) {
		log.info("remainOne : " + book_no);
		return remainService.remainOne(book_no);
	}
	
	// 발주 내역 리스트 
	@ResponseBody
	@GetMapping("/polist")
	public Map<String, Object> poList(
		@RequestParam(name = "page", required = false, defaultValue = "1") int currentPage
			){
		log.info("poList controller 도착");
		Map<String, Object> poMap = new HashMap<>();
		MngPaginationInfoVO<PoMngVO> mngPaginationInfoVO = new MngPaginationInfoVO<PoMngVO>();
		mngPaginationInfoVO.setCurrentPage(currentPage);
		int totalRecord = remainService.poListCnt(mngPaginationInfoVO);
		mngPaginationInfoVO.setTotalRecord(totalRecord);
		List<PoMngVO> dataList = remainService.poList(mngPaginationInfoVO);
		mngPaginationInfoVO.setDataList(dataList);
		poMap.put("mngPaginationInfoVO", mngPaginationInfoVO);
		return poMap;
	}
	
	// 관리자 -> 발주서 다운
	@ResponseBody
	@PostMapping("/podown")
	public String poDown(@RequestBody PoMngVO poMngVO) {
		log.info("발주서 다운에서 poMngVO" + poMngVO);
		String excelPoFileName = ExcelUtils.getExcelPo(filePath, poMngVO.getBr_no(), poMngVO.getAe_id());
		return excelPoFileName;
	}
}
