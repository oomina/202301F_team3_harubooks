package kr.or.ddit.mapper.omn.books;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.omn.MngBooksVO;
import kr.or.ddit.vo.omn.MngPaginationInfoVO;

@Mapper
public interface MngBooksMapper {
	public List<MngBooksVO> selectBooksList(MngPaginationInfoVO<MngBooksVO> pagingVO);
	public int booksCount(MngPaginationInfoVO<MngBooksVO> pagingVO);
	public int booksAllCount(String book_no);
	public Map<String,String> booksList(String book_no);
	public MngBooksVO booksInfo(MngBooksVO mngBooksVO);
	public int booksUpdate(MngBooksVO mngBooksVO);
	public int paperBookUpdate(MngBooksVO mngBooksVO);
	public int ebookUpdate(MngBooksVO mngBooksVO);
	public int booksDelete(String book_no);
	public int paperBookDelete(String book_no);
	public int ebookDelete(String book_no);
}
