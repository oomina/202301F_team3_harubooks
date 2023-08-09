package kr.or.ddit.vo.ljy;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class NoticeVO extends PagingVO<NoticeVO>{
	private String notice_no;			// 공지사항 코드
	private String notice_title;		// 공지사항 제목
	private String notice_content;		// 공지사항 내용
	private String notice_writer_ymd;	// 공지 작성일자
	private String notice_mdfcn_ymd;	// 공지 수정일자
	private int notice_inq_cnt;			// 공지 조회수 
	private String ua_no;				// 통합첨부파일번호
	
	private MultipartFile notice_file;	// 첨부파일
	private int curPage; //현재페이지
	private int row_num;
}
