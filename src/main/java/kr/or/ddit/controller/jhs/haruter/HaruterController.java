package kr.or.ddit.controller.jhs.haruter;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.service.bmk.IFindLibraryService;
import kr.or.ddit.vo.bmk.FindLibraryVO;

@Controller
@RequestMapping("/haruter")
public class HaruterController {
	
	@Autowired
	private IFindLibraryService findLibraryService;
	
	// 하루피드 폼으로 이동
	@PreAuthorize("hasRole('ROLE_MEMBER')")
	@GetMapping("/haruFeed")
	public String signinForm(Model model, HttpSession session) {
		String id = SecurityContextHolder.getContext().getAuthentication().getName();
		session.setAttribute("aeId", id);
		model.addAttribute("status", 1);
		return "haruter/haruFeed";
	}
	
	// 나의 하루로 이동
	@PreAuthorize("hasRole('ROLE_MEMBER')")
	@GetMapping("/mystory")
	public String getMyStory(Model model, HttpSession session) {
		model.addAttribute("status", 1);
		return "haruter/myStory";
	}
	
	// 나의 채팅방으로 이동
	@PreAuthorize("hasRole('ROLE_MEMBER')")
	@GetMapping("/mychatting")
	public String getMyChatting(Model model, HttpSession session) {
		model.addAttribute("status", 2);
		return "haruter/myChatting";
	}
	
	// 로그인 한 ae_id의 주소값 받기 위한 컨트롤러
	@ResponseBody
	@GetMapping("/getAddr")
	public FindLibraryVO getAddr(String ae_id) {
		FindLibraryVO fvo = findLibraryService.getAddress(ae_id);
		return fvo;
	}
	
}
