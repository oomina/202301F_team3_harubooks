package kr.or.ddit.vo.ljy;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class DeliveryMngVO {
	public String order_no;			// 주문 번호
	public String ae_id;			// 사용자 id
	public String user_addr;		// 기본 주소
	public String user_daddr;		// 상세 주소
	public String user_zip;			// 우편번호
	public String user_telno;		// 핸드폰 번호
	public String user_nm;			// 사용자 이름
	public String delivery_end_ymd;	// 배송도착일자
	public String ccg_d001;			// 배송 상태 - 1. 배송준비, 2. 배송중, 3. 배송완료
}
