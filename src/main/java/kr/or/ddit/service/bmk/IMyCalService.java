package kr.or.ddit.service.bmk;

import java.util.List;

import kr.or.ddit.vo.bmk.CalendarVO;

public interface IMyCalService {

	public List<CalendarVO> getCal(String ae_id);

	public int insertCal(CalendarVO calVO);

	public CalendarVO getDetailCal(String cal_no);

	public int updateCal(CalendarVO calVO);

	public int updateMove(CalendarVO calVO);

	public int deleteCal(String calNo);


}
