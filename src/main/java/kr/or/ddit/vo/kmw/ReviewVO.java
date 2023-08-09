package kr.or.ddit.vo.kmw;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class ReviewVO {	 
	private String book_no;	// 책번호
	private String ae_id;	// 사용자 아이디
    private int review_scr;	// 별점
    private String review_title; // 리뷰 제목
    private String review_content; // 리뷰 내용
    private String review_wrt_ymd; // 리뷰 작성일자
    private String review_mdfcn_ymd;// 리뷰 수정일자
    private String ua_no;			// 통합첨부파일번호
    private List<MultipartFile> review_file;// 리뷰 파일업로드
    private int scr_cnt;
    private String review_avg;
}
