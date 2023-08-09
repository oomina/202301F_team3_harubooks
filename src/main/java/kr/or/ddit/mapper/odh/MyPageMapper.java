package kr.or.ddit.mapper.odh;

import kr.or.ddit.vo.UserInfoVO;

public interface MyPageMapper {

	public UserInfoVO selectUser(String userId);

	public UserInfoVO selectPw(String userId);

	public int memberUpdate(UserInfoVO userVO);
	
	public void memberPwupdate (UserInfoVO userVO);

	public void memberDelete(String id);
	
	public int memberDelete2(String id);
	
	public void usersDelete(String id);
	
	public void authorDelete(String id);

	public void wishDelete(String id);

	public int checkPw(String ae_id, String memberPw);

	public void memberchat(String id);

	public void HaruterMember(String id);

	public void inquiryDelete(String id);

	public void cartDelete(String id);
}
