package kr.or.ddit.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class TestController {
	
	// 하루터
	@RequestMapping(value = "/haruter", method = RequestMethod.GET)
	public String goMainPlz() {
		return "haruter/haruFeed";
	}
	
	// 국내도서
	@RequestMapping(value = "/book", method = RequestMethod.GET)
	public String goBook() {
		return "bookstore/shop/koreaBook";
	}
	
	// 책 디테일
	@RequestMapping(value = "/bookDetail", method = RequestMethod.GET)
	public String goBookDetail() {
		return "bookstore/shop/book-detail";
	}
	
	// 카트
	@RequestMapping(value = "/cart", method = RequestMethod.GET)
	public String cart() {
		return "bookstore/shop/cart";
	}
	
	
}
