package kr.or.ddit.mapper.omn.mbr;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.omn.MngMbrVO;
import kr.or.ddit.vo.omn.MngPaginationInfoVO;

@Mapper
public interface MngMbrMapper {
	public List<MngMbrVO> mbrList();
	public List<MngMbrVO> selectMbrList(MngPaginationInfoVO<MngMbrVO> pagingVO);
	public int mbrCount(MngPaginationInfoVO<MngMbrVO> pagingVO);
	public int mbrAllCount(String ae_id);
	public MngMbrVO mbrInfo(String ae_id);
	public int mbrUpdate(MngMbrVO mngMbrVO);
	public int comMbrUpdate(MngMbrVO mngMbrVO);
	public int mbrDelete(String ae_id);
	public int comMbrDelete(String ae_id);
}
