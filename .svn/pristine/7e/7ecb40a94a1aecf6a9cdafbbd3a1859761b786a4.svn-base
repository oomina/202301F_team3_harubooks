package kr.or.ddit.mapper.ljy;

import java.util.List;

import kr.or.ddit.vo.ljy.NoticeVO;

public interface NoticeMapper {
	
	public List<NoticeVO> noticeList(NoticeVO noticeVO);
	public NoticeVO noticeOne(String notice_no);
	public int noticeInsert(NoticeVO noticeVO);
	public int noticeUpdate(NoticeVO noticeVO);
	public int noticeDelete(String notice_no);
	public void incrementHit(String notice_no);
	public List<NoticeVO> noticeListPaging(int curPage);
	public int noticeCnt();
	
}
