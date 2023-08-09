package kr.or.ddit.service.kmw;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.kmw.OrderMapper;
import kr.or.ddit.mapper.kmw.RefundMapper;
import kr.or.ddit.vo.FileVO;
import kr.or.ddit.vo.kmw.RefundVO;

@Service
public class RefundServiceImpl implements RefundService{
	@Inject
	private RefundMapper mapper;
	
	@Inject
	private OrderMapper orderMapper;
	@Override
	public int insertRefund(RefundVO refundVO) {
		orderMapper.changeRefundState(refundVO);
		return mapper.insertRefund(refundVO);
	}
	@Override
	public RefundVO refundOne(RefundVO vo) {
		return mapper.refundOne(vo);
	}
	@Override
	public FileVO refundImg(String ua_no) {
		return mapper.refundImg(ua_no);
	}
}
