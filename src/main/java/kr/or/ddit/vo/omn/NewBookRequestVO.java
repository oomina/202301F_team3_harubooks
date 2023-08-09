package kr.or.ddit.vo.omn;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class NewBookRequestVO {
	private String nbr_no;					// 요청번호
	private String ae_id;					// 아이디
	private String nbr_nm;					// 도서명
	private String nbr_content;				// 내용
	private String nbr_cover;				// 표지
	private String nbr_spmt_ymd;			// 출간일
	private String nbr_author;				// 저자
	private String book_talt;				// 번역자
	private String nbr_ymd;					// 요청일
	private String pub_nm;					// 출판사
	private int book_page_cnt;				// 페이지 수
	private int book_amt;					// 가격
	private String book_isbn;				// ISBN
	private String ccg_b001;				// 도서유형
	private String ccg_b002;				// 도서분류
	private String ccg_b003;				// 도서종류
	private String ccg_r001;				// 요청유형(대기/승인/거절)
	private String rnum;					// 순서번호
	private MultipartFile book_file_cover;	// 첨부파일
}

