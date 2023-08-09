package kr.or.ddit.security;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class CommonController {
	
	@RequestMapping(value = "/accessError")
	public void accessDenied(Authentication auth, Model model) {
		log.info("accessDenied 클래스 발동! 접근이 거부되었습니다");
		log.info("Access Denied : "+auth);
		model.addAttribute("msg","Access Denied");
	}
}
