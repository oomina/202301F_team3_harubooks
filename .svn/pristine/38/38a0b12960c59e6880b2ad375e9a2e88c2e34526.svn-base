package kr.or.ddit.controller.bmk.myHaru;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import freemarker.template.utility.StringUtil;
import kr.or.ddit.service.bmk.IMyCalService;
import kr.or.ddit.vo.bmk.CalendarVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/myHaru")
public class MyCalController {
	
	@Autowired
	private IMyCalService calService;
	
	// 나의 일정으로 이동
	@PreAuthorize("hasRole('ROLE_MEMBER')")
	@GetMapping("/mycal")
	public String myCalendar() {
		return "myHaru/myCalendar";
	}
	
	// 나의 일정 조회
	@GetMapping(value = "/mycals", produces = "application/json;charset=utf-8")
	public ResponseEntity<List<CalendarVO>> getCal(String ae_id) {
		List<CalendarVO> lvo = calService.getCal(ae_id);
		return new ResponseEntity<List<CalendarVO>>(lvo, HttpStatus.OK);  
	}
	
	// 나의 일정 상세 조회
	@GetMapping(value = "/mydetailcal", produces = "application/json;charset=utf-8")
	public ResponseEntity<CalendarVO> getDetailCal(String cal_no){
		CalendarVO cvo = calService.getDetailCal(cal_no);
		return new ResponseEntity<CalendarVO>(cvo, HttpStatus.OK);
	}
	
	// 나의 일정 등록
	@PostMapping(value = "/mycal", produces = "application/text;charset=utf-8")
	public ResponseEntity<String> insertCal(CalendarVO calVO){
		if(StringUtils.isBlank(calVO.getCal_title())) {
			return new ResponseEntity<String>("FAIL", HttpStatus.OK);
		}
		if(StringUtils.isBlank(calVO.getCal_content())) {
			return new ResponseEntity<String>("FAIL", HttpStatus.OK);
		}
		if(StringUtils.isBlank(calVO.getCal_color())) {
			return new ResponseEntity<String>("FAIL", HttpStatus.OK);
		}
		int result = calService.insertCal(calVO);
		String status;
		if (result > 0 ) {
			status = "OK";
		}else {
			status = "FAIL";
		}
		return new ResponseEntity<String>(status, HttpStatus.OK);
	}
	
	// 일정 수정
	@PutMapping(value = "/mycal")
	@ResponseBody
	public String updateCal(@RequestBody CalendarVO calVO){
		int result = calService.updateCal(calVO);
		String status;
		if (result > 0 ) {
			status = "OK";
		}else {
			status = "FAIL";
		}
		return status;
	}
	
	// 일정 드래그앤 드롭, 리사이징 
	@ResponseBody
	@PutMapping(value = "/mycalmove")
	public String updateMove(@RequestBody CalendarVO calVO){
		int result = calService.updateMove(calVO);
		String status;
		if (result > 0 ) {
			status = "OK";
		}else {
			status = "FAIL";
		}
		return status;
	}
	
	@ResponseBody
	@DeleteMapping(value = "/mycal/{num}")
	public String deleteCal(@PathVariable("num") String calNo) {
		int result = calService.deleteCal(calNo);
		String status;
		if (result > 0 ) {
			status = "OK";
		}else {
			status = "FAIL";
		}
		return status;
	}
}
