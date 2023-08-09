package kr.or.ddit.mapper.omn.books;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.omn.MngPaginationInfoVO;
import kr.or.ddit.vo.omn.NewBookRequestVO;

@Mapper
public interface PubBookRequestMapper {
	public List<NewBookRequestVO> requestList();
	public int requestCount(MngPaginationInfoVO<NewBookRequestVO> pagingVO);
	public int requestAllCount(String nbr_no);
	public List<NewBookRequestVO> selectRequestList(MngPaginationInfoVO<NewBookRequestVO> pagingVO);
	public int bookRequestInsert(NewBookRequestVO newBookRequestVO);
}
