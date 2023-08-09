package kr.or.ddit.vo.bmk;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class DiaryVO {
	
	private String diary_no;
	private String ae_id;
	private String diary_title;
	private String diary_content;
	private String diary_ymd;
	private String diary_modify_ymd;
	private int rnum;
}
