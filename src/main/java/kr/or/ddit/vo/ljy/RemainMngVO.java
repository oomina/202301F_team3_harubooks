package kr.or.ddit.vo.ljy;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class RemainMngVO extends PagingVO<RemainMngVO>{
	private String book_no;			// 책번호
	private int bm_cnt;				// 책 현재 수량
	private int bm_bsc_cnt;			// 책 기본 수량
	private int bm_cnt_indct1;		// 책 1차 수량
	private int bm_cnt_indct2;		// 책 2차 수량
	
	// 책 정보
	private String book_title;		// 책 제목
	private String book_cover;		// 책 커버
	private String book_spmt_ymd;	// 출간일자
	private String book_author;		// 책 저자
	private String pub_nm;			// 출판사 이름
	private String ae_id;			// 아이디 (출판사 재고 조회용)
	private String book_talt;		// 번역자 이름
	private String ccg_b001;		// 1. 종이책, 2. E북
	private String ccg_b002;		// 1. 한국도서, 2. 해외도서, 3. E북
	private String ccg_b003;		// 1. 소설, 2. 시/에세이, 3. 인문, 4. 경제/경영, 5. 정치/사회, 6. 컴퓨터/IT, 7. 요리, 8. 과학, 9. 건강/스포츠, 10. 외국어
	
	private int book_amt;			// 책 원래가격
	private int book_discount;		// 책 할인율
	private int book_ntsl_amt;		// 책 판매금액 
	
	private int bm_cnt_status;		// 책 재고 상태 - 1. red, 2. yellow, 3. white
	
//	public int getBm_cnt_status() {
//		int bm_cnt_status=0;
//		if(this.bm_cnt == 0 && bm_bsc_cnt == 0) {	// 처음 로딩될 때
//			bm_cnt_status = 0;
//		} else {
//			if(this.bm_cnt<= this.bm_cnt_indct2) {
//				bm_cnt_status = 1;
//			} else if(this.bm_cnt <= this.bm_cnt_indct1) {
//				bm_cnt_status = 2;
//			}
//		}
//		return bm_cnt_status;
//	}
}
