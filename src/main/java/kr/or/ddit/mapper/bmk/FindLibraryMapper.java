package kr.or.ddit.mapper.bmk;

import java.util.List;

import kr.or.ddit.vo.bmk.FindLibraryVO;

public interface FindLibraryMapper {

	public FindLibraryVO getAddress(String ae_id);

	public List<FindLibraryVO> getAllLibraryInfo();

	public FindLibraryVO getLibraryInfo(String lib_nm);

}
