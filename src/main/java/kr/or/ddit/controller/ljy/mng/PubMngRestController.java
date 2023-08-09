package kr.or.ddit.controller.ljy.mng;

import java.util.List;

import javax.inject.Inject;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.service.ljy.PubMngService;
import kr.or.ddit.vo.ljy.PubMngVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/mng/pub")
@PreAuthorize("hasRole('ROLE_ADMIN')")
public class PubMngRestController {
	
	@Autowired
	private PubMngService pubService;
	
	@Inject
	private BCryptPasswordEncoder pe;
	
	@ResponseBody
	@GetMapping("/list")
	public PubMngVO pubList(
			@RequestParam(name = "page", required = false, defaultValue = "1") int currentPage,
			@RequestParam(name = "status", required = false) String status,
			@RequestParam(name = "searchWord", required = false) String searchWord
			){
		log.info("pubList controller 도착");
		log.info("currentPage : " + currentPage);
		PubMngVO pubMngVO = new PubMngVO();
		if("po".equals(status)) {
			pubMngVO.setScreenSize(15);
			pubMngVO.setBlockSize(3);
		}
		if(StringUtils.isNotBlank(searchWord)) {	// 검색을 함
			pubMngVO.setSearchWord(searchWord);
		}
		pubMngVO.setCurrentPage(currentPage);
		List<PubMngVO> pubList = pubService.pubList(pubMngVO);
		pubMngVO.setDataList(pubList);
		int totalRecord = pubService.pubListCnt();
		pubMngVO.setTotalRecord(totalRecord);
		return pubMngVO;
	}
	// 출판사 등록
	@ResponseBody
	@PostMapping("/insert")
	public String pubInsert(@RequestBody PubMngVO pubMngVO) {
		log.info("pubInsert controller 도착");
		log.info("pubMngVO" + pubMngVO);
		String encodepw = pe.encode(pubMngVO.getAe_pw());
		log.info("encodepw" + encodepw);
		pubMngVO.setAe_pw(encodepw);
		return pubService.insertPub(pubMngVO);
	}
	
	@ResponseBody
	@GetMapping("/cnt")
	public int countPub() {
		return pubService.pubListCnt();
	}
}
