package kr.or.ddit.service.bmk;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.bmk.FindLibraryMapper;
import kr.or.ddit.vo.bmk.FindLibraryVO;

@Service
public class FindLibraryServiceImpl implements IFindLibraryService{

	@Autowired
	private FindLibraryMapper findlibrarymapper;  
	
	@Override
	public FindLibraryVO getAddress(String ae_id) {
		return findlibrarymapper.getAddress(ae_id);
	}

	@Override
	public List<FindLibraryVO> getAllLibraryInfo() {
		return findlibrarymapper.getAllLibraryInfo();
	}

	@Override
	public FindLibraryVO getLibraryInfo(String lib_nm) {
		return findlibrarymapper.getLibraryInfo(lib_nm);
	}

}
