package kr.or.ddit.mapper.omn.sales;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.omn.MngPaginationInfoVO;
import kr.or.ddit.vo.omn.SalesVO;

@Mapper
public interface PubSalesMapper {
	public int salesCount(MngPaginationInfoVO<SalesVO> pagingVO);
	public int salesAllCount(String order_no);
	public List<SalesVO> selectSalesList(MngPaginationInfoVO<SalesVO> pagingVO);
	public List<SalesVO> bestBooks(SalesVO salesVO);
	public List<SalesVO> monthlyCnt(SalesVO salesVO);
	public List<SalesVO> monthlySales(SalesVO salesVO);
}
