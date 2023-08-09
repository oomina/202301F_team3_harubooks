package kr.or.ddit.controller.bmk.haruter;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.service.bmk.IHarustoryService;
import kr.or.ddit.vo.bmk.BoardVO;
import kr.or.ddit.vo.bmk.ReplyVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/haruter")
public class HarustoryController {
	
	
	@Autowired
	private IHarustoryService harustoryService;
	
	// 리스트 조회
	@ResponseBody
	@GetMapping(value = "/harustory")
	public List<BoardVO> boardList(BoardVO vo){
		List<BoardVO> lvo = harustoryService.boardList(vo);
		return lvo;
	}
	
	// 상세 조회
	@ResponseBody
	@GetMapping(value = "/harustorys")
	public Map<String,Object> boardOne(BoardVO vo){
		Map<String,Object> mvo = harustoryService.boardOne(vo);
		return mvo;
	}
	
	// 댓글 가져오기
	@ResponseBody
	@GetMapping(value = "/getReplyList")
	public List<ReplyVO> getReplyList(ReplyVO vo){
		List<ReplyVO> lvo = harustoryService.getReplyList(vo);
		return lvo;
	}
	
	// 댓글 삭제하기
	@ResponseBody
	@PostMapping(value="/replyDelete")
	public String replyDelete(ReplyVO vo) {
		String state = harustoryService.replyDelete(vo);
		return state;
	}
	
	// 댓글 수정하기
	@ResponseBody
	@PostMapping(value="/updateApply")
	public String updateApply(ReplyVO vo) {
		String state = harustoryService.updateApply(vo);
		return state;
	}
	
	
	// 대댓글 가져오기
	@ResponseBody
	@GetMapping(value = "/getSubReplyList")
	public List<ReplyVO> getSubReplyList(ReplyVO vo){
		List<ReplyVO> lvo = harustoryService.getSubReplyList(vo);
		return lvo;
	}
	
	// 파일 및 자유게시판 생성
	@PreAuthorize("hasRole('ROLE_MEMBER')")
	@PostMapping(value="/insertFeed")
	public ResponseEntity<String> insertFeed(BoardVO bvo) throws IOException{
		String result = harustoryService.insertFeed(bvo);	
		
		return new ResponseEntity<String>(result, HttpStatus.OK);
	}
	
	
	// 인서트
	@PreAuthorize("hasRole('ROLE_MEMBER')")
	@ResponseBody
	@PostMapping(value="/harustory", produces = "application/json;charset=utf-8")
	public int storyInsert(@RequestBody Map<String, String> resMap) {
		String title = resMap.get("storyTitle");
		String content = resMap.get("storyContent");
		String ae_id = resMap.get("id");
		BoardVO vo = new BoardVO();
		vo.setBoard_title(title);
		vo.setBoard_content(content);
		vo.setAe_id(ae_id);
		return harustoryService.storyInsert(vo);
	}
	
	// 수정
	@PreAuthorize("hasRole('ROLE_MEMBER')")
	@ResponseBody
	@PostMapping(value = "/updateHarustory")
	public String storyUpdate(BoardVO boardVO) {
		int result = harustoryService.updateHarustory(boardVO);
		String status = "";
		if(result > 0) {
			status = "OK";
		}else {
			status = "FAIL";			
		}
		return status;
	}
	
	// 삭제
	@PreAuthorize("hasRole('ROLE_MEMBER')")
	@ResponseBody
	@PostMapping(value = "/deleteHarustory")
	public String deleteHarustory(BoardVO vo) {
		String status = harustoryService.deleteHarustory(vo);
		return status;
	}
	
	// 좋아요
	@PreAuthorize("hasRole('ROLE_MEMBER')")
	@ResponseBody
	@PostMapping(value = "/likeCehck")
	public String likeCehck(BoardVO vo) {
		String like = harustoryService.likeCehck(vo);
		return like;
	}
	
	// 댓글 작성
	@PreAuthorize("hasRole('ROLE_MEMBER')")
	@ResponseBody
	@PostMapping(value="/replyInsert")
	public String replyInsert(ReplyVO vo) {
		String result = harustoryService.replyInsert(vo);
		return result;
	}
	
	// 나의 스토리 리스트 조회
	@ResponseBody
	@GetMapping(value = "/mystorys")
	public List<BoardVO> getMyStoryList(BoardVO ae_id){
		List<BoardVO> lvo = harustoryService.getMyStoryList(ae_id);
		return lvo;
	}

	
	
	
}
