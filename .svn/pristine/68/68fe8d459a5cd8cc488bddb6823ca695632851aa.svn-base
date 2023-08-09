package kr.or.ddit.vo.jhs;

import com.google.gson.Gson;

public class BellVO {
	private String message;
	private String my;
	private String you;
	
	
	public static BellVO converMessage(String payload) {
		Gson gson = new Gson();
        return gson.fromJson(payload, BellVO.class);
	}

	public String getMessage() {
		return message;
	}


	public void setMessage(String message) {
		this.message = message;
	}

	public String getMy() {
		return my;
	}

	public void setMy(String my) {
		this.my = my;
	}

	public String getYou() {
		return you;
	}

	public void setYou(String you) {
		this.you = you;
	}



}
