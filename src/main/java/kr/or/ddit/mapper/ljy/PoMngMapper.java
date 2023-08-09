package kr.or.ddit.mapper.ljy;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.ljy.PoMngVO;
import kr.or.ddit.vo.ljy.RemainMngVO;
import kr.or.ddit.vo.omn.MngPaginationInfoVO;

public interface PoMngMapper {

	public int poOne(PoMngVO poMngVO);

	public int poListCnt(MngPaginationInfoVO<PoMngVO> mngPaginationInfoVO);

	public List<PoMngVO> poList(MngPaginationInfoVO<PoMngVO> mngPaginationInfoVO);

	public List<PoMngVO> poWaitingList();

	public void poAuto(PoMngVO poMngVO);

	public List<PoMngVO> poPubList(PoMngVO poMngVO);

	public int updatePoReqPub(PoMngVO poMngVO);

	public int updatePoRejPub(PoMngVO poMngVO);

	public PoMngVO getPo(String string);

	public int waitCnt(PoMngVO poMngVO);

	public int acceptCnt(PoMngVO poMngVO);

	public int refuseCnt(PoMngVO poMngVO);

	public List<PoMngVO> poSearch(Map<String, String> poSearchMap);

}
