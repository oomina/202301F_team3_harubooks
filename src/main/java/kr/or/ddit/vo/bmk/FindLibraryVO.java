package kr.or.ddit.vo.bmk;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class FindLibraryVO {
	
	private String lib_no;
	private String lib_nm;
	private String lib_ctgry;
	private String lib_tcbiz;
	private String lib_start_time;
	private String lib_end_time;
	private int lib_seat;
	private int lib_data;
	private int lib_loan_cnt;
	private String lib_addr;
	private String lib_call;
	private String lib_lat;
	private String lib_lot;
	private String mbr_addr;
	private String mbr_daddr;
	private String ae_id;
}
