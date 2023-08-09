package kr.or.ddit.service.kmw;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.controller.file.UploadFileUtils;
import kr.or.ddit.mapper.FileMapper;
import kr.or.ddit.mapper.kmw.ReviewMapper;
import kr.or.ddit.vo.FileVO;
import kr.or.ddit.vo.kmw.ReviewVO;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@Service
public class ReviewServiceImpl implements ReviewService{
	@Inject
	private ReviewMapper reviewMapper;
	
	@Inject
	private FileMapper fileMapper;
	
	@Resource(name = "uploadImg")
	private String uploadImg;
	
	@Override
	public String insertReview(ReviewVO reviewVO) throws IOException {
		List<FileVO> result = UploadFileUtils.uploadFile(uploadImg,"REVIEW", reviewVO.getReview_file());
		if(result.size()>0 && result != null) { // 파일이 존재하는 경우
			String uaNo = fileMapper.getUaNo(); // ua_no최신값 가져오기
			reviewVO.setUa_no(uaNo);
			for(FileVO vo :result) {
				vo.setUa_regist_id(reviewVO.getAe_id());
				vo.setUa_no(uaNo);
				fileMapper.filesInsert(vo);
			}
			if(reviewMapper.insertReview(reviewVO) > 0) {
				return "OK";
			}else {
				return "FAIL";
			}
		}else { // 파일이 존재하지 않으면
			if(reviewMapper.insertReview(reviewVO) > 0) {
				return "OK";
			}else {
				return "FAIL";
			}
		}
		
	}

	@Override
	public List<ReviewVO> reviewList(String bookNo) {
		return reviewMapper.reviewList(bookNo);
	}

	@Override
	public int reviewCnt(String bookNo) {
		return reviewMapper.reviewCnt(bookNo);
	}

	@Override
	public int reviewTotalScore(String bookNo) {
		return reviewMapper.reviewTotalScore(bookNo);
	}

	@Override
	public List<ReviewVO> scrList(String bookNo) {
		return reviewMapper.scrList(bookNo);
	}

	@Override
	public int deleteReview(ReviewVO rVO) {
		int res = 0;
		String uaNo = reviewMapper.selectUaNo(rVO);
		int result1 = reviewMapper.deleteReview(rVO);
		FileVO file = new FileVO();
		file.setUa_no(uaNo);
		int result2 = fileMapper.deleteFile(uaNo);
		if(result1>0 && result2>0) {
			res = 1;
		}else {
			res = 0;
		}
		return res;
	}

	@Override
	public ReviewVO reviewAvg(String book_no) {
		return reviewMapper.reviewAvg(book_no);
	}
}
