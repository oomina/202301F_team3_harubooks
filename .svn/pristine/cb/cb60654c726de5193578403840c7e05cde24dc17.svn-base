package kr.or.ddit.controller.jhs.myHaru;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.service.bmk.IFindLibraryService;
import kr.or.ddit.service.jhs.IMyLibraryService;
import kr.or.ddit.vo.bmk.FindLibraryVO;
import kr.or.ddit.vo.jhs.Com_MemberVO;
import lombok.extern.slf4j.Slf4j;


	@Controller
	@RequestMapping("/myHaru")
	@Slf4j
	public class MyHaruCotroller {
	
	@Autowired
	private IFindLibraryService findLibraryService;
	
	// 하루피드 사용자의 정보 가져오기
	@Inject
	private IMyLibraryService service;
		
	@GetMapping("/getUser")
	public ResponseEntity<Com_MemberVO> getUser(String id) {
		Com_MemberVO cvo = service.callComMember(id);
		
		return new ResponseEntity<Com_MemberVO>(cvo, HttpStatus.OK);
	}
	
	@PostMapping(value="/updateUser")
	public ResponseEntity<String> updateUser(
			Com_MemberVO vo, Model model, 
			HttpServletRequest req) {
		
		String status = service.updateUser(req, vo);

		return new ResponseEntity<String>(status, HttpStatus.OK);
	}
	
	// 로그인 한 ae_id의 주소값 받기 위한 컨트롤러
	@ResponseBody
	@GetMapping("/getAddr")
	public FindLibraryVO getAddr(String ae_id) {
		FindLibraryVO fvo = findLibraryService.getAddress(ae_id);
		return fvo;
	}
}
