package kr.or.ddit.service.omn.sales;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.omn.sales.PubSalesMapper;
import kr.or.ddit.vo.omn.MngPaginationInfoVO;
import kr.or.ddit.vo.omn.SalesVO;

@Service
public class PubSalesServiceImpl implements IPubSalesService{
	
	@Inject
	private PubSalesMapper mapper;

	@Override
	public int salesCount(MngPaginationInfoVO<SalesVO> pagingVO) {
		return mapper.salesCount(pagingVO);
	}

	@Override
	public int salesAllCount(String order_no) {
		return mapper.salesAllCount(order_no);
	}

	@Override
	public List<SalesVO> selectSalesList(MngPaginationInfoVO<SalesVO> pagingVO) {
		return mapper.selectSalesList(pagingVO);
	}

	@Override
	public List<SalesVO> bestBooks(SalesVO salesVO) {
		return mapper.bestBooks(salesVO);
	}

	@Override
	public List<SalesVO> monthlyCnt(SalesVO salesVO) {
		return mapper.monthlyCnt(salesVO);
	}

	@Override
	public List<SalesVO> monthlySales(SalesVO salesVO) {
		return mapper.monthlySales(salesVO);
	}
}
