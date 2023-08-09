package kr.or.ddit.controller.ljy.pub;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/pub")
@PreAuthorize("hasRole('ROLE_PUBLISHER')")
public class PubController {
	// 메인
	@GetMapping("")
	public String goMain() {
		return "pub/dashboard";
	}
	// 도서 등록 요청
	@GetMapping("/bookRequest")
	public String goBookRequest() {
		return "pub/bookRequest";
	}
	// 도서 등록 폼
	@GetMapping("/bookRequestForm")
	public String goBookRequestForm() {
	   return "pub/bookRequestForm";
	}
	// 재고 관리
	@GetMapping("/remains")
	public String goRemains() {
		return "pub/remains";
	}
	// 발주 관리
	@GetMapping("/po")
	public String goPo() {
		return "pub/po";
	}
	// 판매관리
	@GetMapping("/sales")
	public String goSales() {
		return "pub/sales";
	}
	// 발주서 다운
	@GetMapping("/podown")
	public String goPoDown() {
		return "pub/podown";
	}
}
