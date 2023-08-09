package kr.or.ddit.service.bmk;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.bmk.MyDiaryMapper;
import kr.or.ddit.vo.bmk.DiaryVO;
import kr.or.ddit.vo.bmk.Diary_PageVO;

@Service
public class MyDiaryServiceImpl implements IMyDiaryService{

	@Autowired
	private MyDiaryMapper myDiaryMapper;
	
	@Override
	public List<DiaryVO> getDiaryList(Diary_PageVO<DiaryVO> dvo) {
		List<DiaryVO> vo = myDiaryMapper.getDiaryList(dvo);
		
		return vo;
	}
	
	@Override
	public int selectDiaryListCount(Diary_PageVO<DiaryVO> dvo) {
		return myDiaryMapper.selectDiaryListCount(dvo);
	}

	@Override
	public int selectAllRecord(String id) {
		return myDiaryMapper.selectAllRecord(id);
	}

	@Override
	public DiaryVO getDetailDiary(String diary_no) {
		return myDiaryMapper.getDetailDiary(diary_no);
	}

	@Override
	public int insertDiary(DiaryVO dvo) {
		return myDiaryMapper.insertDiary(dvo);
	}

	@Override
	public int deleteDiary(String diary_no) {
		return myDiaryMapper.deleteDiary(diary_no);
	}

	@Override
	public int updateDiary(DiaryVO dvo) {
		return myDiaryMapper.updateDiary(dvo);
	}

	

}
