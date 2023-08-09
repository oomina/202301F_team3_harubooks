package kr.or.ddit.service.odh;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import kr.or.ddit.ResultStatus;
import kr.or.ddit.vo.kmw.BookInfoVO;
import kr.or.ddit.vo.kmw.CartVO;

public interface WishListService {

	public List<BookInfoVO> selectWishList(String userId);

	public ResultStatus deleteList(HttpServletRequest req, String id, String bookNo);

	public void delete(String book_no, String id);

	public boolean existCart(CartVO vo);

	public ResultStatus inputCart(CartVO vo);

	public ResultStatus insert(CartVO vo);


}
