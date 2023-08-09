package kr.or.ddit.vo.ljy;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class InquiryVO extends PagingVO<InquiryVO> {
	private String inquiry_no;		// 문의 번호
	private String ae_id;			// 사용자 id
	private String inquiry_title;	// 문의 제목
	private String inquiry_ymd;		// 문의 작성일
	private String inquiry_content;	// 문의 내용
	private String ua_no;			// 통합첨부파일번호
	private String ccg_i001;		// 공통코드그룹번호 - 1.문의대기/ 2.문의 완료
	private String ccg_i002;		// 공통코드그룹번호 - 1.상품문의/ 2.구매문의/ 3.배송문의
	private String inquiry_reply;	// 문의 요청 답글
}
