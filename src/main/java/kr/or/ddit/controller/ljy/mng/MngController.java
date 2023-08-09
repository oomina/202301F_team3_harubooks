package kr.or.ddit.controller.ljy.mng;

import org.springframework.security.access.annotation.Secured;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/mng")
@Controller
@PreAuthorize("hasRole('ROLE_ADMIN')")
//@Secured("ROLE_ADMIN")
public class MngController {
	// 메인
	@GetMapping("")
	public String goMain() {
		return "mng/dashboard";
	}
	// 도서 정보
	@GetMapping("/books")
	public String goBooks() {
		return "mng/books";
	}
	// 도서 상세
	@GetMapping("/booksInfo/{no}")
	public String goBooksInfo() {
		return "mng/booksInfo";
	}
	// 도서 정보 등록
	@GetMapping("/bookRequest")
	public String goBookRequest() {
		return "mng/bookRequest";
	}
	// 카테고리
	@GetMapping("/category")
	public String goCategory() {
		return "mng/category";
	}
	// 카테고리 대분류
	@GetMapping("/category/main")
	public String goCategoryMain() {
		return "mng/categoryMain";
	}
	// 카테고리 중분류
	@GetMapping("/category/mid")
	public String goCategoryMid() {
		return "mng/categoryMid";
	}
	// 회원관리
	@GetMapping("/mbr")
	public String goMbr() {
		return "mng/mbr";
	}
	// 회원 상세
	@GetMapping("/mbrInfo/{id}")
	public String goMbrInfo() {
		return "mng/mbrInfo";
	}
	// 공지사항
	@GetMapping("/notice")
	public String goNotice() {
		return "mng/notice";
	}
	// 공지사항 등록
	@GetMapping("/noticeForm")
	public String goNoticeForm() {
		return "mng/noticeboardForm";
	}
	// 공지 1개 조회
	@GetMapping("/notice/{no_no}")
	public String goNoticeDetail() {
		return "mng/noticeDetail";
	}
	// 문의내역
	@GetMapping("/inquiry")
	public String goInquiry() {
		return "mng/inquiry";
	}
	// 문의 1개 조회
	@GetMapping("/inquiry/{inq_no}")
	public String goInquiryDetail() {
		return "mng/inquiryDetail";
	}
	// 작가와의 만남
	@GetMapping("/meta")
	public String goMeta() {
		return "mng/meta";
	}
	// 주문내역
	@GetMapping("/orders")
	public String goOrders() {
		return "mng/orders";
	}
	// 환불내역
	@GetMapping("/refunds")
	public String goRefunds() {
		return "mng/refunds";
	}
	// 재고내역
	@GetMapping("/remains")
	public String goRemains() {
		return "mng/remains";
	}
	// 발주내역
	@GetMapping("/po")
	public String goPo() {
		return "mng/po";
	}
	// 발주 신청
	@GetMapping("/poRequest")
	public String goPoRequest() {
		return "mng/poRequest";
	}
	// 판매관리
	@GetMapping("/sales")
	public String goSales() {
		return "mng/sales";
	}
	// 출판사관리
	@GetMapping("/publisher")
	public String goPublisher() {
		return "mng/publisher";
	}
}
