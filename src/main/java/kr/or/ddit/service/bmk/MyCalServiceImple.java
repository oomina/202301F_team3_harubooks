package kr.or.ddit.service.bmk;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.bmk.MyCalMapper;
import kr.or.ddit.vo.bmk.CalendarVO;

@Service
public class MyCalServiceImple implements IMyCalService {
	
	@Autowired
	private MyCalMapper myCalMapper;

	@Override
	public List<CalendarVO> getCal(String ae_id) {
		return myCalMapper.getCal(ae_id);
	}

	@Override
	public int insertCal(CalendarVO calVO) {
		return myCalMapper.insertCal(calVO);
	}

	@Override
	public CalendarVO getDetailCal(String cal_no) {
		return myCalMapper.getDetailCal(cal_no);
	}

	@Override
	public int updateCal(CalendarVO calVO) {
		return myCalMapper.updateCal(calVO);
	}

	@Override
	public int updateMove(CalendarVO calVO) {
		return myCalMapper.updateMove(calVO);
	}

	@Override
	public int deleteCal(String calNo) {
		return myCalMapper.deleteCal(calNo);
	}

}
