package kr.or.ddit.controller.kmw.login;

import java.util.Map;
import java.util.Properties;
import java.util.Random;
import javax.annotation.PostConstruct;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.aop.support.AopUtils;
import org.springframework.security.authentication.jaas.SecurityContextLoginModule;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.ResultStatus;
import kr.or.ddit.service.LoginService;
import kr.or.ddit.vo.UserInfoVO;
import lombok.extern.slf4j.Slf4j;
import oracle.jdbc.proxy.annotation.Post;

@Controller
@RequestMapping("/login")
@Slf4j
public class LoginController {
	
	@Inject
	private LoginService service;
	
	@Inject
	private BCryptPasswordEncoder pe;
	
//	@PostConstruct
//	public void init() {
//		System.out.println("##############################"+AopUtils.isAopProxy(service));
//	}
	
	// 로그인 폼으로 이동
	@GetMapping("/signinForm")
	public String signinForm(@RequestParam(name = "state", required = false, defaultValue = "0") int state
			, Model model) {
		
		if(state == 1) {
			model.addAttribute("msg","하루북스 회원이되신걸 환영합니다");
		}
		if(state == 2) {
			model.addAttribute("msg","로그인에 실패하였습니다 다시 로그인해주세요");
		}
		return "login/login";
	}
	
	// 로그인 로직 처리
	@PostMapping("/signin.do")
	public String signin() {
		return "";
	}
	
	// 회원가입 폼으로 이동
	@GetMapping("/signupForm")
	public String signupForm() {
		return "login/join";
	}
	
	
	
	// 회원가입 로직 처리
	@PostMapping("/signup.do")
	public String signup(UserInfoVO user) {
		String encodePw = pe.encode(user.getAe_pw());
		user.setAe_pw(encodePw);
		ResultStatus result = service.insertMember(user);		
		if(result.equals(ResultStatus.OK)) {
			return "redirect:/login/signinForm?state=1";
		}else {
			return "redircet:/login/signupForm?state=1";
		}
	}
	
	// 아이디 중복확인 로직
	@ResponseBody
	@PostMapping("/idCheck")
	public String idCheck(@RequestBody String idVal) {
		ResultStatus result = service.idCheck(idVal);
		if(result.equals(ResultStatus.OK)) {
			return "ok";
		}else {
			return "fail";
		}
	}
	
	// 아이디/비밀번호 찾기폼 이동
	@GetMapping("/findInfoForm")
	public String findInfoForm() {
		return "login/findByIdPw";
	}
	
	// 아이디 찾기 로직 처리
	@ResponseBody
	@PostMapping("/findId.do")
	public String findInfo(@RequestBody Map<String, String> resMap) {
		String name = resMap.get("user_nm");
		String email = resMap.get("mbr_email");
		UserInfoVO vo = new UserInfoVO();
		vo.setUser_nm(name);
		vo.setMbr_email(email);		
		String resultId = service.findId(vo);
		
		return resultId;
	}
	
	// 비밀번호 찾기 로직 처리
	@ResponseBody
	@PostMapping("/findPw.do")
	public String findPw(@RequestBody Map<String, String> resMap) {
		String name = resMap.get("name");
		String id = resMap.get("id");
		String eMail = resMap.get("eMail");
		UserInfoVO vo = new UserInfoVO();
		vo.setUser_nm(name);
		vo.setAe_id(id);
		vo.setMbr_email(eMail);
		ResultStatus result = service.findPw(vo);
		if(result.equals(ResultStatus.OK)) {
			return "OK";
		}else {
			return "FAIL";
		}
	}
	
	// 비밀번호 재설정 로직 처리
	@GetMapping("/resetPw")
	public String resetPw(@RequestParam("id") String id,@RequestParam("pw") String pw) {
		String userId = id;
		String encodePw = pe.encode(pw);
		System.out.println(userId);
		System.out.println(pw);
		System.out.println(encodePw);
		UserInfoVO vo = new UserInfoVO();
		vo.setAe_id(userId);
		vo.setAe_pw(encodePw);
		// 권한을 ROLE_TEMP로 업데이트한다.
		service.resetRole(id);
		// 비밀번호를 지우고 임시비밀번호로 바꾼다.
		service.resetPw(vo);
		return "redirect:/login/signinForm";
	}
	
	// 임시회원 비밀번호 재설정 폼
	@GetMapping("/resetPwForm")
	public String resetPwForm() {
		return "login/resetPw";
	}
	
	// 임시회원 비밀번호 재설정 로직
	@PostMapping("/resetPw")
	public String resetPw(String ae_pw, RedirectAttributes ra,HttpServletRequest request, HttpServletResponse response) {
		String id = SecurityContextHolder.getContext().getAuthentication().getName();
		String encodePw = pe.encode(ae_pw);
		UserInfoVO vo = new UserInfoVO();	
		vo.setAe_pw(encodePw);
		vo.setAe_id(id);
		service.resetTempRole(id);
		service.resetPw(vo);
		
		// 스프링 시큐리티 세션 무효화 및 제거
		SecurityContextLogoutHandler logout = new SecurityContextLogoutHandler();
		logout.setInvalidateHttpSession(true);
		logout.logout(request, response, SecurityContextHolder.getContext().getAuthentication());
		ra.addFlashAttribute("msg","비밀번호가 정상적으로 변경되었습니다.");
		return "redirect:/login/signinForm";
	}
	
	// 비회원 배송조회 폼이동
	@GetMapping("/nonMemberOrderListForm")
	public String nonMemberDeliveryForm() {
		return "login/nonMemOrderList";
	}
	// 비회원 배송조회 로직 처리
	@PostMapping("/nonMemberOrderList.do")
	public String nonMemberDelivery() {
		return "";
	}
	
	// logout 실행
	@GetMapping("/logout")
	public String logout(HttpServletRequest request, HttpServletResponse response, RedirectAttributes ra) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if(auth != null) {
			new SecurityContextLogoutHandler().logout(request, response, auth);
		}
		
		ra.addFlashAttribute("msg","로그아웃 되었습니다.");
		return"redirect:/harubooks/main";
	}
	
	// error-page실행
	@GetMapping("/errorPage")
	public String error() {
		return "";
	}
}
