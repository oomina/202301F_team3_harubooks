package kr.or.ddit.service.omn.books;

import java.util.List;

import kr.or.ddit.vo.omn.MngBooksVO;
import kr.or.ddit.vo.omn.MngPaginationInfoVO;

public interface IMngBooksService {
	public List<MngBooksVO> selectBooksList(MngPaginationInfoVO<MngBooksVO> pagingVO);
	public int booksCount(MngPaginationInfoVO<MngBooksVO> pagingVO);
	public int booksAllCount(String book_no);
	public MngBooksVO booksInfo(String book_no);
	public int booksUpdate(MngBooksVO mngBooksVO);
	public int booksDelete(String book_no);
}
