package kr.or.ddit.vo.jhs;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ChattingVO {
	private String chat_no;
	private String cr_no;
	private String ae_id;
	private String chat_message;
	private String chat_wrt_ymd;
	private String mem_nicknm;
	private String mem_profile;
	private String chat_type;
	private String chat_to;
	private String chat_current_time;
}
