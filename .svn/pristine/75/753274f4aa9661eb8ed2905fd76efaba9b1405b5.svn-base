package kr.or.ddit.mapper.bmk;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.bmk.DiaryVO;
import kr.or.ddit.vo.bmk.Diary_PageVO;

@Mapper
public interface MyDiaryMapper {

	public List<DiaryVO> getDiaryList(Diary_PageVO<DiaryVO> dvo);

	public int selectDiaryListCount(Diary_PageVO<DiaryVO> dvo);

	public int selectAllRecord(String id);

	public DiaryVO getDetailDiary(String diary_no);

	public int insertDiary(DiaryVO dvo);

	public int deleteDiary(String diary_no);

	public int updateDiary(DiaryVO dvo);

}
   