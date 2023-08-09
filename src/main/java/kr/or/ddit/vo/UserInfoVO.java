package kr.or.ddit.vo;

import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class UserInfoVO {
	private List<UserAuthVO> authList; 	// 사용자 권한
	private String enabled;  
	private String ae_id;	// 사용자 ID
	private String ae_pw;	// 사용자 비밀번호
	private String user_nm; // 사용자 이름
	private int mbr_mileage;// 사용자 보유 마일리지
	private String mbr_email;// 사용자 이메일
	private String mbr_addr; // 사용자 주소
	private String mbr_dAddr; // 사용자 세부 주소
	private String mbr_zip;	 // 사용자 우편번호
	private String mbr_telNo;	// 사용자 전화번호
	private String mbr_gender; // 사용자 성별
	private String mbr_brdt;  // 사용자 생년월일
	private String rank_name; // 사용자 등급
	private String user_type; // 사용자 권한이름(ex. 회원, 비회원, 매니저, 출판사)
}
