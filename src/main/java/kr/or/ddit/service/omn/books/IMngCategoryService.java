package kr.or.ddit.service.omn.books;

import java.util.List;

import kr.or.ddit.vo.omn.MngCategoryVO;

public interface IMngCategoryService {
	public List<MngCategoryVO> categoryMainList();
	public List<MngCategoryVO> categoryMidList();
	public int categoryInsert(MngCategoryVO mngCategoryVO);
	public int categoryUpdate(MngCategoryVO mngCategoryVO);
	public int categoryDelete(MngCategoryVO mngCategoryVO);
}
