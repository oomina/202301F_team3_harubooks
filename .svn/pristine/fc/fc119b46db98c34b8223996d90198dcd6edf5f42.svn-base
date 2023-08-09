package kr.or.ddit.service.odh;

import javax.servlet.http.HttpServletRequest;

import kr.or.ddit.ResultStatus;
import kr.or.ddit.vo.UserInfoVO;

public interface MyPageService {

	public UserInfoVO selectUser(String userId);

	public UserInfoVO selectPw(String userId);

	public ResultStatus memberUpdate(HttpServletRequest req, UserInfoVO userVO);

	public ResultStatus memberDelete(HttpServletRequest req, String id);

	public ResultStatus checkPw(String ae_id, String memberPw);
}
