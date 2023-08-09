package kr.or.ddit.controller.accessDenied;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/denied")
public class DeniedController {
	
	@GetMapping("")
	public String accessDenied() {
		return "bookstore/others/error";
	}
}
