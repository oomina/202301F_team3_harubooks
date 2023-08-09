package kr.or.ddit.service.bmk;

import java.util.List;

import kr.or.ddit.vo.bmk.FindLibraryVO;

public interface IFindLibraryService {

	public FindLibraryVO getAddress(String ae_id);

	public List<FindLibraryVO> getAllLibraryInfo();

	public FindLibraryVO getLibraryInfo(String lib_nm);

}
