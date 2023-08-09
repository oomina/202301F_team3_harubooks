package kr.or.ddit.mapper.kmw;

import java.util.List;

import kr.or.ddit.vo.kmw.BookInfoVO;
import kr.or.ddit.vo.kmw.CartVO;
import kr.or.ddit.vo.kmw.PaginationVO;

public interface BookMapper {

	int bookCount(PaginationVO<BookInfoVO> pagingVO);

	List<BookInfoVO> selectBookList(PaginationVO<BookInfoVO> pagingVO);

	BookInfoVO detailBook(BookInfoVO vo);

	List<String> kindBycategory(String ccg_b002);

	int inputWishList(BookInfoVO vo);

	int existWisthList(BookInfoVO vo);

	int existCart(CartVO vo);

	int inputCart(CartVO vo);

	List<BookInfoVO> cartList(String ae_id);

	int cartCnt(String ae_id);

	int cartDel(BookInfoVO vo);

	BookInfoVO selectBook(String book_no);

	int wishCnt(String ae_id);

	List<BookInfoVO> selectBookListAll(PaginationVO<BookInfoVO> pagingVO);

	int reviewCheck(BookInfoVO bookVO);

	int reviewCheck2(BookInfoVO bookVO);

	List<BookInfoVO> bestSeller();

	BookInfoVO bestBookInfo(String book_no);

	List<BookInfoVO> koreaBookList();

	List<BookInfoVO> abroadBookList();

	List<BookInfoVO> eBookList();

	List<BookInfoVO> searchCompareBook(String searchBook);

}
