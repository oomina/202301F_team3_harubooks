package kr.or.ddit.service.omn.books;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.omn.books.MngBooksMapper;
import kr.or.ddit.vo.omn.MngBooksVO;
import kr.or.ddit.vo.omn.MngPaginationInfoVO;

@Service
public class MngBooksServiceImpl implements IMngBooksService{
	
	@Inject
	private MngBooksMapper mapper;

	@Override
	public List<MngBooksVO> selectBooksList(MngPaginationInfoVO<MngBooksVO> pagingVO) {
		return mapper.selectBooksList(pagingVO);
	}

	@Override
	public int booksCount(MngPaginationInfoVO<MngBooksVO> pagingVO) {
		return mapper.booksCount(pagingVO);
	}

	@Override
	public int booksAllCount(String book_no) {
		return mapper.booksAllCount(book_no);
	}

	@Override
	public MngBooksVO booksInfo(String book_no) {
		Map<String, String> map = mapper.booksList(book_no);
		MngBooksVO vo = new MngBooksVO();
		vo.setCcg_b001(map.get("CCG_B001"));
		vo.setBook_no(book_no);
		return mapper.booksInfo(vo);
	}

	@Override
	public int booksUpdate(MngBooksVO mngBooksVO) {
		int cnt;
		if(mngBooksVO.getCcg_b001().equals("종이책")) {
			cnt	= mapper.paperBookUpdate(mngBooksVO);
		} else {
			cnt	= mapper.ebookUpdate(mngBooksVO);
		}
		cnt	= mapper.booksUpdate(mngBooksVO);
		return cnt;
	}

	@Override
	public int booksDelete(String book_no) {
		Map<String, String> map = mapper.booksList(book_no);
		int cnt;
		if(map.get("CCG_B001").equals("종이책")) {
			cnt	= mapper.paperBookDelete(book_no);
		} else {
			cnt	= mapper.ebookDelete(book_no);
		}
		cnt	= mapper.booksDelete(book_no);
		return cnt;
	}
}
