package kr.or.ddit.service.odh;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import kr.or.ddit.ResultStatus;
import kr.or.ddit.mapper.odh.MyPageMapper;
import kr.or.ddit.vo.UserInfoVO;

@Service
public class MyPageServiceImpl implements MyPageService {

	@Inject
	MyPageMapper myPagemapper;
	
	@Override
	public UserInfoVO selectUser(String userId) {
		return myPagemapper.selectUser(userId);
	}

	@Override
	public UserInfoVO selectPw(String userId) {
		return myPagemapper.selectPw(userId);
	}

	@Override
	public ResultStatus memberUpdate(HttpServletRequest req, UserInfoVO userVO) {
		ResultStatus result = null;
		myPagemapper.memberPwupdate(userVO);
		
		int status = myPagemapper.memberUpdate(userVO);
		
		if(status > 0) {
			result = ResultStatus.OK;
		}else {
			result = ResultStatus.FAIL;
		}
		
		return result;
	}

	@Override
	public ResultStatus memberDelete(HttpServletRequest req, String id) {
		ResultStatus result = null;
		
		myPagemapper.wishDelete(id);
		myPagemapper.memberchat(id);
		myPagemapper.HaruterMember(id);
		myPagemapper.inquiryDelete(id);
		myPagemapper.cartDelete(id);
		myPagemapper.memberDelete(id);
		myPagemapper.usersDelete(id);
		myPagemapper.authorDelete(id);
		
		int status = myPagemapper.memberDelete2(id);
		
		if(status > 0) {
			result = ResultStatus.OK;
		}else {
			result = ResultStatus.FAIL;
		}
		
		return result;
	}

	@Override
	public ResultStatus checkPw(String ae_id, String memberPw) {
		ResultStatus result = null;
		int cnt = myPagemapper.checkPw(ae_id, memberPw);
		if(cnt > 0) {
			result = ResultStatus.FAIL;
		}else {
			result = ResultStatus.OK;
		}
		return result;
	}

}
