package kr.or.ddit.service.ljy;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.ljy.RefundMngMapper;
import kr.or.ddit.vo.ljy.RefundMngVO;

@Service
public class RefundMngServiceImpl implements RefundMngService {

	@Autowired
	private RefundMngMapper refundMapper;
	
	@Override
	public List<RefundMngVO> refundList(RefundMngVO refundMngVO) {
		return refundMapper.refundList(refundMngVO);
	}

	@Override
	public String refundOne(RefundMngVO refundMngVO) {
		String res = "";
		// 환불요청
		int cnt = refundMapper.refundOne(refundMngVO);
		int cnt2 = refundMapper.refundPurchs(refundMngVO);
		int cnt3 = refundMapper.incrementRemain(refundMngVO);
		// 구매목록 환불
		if(cnt >0 && cnt2 > 0  && cnt3> 0) {
			res = "success";
		} else {
			res = "fail";
		}
		return res;
	}

	@Override
	public RefundMngVO refundDetail(RefundMngVO refundMngVO) {
		return refundMapper.refundDetail(refundMngVO);
	}

	@Override
	public int refundListCnt(RefundMngVO refundMngVO) {
		return refundMapper.refundListCnt(refundMngVO);
	}

	@Override
	public int countWaitingRefund() {
		return refundMapper.countWaitingRefund();
	}

}
