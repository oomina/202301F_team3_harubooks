package kr.or.ddit.service.ljy;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.ljy.PoMngVO;
import kr.or.ddit.vo.ljy.RemainMngVO;
import kr.or.ddit.vo.omn.MngPaginationInfoVO;

public interface RemainMngService {

	public List<RemainMngVO> remainList(MngPaginationInfoVO<RemainMngVO> mngPaginationInfoVO);

	public int remainListCnt(MngPaginationInfoVO<RemainMngVO> mngPaginationInfoVO);

	public int poOne(PoMngVO poMngVO);

	public RemainMngVO remainOne(String book_no);

	public int poListCnt(MngPaginationInfoVO<PoMngVO> mngPaginationInfoVO);

	public List<PoMngVO> poList(MngPaginationInfoVO<PoMngVO> mngPaginationInfoVO);

	public String poReqList(List<PoMngVO> poList);

	public List<RemainMngVO> remainPubList(RemainMngVO remainMngVO);

	public List<PoMngVO> poPubList(PoMngVO poMngVO);

	public String poReqPub(List<PoMngVO> poreqPubList);

	public String poRejPub(List<PoMngVO> porejPubList);

	public int remainPubListCnt(RemainMngVO remainMngVO);

	public int waitCnt(PoMngVO poMngVO);

	public int acceptCnt(PoMngVO poMngVO);

	public int refuseCnt(PoMngVO poMngVO);

	public PoMngVO getPo(String br_no);

	public List<PoMngVO> poSearch(Map<String, String> poSearchMap);

}
