package kr.or.ddit.controller.odh.wishlist;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.mvel2.optimizers.impl.asm.ProducesBytecode;
import org.springframework.http.MediaType;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.ResultStatus;
import kr.or.ddit.service.LoginService;
import kr.or.ddit.service.kmw.BookService;
import kr.or.ddit.service.odh.WishListService;
import kr.or.ddit.vo.UserInfoVO;
import kr.or.ddit.vo.kmw.BookInfoVO;
import kr.or.ddit.vo.kmw.CartVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/wish")
@Slf4j
public class WishListController {

	@Inject
	private WishListService wishService;
	
	@Inject
	private BookService bookService;
	
	@Inject
	private LoginService userSevice;
	
	@GetMapping("/list")
	@PreAuthorize("isAuthenticated()")
	public String wishlist(BookInfoVO bookVO, Model model) {
		
		String userId = SecurityContextHolder.getContext().getAuthentication().getName();
		
		List<BookInfoVO> wishList = wishService.selectWishList(userId);
		
		// 유저 정보
		UserInfoVO userInfo = userSevice.selectUser(userId);
		// 장바구니 개수
		int cartCnt = bookService.cartCnt(userId);
		// 찜목록 개수
		int wishCnt = bookService.wishCnt(userId);
		
		System.out.println(userId);
		System.out.println(wishList);
		
		model.addAttribute("userId", userId);
		model.addAttribute("wishList", wishList);
		model.addAttribute("userInfo", userInfo);
		model.addAttribute("cartCnt", cartCnt);
		model.addAttribute("wishCnt", wishCnt);
		
		return "bookstore/mypage/wishlist";
	}
	
	// 장바구니 추가하기
		@ResponseBody
		@PostMapping("/basketList")
		@PreAuthorize("isAuthenticated()")
		public String basketList(@RequestBody Map<String, String> resMap) {
			String book_no = resMap.get("book_no");
			String total_price = resMap.get("totalPrice");
			String cart_cnt = resMap.get("cart_cnt");
			String ae_id = resMap.get("ae_id");
			String ccg_b002 = resMap.get("ccg_b002");
			String result;
			CartVO vo = new CartVO();
			vo.setCcg_b002(ccg_b002);
			vo.setAe_id(ae_id);
			vo.setBook_no(book_no);
			vo.setCart_cnt(cart_cnt);
			vo.setTotal_price(total_price);
			boolean isExist = wishService.existCart(vo);
			if (isExist) {
				result = "EXIST";
			} else {
				ResultStatus res = wishService.inputCart(vo);
				if (res.equals(ResultStatus.OK)) {
					result = "OK";
				} else {
					result = "FAIL";
				}  
			}
			return result;
		}
		
	// 장바구니 체크로 추가하기
		@PostMapping("/insert")
		@PreAuthorize("isAuthenticated()")
		public String insertCheck(@RequestParam("valueArr") String[] book_no,
		                          @RequestParam("ae_id") String ae_id,
		                          @RequestParam("total_price") String totalPrice,
		                          @RequestParam("cart_cnt") String cart_cnt,
		                          @RequestParam("ccg_b002") String ccg_b002,
		                          Model model) {
		    try {

		        // wishService의 insert 메서드를 호출하여 장바구니에 상품을 추가하고 결과를 저장
		        ResultStatus result = ResultStatus.OK;
		        for (String bookNo : book_no) {
		            CartVO vo = new CartVO();
		            vo.setAe_id(ae_id);
		            vo.setTotal_price(totalPrice);
		            vo.setCart_cnt(cart_cnt);
		            vo.setCcg_b002(ccg_b002);
		            vo.setBook_no(bookNo);
		            // vo 객체에 필요한 정보 설정 (생략)

		            // wishService의 insert 메서드 호출하여 장바구니에 상품 추가
		            result = wishService.insert(vo);
		            if (!result.equals(ResultStatus.OK)) {
		                // 만약 상품 추가에 실패한 경우, 오류 메시지를 모델에 추가하고 "bookstore/mypage/wishlist" 뷰를 반환
		                model.addAttribute("message", "장바구니 상품 추가에 실패하였습니다.");
		                return "bookstore/mypage/wishlist";
		            }
		        }

		        // 장바구니에 모든 상품 추가가 성공적으로 이루어진 경우, "/wish/list"로 리다이렉트
		        return "redirect:/wish/list";

		    } catch (Exception e) {
		        // 예외가 발생한 경우, 오류 메시지를 모델에 추가하고 "bookstore/mypage/wishlist" 뷰를 반환
		        model.addAttribute("message", "서버 오류가 발생하였습니다.");
		        return "bookstore/mypage/wishlist";
		    }
		}
	
	// 찜 목록 버튼으로 삭제하기
	@PostMapping("/delete")
	@PreAuthorize("isAuthenticated()")
	public String delwishList(HttpServletRequest req, @RequestParam("ae_id") String id,
	        @RequestParam("book_no") String bookNo, Model model) {

	    ResultStatus result = null;

	    result = wishService.deleteList(req, id, bookNo);

	    if (result.equals(ResultStatus.OK)) {
	        return "redirect:/wish/list";
	    } else {
	        model.addAttribute("message", "서버오류!!!");
	        return "bookstore/mypage/wishlist";
	    }
	}
	
	// 찜 목록 체크로 삭제하기
	@PostMapping("/delete2")
	@PreAuthorize("isAuthenticated()")
	public String deleteCheck(HttpServletRequest req, @RequestParam("valueArr") String[] book_no, @RequestParam("ae_id") String id) {
		int size = book_no.length;
		for(int i = 0; i<size; i++) {
			wishService.delete(book_no[i], id);
		}
		return "redirect:/wish/list";
	}
	
}