package kr.or.ddit.controller.odh.mypage;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
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
import kr.or.ddit.service.kmw.BookService;
import kr.or.ddit.service.odh.MyPageService;
import kr.or.ddit.vo.UserInfoVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/mypage")
@Slf4j
public class MyPageController {

	@Inject
	private MyPageService mypageService;
	
	@Inject
	private LoginService userSevice;
	
	@Inject
	private BookService bookService;
	
	@Inject
	private BCryptPasswordEncoder pe;
	
	@ResponseBody
	@PostMapping("/pwCheck")
	public String pwCheck(@RequestBody String ae_id, String memberPw) {
	    ResultStatus result = mypageService.checkPw(ae_id, memberPw);
	    return String.valueOf(result.equals(ResultStatus.OK));
	}
	
	@GetMapping("/agree")
	@PreAuthorize("isAuthenticated()")
	public String MyPageAgree(Model model) {
		
		String userId = SecurityContextHolder.getContext().getAuthentication().getName();
		// 유저 정보
		UserInfoVO userInfo = userSevice.selectUser(userId);
		// 장바구니 개수
		int cartCnt = bookService.cartCnt(userId);
		// 찜목록 개수
		int wishCnt = bookService.wishCnt(userId);
		
		model.addAttribute("userId", userId);
		model.addAttribute("userInfo", userInfo);
		model.addAttribute("cartCnt", cartCnt);
		model.addAttribute("wishCnt", wishCnt);
		
		return "bookstore/mypage/modifyagree";
	}
	
	@PostMapping("/test")
	@PreAuthorize("isAuthenticated()")
	public String areetest(@RequestParam("memberPw") String memPw, UserInfoVO vo, Model model ) {
		
		// 로그인할때 시큐리티세션 즉 userId에 정보가 저장이 되기때문에 꺼내서 쓸려고 하는것
		String userId = SecurityContextHolder.getContext().getAuthentication().getName();
		// userId안의 정보를 쓸려고 매핑된 mapper에서 값을 꺼내올려고 하는것
		UserInfoVO member = mypageService.selectPw(userId);
		
		// 유저 정보
		UserInfoVO userInfo = userSevice.selectUser(userId);
		// 장바구니 개수
		int cartCnt = bookService.cartCnt(userId);
		// 찜목록 개수
		int wishCnt = bookService.wishCnt(userId);
		
		// 로그인 했을때 내가 입력한 비밀번호를 꺼내 쓸려고 하는것
		String encodedPwd = member.getAe_pw();
		// 회원정보를 들어갈 때 내가 입력하는 비밀번호정보
		String newPwd = memPw;
		
		model.addAttribute("userId", userId);
		model.addAttribute("member", member);
		model.addAttribute("userInfo", userInfo);
		model.addAttribute("cartCnt", cartCnt);
		model.addAttribute("wishCnt", wishCnt);
		model.addAttribute("encodedPwd", encodedPwd);
		
		// 입력한 값이 제대로 들어왔는지 값 찍어보기
		System.out.println(encodedPwd);
		System.out.println(newPwd);
		System.out.println(userId);
		System.out.println(member);
		System.out.println(userInfo);
		System.out.println(cartCnt); 
		System.out.println(wishCnt);
		
		// if문을 통해서 매치가 되서 true면 마이페이지 메인으로 넘어가고
		// false면 다시 인증할 수 있는 페이지로 넘어간다.
		if(pe.matches(newPwd, encodedPwd)) {
			System.out.println("true");
			model.addAttribute("msg", "비밀번호 인증에 성공하였습니다.");
			model.addAttribute("url", "/mypage/main");  
			return "bookstore/mypage/alert";
		}else {
			System.out.println("false");
			model.addAttribute("msg", "비밀번호 인증에 실패하였습니다.");
			model.addAttribute("url", "/mypage/agree");
			return  "bookstore/mypage/alert2";
		}

	}
	
	
	
	@GetMapping("/main")
	@PreAuthorize("isAuthenticated()")	
	public String UpdatePage(Model model) {
		// 로그인할때 시큐리티세션 즉 userId에 정보가 저장이 되기때문에 꺼내서 쓸려고 하는것
		String userId = SecurityContextHolder.getContext().getAuthentication().getName();
		log.info(userId);
		// userId안의 정보를 쓸려고 매핑된 mapper에서 값을 꺼내올려고 하는것
		//UserInfoVO member = mypageService.selectUser(userId);
		UserInfoVO member = mypageService.selectPw(userId);
		// 유저 정보
		UserInfoVO userInfo = userSevice.selectUser(userId);
		// 장바구니 개수
		int cartCnt = bookService.cartCnt(userId);
		// 찜목록 개수
		int wishCnt = bookService.wishCnt(userId);
		
		// model을 통해 jsp로 값 넘기기
		model.addAttribute("userId", userId);
		model.addAttribute("member", member);
		model.addAttribute("userInfo", userInfo);
		model.addAttribute("cartCnt", cartCnt);
		model.addAttribute("wishCnt", wishCnt); 
		//model.addAttribute("member", member);
		
		// 마이페이지로 리턴해줌으로써 내가 만든 jsp 즉 마이페이지 화면이 보이게 된다.
		return "bookstore/mypage/mypage";
	}
	
	
	@PostMapping("/modify")
	@PreAuthorize("isAuthenticated()")
	public String Modify(HttpServletRequest req, UserInfoVO userVO, RedirectAttributes ra, Model model) {
		
		// 비밀번호 업데이트를 하는데 있어서 암호화된 비밀번호로 업데이트 시키는 로직이다.
		String modifyPwd = pe.encode(userVO.getAe_pw());
		userVO.setAe_pw(modifyPwd);
		
		// 변경된 비밀번호가 암호화가 잘 되었는지 체크하는 부분
		System.out.println(modifyPwd);
		// mapper sql로 업데이트 쿼리 작성한걸 토대로 resultStatus 즉 결과상태로 수정의 결과를 확인하는 부분이다.
		ResultStatus result = mypageService.memberUpdate(req, userVO);
		// OK면 수정이 잘 된것으로 메인으로 넘어간다.
		if(result.equals(ResultStatus.OK)) {
			SecurityContextHolder.clearContext();
			return  "redirect:/harubooks/main";
		// 수정이 잘 되지 않았으면 다시 마이페이지로 넘어가서 수정해야 한다.
		}else {
			model.addAttribute("member", userVO);
			return  "bookstore/mypage/mypage";
		}
	}
	
	@GetMapping("/agree2")
	@PreAuthorize("isAuthenticated()")
	public String MyPageAgree2(Model model) {
		String userId = SecurityContextHolder.getContext().getAuthentication().getName();
		
		model.addAttribute("userId", userId);
		return "redirect:/mypage/agree3";
	}
	
	@GetMapping("/agree3")
	@PreAuthorize("isAuthenticated()")	
	public String MyPageAgree3(Model model) {

		// 유저 아이디 세션
		String userId = SecurityContextHolder.getContext().getAuthentication().getName();
		// 유저 비밀번호
		UserInfoVO member = mypageService.selectPw(userId);
		// 유저 정보
		UserInfoVO userInfo = userSevice.selectUser(userId);
		// 장바구니 개수
		int cartCnt = bookService.cartCnt(userId);
		// 찜목록 개수
		int wishCnt = bookService.wishCnt(userId);
		
		model.addAttribute("member", member);
		model.addAttribute("userId",userId);
		model.addAttribute("userInfo", userInfo);
		model.addAttribute("cartCnt", cartCnt);
		model.addAttribute("wishCnt", wishCnt);
		return "bookstore/mypage/deleteagree";
	}
	
	@GetMapping("/delpage")
	@PreAuthorize("isAuthenticated()")	
	public String delPage(Model model,
			HttpServletResponse response) {
		
		// 캐쉬 저장 안한다.
		response.setHeader("Cache-Control","no-store");
		String userId = SecurityContextHolder.getContext().getAuthentication().getName();
		log.info(userId);
		
		// 유저 정보
		UserInfoVO userInfo = userSevice.selectUser(userId);
		// 장바구니 개수
		int cartCnt = bookService.cartCnt(userId);
		// 찜목록 개수
		int wishCnt = bookService.wishCnt(userId);
		
		model.addAttribute("userId", userId);
		model.addAttribute("userInfo", userInfo);
		model.addAttribute("cartCnt", cartCnt);
		model.addAttribute("wishCnt", wishCnt);
		
		return "bookstore/mypage/check";
	}
	
	@PostMapping("/test2")
	@PreAuthorize("isAuthenticated()")
	public String areetest2(@RequestParam("memberPw") String memPw, UserInfoVO vo,
			Model model) {
		
		
		// 로그인할때 시큐리티세션 즉 userId에 정보가 저장이 되기때문에 꺼내서 쓸려고 하는것
		String userId = SecurityContextHolder.getContext().getAuthentication().getName();
		// userId안의 정보를 쓸려고 매핑된 mapper에서 값을 꺼내올려고 하는것
		UserInfoVO member = mypageService.selectPw(userId);
		
		// 유저 정보
		UserInfoVO userInfo = userSevice.selectUser(userId);
		// 장바구니 개수
		int cartCnt = bookService.cartCnt(userId);
		// 찜목록 개수
		int wishCnt = bookService.wishCnt(userId);
		
		// 로그인 했을때 내가 입력한 비밀번호를 꺼내 쓸려고 하는것
		String encodedPwd = member.getAe_pw();
		// 회원정보를 들어갈 때 내가 입력하는 비밀번호정보
		String newPwd = memPw;
		
		// 입력한 값이 제대로 들어왔는지 값 찍어보기
		System.out.println(encodedPwd);
		System.out.println(newPwd);
		
		model.addAttribute("userId", userId);
		model.addAttribute("userInfo", userInfo);
		model.addAttribute("cartCnt", cartCnt);
		model.addAttribute("wishCnt", wishCnt);
		
		// if문을 통해서 매치가 되서 true면 마이페이지 메인으로 넘어가고
		// false면 다시 인증할 수 있는 페이지로 넘어간다.
		if(pe.matches(newPwd, encodedPwd)) {
			System.out.println("true");
			model.addAttribute("msg", "비밀번호 인증에 성공하였습니다.");
			model.addAttribute("url", "/mypage/delpage");
			return "bookstore/mypage/alert";
		}else {
			System.out.println("false");
			model.addAttribute("msg", "비밀번호 인증에 실패하였습니다.");
			model.addAttribute("url", "/mypage/agree2");
			return  "bookstore/mypage/alert2";
		}
	}
		
	@PostMapping("/delete")
	@PreAuthorize("isAuthenticated()")
	public String delete(HttpServletRequest req, @RequestParam("ae_id") String id, Model model) {
		
		ResultStatus result = null; 
		
		result = mypageService.memberDelete(req, id);
		if(result.equals(ResultStatus.OK)) {
			SecurityContextHolder.clearContext();
			return "redirect:/harubooks/main";
		}else {
			model.addAttribute("message", "서버오류, 다시 시도해주세요!");
			return "bookstore/mypage/mypage";
		}
	}
}
