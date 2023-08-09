package kr.or.ddit.service.odh;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import kr.or.ddit.ResultStatus;
import kr.or.ddit.vo.odh.MyInqueryVO;
import kr.or.ddit.vo.odh.PagingVO;

public interface InquiryService {

	public String insertInquiry(MyInqueryVO mvo) throws IOException;

	public int selectInquiryList(String userId);

	public int selectInquiryCount(PagingVO<MyInqueryVO> pagingVO);

	public List<MyInqueryVO> selectInquiryList2(PagingVO<MyInqueryVO> pagingVO);
	
	public MyInqueryVO inquOne(String inq_no);

	public MyInqueryVO inquOne2(String inquiry_no);

	public ResultStatus delInquiry(HttpServletRequest req, String inquiry_no);

	public String inquiryUpdate(MyInqueryVO MyinquiryVO) throws IOException;
	
	public List<MyInqueryVO> list(int inNo) throws Exception;
	
	public void write(MyInqueryVO vo) throws Exception;
	
	public void modify(MyInqueryVO vo) throws Exception;
	
	public void delete(MyInqueryVO vo) throws Exception;
	
}
