package kr.or.ddit.service.omn.books;

import java.util.List;

import kr.or.ddit.vo.omn.MngPaginationInfoVO;
import kr.or.ddit.vo.omn.NewBookRequestVO;

public interface IMngBookRequestService {
	public NewBookRequestVO requestList(String nbr_no);
	public int requestCount(MngPaginationInfoVO<NewBookRequestVO> pagingVO);
	public int requestAllCount(String nbr_no);
	public List<NewBookRequestVO> selectRequestList(MngPaginationInfoVO<NewBookRequestVO> pagingVO);
	public int booksInsert(List<NewBookRequestVO> booksList);
	public int requestRefuse(List<NewBookRequestVO> refuseList);
	public int countBookReq();
}
