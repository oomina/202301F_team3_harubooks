package kr.or.ddit.mapper.omn.books;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.omn.MngCategoryVO;

@Mapper
public interface MngCategoryMapper {
	public List<MngCategoryVO> categoryMainList();
	public List<MngCategoryVO> categoryMidList();
	public int categoryInsert(MngCategoryVO mngCategoryVO);
	public int categoryUpdate(MngCategoryVO mngCategoryVO);
	public int categoryDelete(MngCategoryVO mngCategoryVO);
}
