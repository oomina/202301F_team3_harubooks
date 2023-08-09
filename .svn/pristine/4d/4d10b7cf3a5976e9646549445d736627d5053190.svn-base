 package kr.or.ddit.controller.ljy.mng;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.service.FileService;
import kr.or.ddit.service.ljy.InquiryService;
import kr.or.ddit.service.ljy.NoticeService;
import kr.or.ddit.vo.FileVO;
import kr.or.ddit.vo.ljy.InquiryVO;
import kr.or.ddit.vo.ljy.NoticeVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/mng/board")
@Slf4j
public class BoardRestController {
	
	@Resource(name="uploadFiles")
	private String uploadPath;
	
	@Autowired
	private NoticeService noticeService;
	@Autowired
	private InquiryService inquiryService;
	@Autowired
	private FileService fileService;
	
	// 공지 리스트 notice list
	@ResponseBody
	@GetMapping(value="/notice", produces = "application/json;charset=utf-8")
	public NoticeVO noticeList(
			@RequestParam(name = "page", required = false, defaultValue = "1") int currentPage
			){
		log.debug("noticeList controller 도착");
		NoticeVO noticeVO = new NoticeVO();
		noticeVO.setCurrentPage(currentPage);
		List<NoticeVO> noticeList = noticeService.noticeList(noticeVO);
		noticeVO.setDataList(noticeList);
		if(noticeList == null || noticeList.size() == 0) {
			noticeVO.setTotalRecord(0);
		} else {
			noticeVO.setTotalRecord(noticeList.get(0).getTotalRecord());
		}
		return noticeVO;
	}
	
	// 공지 1개 조회
	@ResponseBody
	@GetMapping(value = "/notice/{no_no}", produces = "application/json;charset=utf-8")
	public NoticeVO noticeOne(@PathVariable("no_no") String notice_no) {
		return noticeService.noticeOne(notice_no);
	}
	
	// 첨부파일 리스트 가져오기
	@ResponseBody
	@GetMapping(value = "/notice/fileList/{ua_no}", produces = "application/json;charset=utf-8")
	public List<FileVO> fileList(@PathVariable("ua_no") String ua_no){
		return fileService.fileList(ua_no);
	}
	
	// 공지사항 등록(비동기로 파일 업로드) 1개 업로드
	//multipart formdata
	@ResponseBody
	@PostMapping(value="/notice", produces = "text/plain; charset=utf-8")
	public String noticeInsert(NoticeVO noticeVO) throws IOException {
		log.info("noticeInsert controller 도착");
		String uploadrslt = "";
		// 공지사항 등록
		int rslt = noticeService.noticeInsert(noticeVO);
		if (rslt > 0) {
			uploadrslt = noticeVO.getNotice_no();
		} else {
			uploadrslt = "fail";
		}
		return uploadrslt;
	}

	// 공지사항 수정
	@ResponseBody
	@PutMapping(value="/notice", produces = "text/plain; charset=utf-8")
	public String noticeUpdate(NoticeVO updateNoticeVO) throws IOException {
		log.info("noticeupdate 컨트롤러 넘어옴");
		int cnt = noticeService.noticeUpdate(updateNoticeVO);
		String updaterslt = "";
		if(cnt > 0) {
			updaterslt = updateNoticeVO.getNotice_no();
		} else {
			updaterslt = "fail";
		}
		return updaterslt;
	}
	
	// 공지사항 삭제
	@ResponseBody
	@DeleteMapping(value="/notice", produces = "text/plain; charset=utf-8")
	public String noticeDelete(@RequestBody String no_no) {
		int cnt = noticeService.noticeDelete(no_no);
		// 파일 삭제 부분 필요
		String delrslt = "";
		if(cnt > 0 ) {
			delrslt = "success";
		} else {
			delrslt = "fail";
		}
		return delrslt; 
	}
	
	// 문의 리스트 inquiry list
	@ResponseBody
	@GetMapping(value = "/inquiry", produces = "application/json;charset=utf-8")
	public InquiryVO inquiryList(
			@RequestParam(name = "page", required = false, defaultValue = "1") int currentPage
			){
		log.debug("inquiryList controller 도착");
		InquiryVO inquiryVO = new InquiryVO();
		inquiryVO.setCurrentPage(currentPage);
		List<InquiryVO> inquiryList = inquiryService.inquiryList(inquiryVO);
		inquiryVO.setDataList(inquiryList);
		if(inquiryList == null || inquiryList.size() == 0) {
			inquiryVO.setTotalRecord(0);
		} else {
			inquiryVO.setTotalRecord(inquiryList.get(0).getTotalRecord());
		}
		return inquiryVO;
	}
	
	// 문의 1개 조회
	@ResponseBody
	@GetMapping(value = "/inquiry/{inq_no}", produces = "application/json;charset=utf-8")
	public InquiryVO inquiryOne(@PathVariable("inq_no") String inquiry_no){
		log.debug("inquiryOne controller 도착");
		return inquiryService.inquiryOne(inquiry_no);
	}
	
	// 문의 댓글 등록
	@ResponseBody
	@PostMapping(value = "/inquiry/rep")
	public String inqRepInsert(@RequestBody InquiryVO inquiryVO) {
		log.debug("inqRepInsert controller 도착");
		int cnt = inquiryService.inqRepUpdate(inquiryVO);
		String rslt = "";
		if(cnt > 0) {
			rslt = "success";
		} else {
			rslt = "fail";
		}
		return rslt;
	}
	
	@ResponseBody
	@GetMapping("/inqcnt")
	public int countInq() {
		log.info("countInq");
		return inquiryService.countInq();
	}
	
}
