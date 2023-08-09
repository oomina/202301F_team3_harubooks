package kr.or.ddit.service.odh;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import kr.or.ddit.ResultStatus;
import kr.or.ddit.controller.file.UploadFileUtils;
import kr.or.ddit.mapper.FileMapper;
import kr.or.ddit.mapper.odh.InquiryMapper1;
import kr.or.ddit.vo.FileVO;
import kr.or.ddit.vo.odh.MyInqueryVO;
import kr.or.ddit.vo.odh.PagingVO;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class InqueryServiceImpl implements InquiryService {
	
	@Resource(name="uploadImg")
	private String uploadImg;
	
	@Inject
	private InquiryMapper1 inquiryMapper;
	
	@Inject
	private FileMapper fileMapper;

	@Override
	public String insertInquiry(MyInqueryVO mvo) throws IOException {
		String status = "";
		List<FileVO> result = UploadFileUtils.uploadFile(uploadImg, "INQUIRY", mvo.getImgFile());
		if(result.size() > 0) {
			String uaNo = fileMapper.getUaNo();
			int fileResult = 0;
			mvo.setUa_no(uaNo);
			for(FileVO vo : result) {
				vo.setUa_regist_id(mvo.getAe_id());
				vo.setUa_no(uaNo);
				fileResult += fileMapper.filesInsert(vo);
			}
			if(fileResult > 0) {
				int inquiryResult = inquiryMapper.insertInquiry(mvo);
				if(inquiryResult > 0) {
					status = "OK";
				}else {
					status = "FAIL";
				}
			}
		}
		
		return status;
	}
	

	@Override
	public String inquiryUpdate(MyInqueryVO mvo) throws IOException {
	    log.info("service update inquiryVO : " + mvo);
	    String status = "";
	    List<FileVO> result = UploadFileUtils.uploadFile(uploadImg, "INQUIRY", mvo.getImgFile());
	    if (result.size() > 0) {
	        String uaNo = fileMapper.getUaNo();
	        int fileResult = 0;
	        mvo.setUa_no(uaNo);
	        for (FileVO vo : result) {
	            vo.setUa_regist_id(mvo.getAe_id());
	            vo.setUa_no(mvo.getUa_no());
	            fileResult += fileMapper.filesInsert(vo);
	        }
	        if (fileResult > 0) {
	            int inquiryResult = inquiryMapper.updateInquiry(mvo);
	            if (inquiryResult > 0) {
	                status = "OK";
	            } else {
	                status = "FAIL";
	            }
	        }
	    }
	    return status;
	}
	

	@Override
	public int selectInquiryCount(PagingVO<MyInqueryVO> pagingVO) {
		return inquiryMapper.selectInquiryCount(pagingVO);
	}

	@Override
	public int selectInquiryList(String userId) {
		return inquiryMapper.selectInquiryList(userId);
	}

	@Override
	public List<MyInqueryVO> selectInquiryList2(PagingVO<MyInqueryVO> pagingVO) {
		return inquiryMapper.selectInquiryList2(pagingVO);
	}

	@Override
	public MyInqueryVO inquOne(String inq_no) {
		return inquiryMapper.inquOne(inq_no);
	}

	@Override
	public MyInqueryVO inquOne2(String inquiry_no) {
		return inquiryMapper.inquOne2(inquiry_no);
	}

	@Override
	public ResultStatus delInquiry(HttpServletRequest req, String inquiry_no) {
		ResultStatus result = null;
		MyInqueryVO inquiryVO = inquiryMapper.inquOne(inquiry_no);
		fileMapper.deleteFile(inquiryVO.getUa_no());
		int status = inquiryMapper.delInquiry(inquiry_no);
		
		if(status > 0) {
			result = ResultStatus.OK;
		}else {
			result = ResultStatus.FAIL;
		}
		return result;
	}


	@Override
	public List<MyInqueryVO> list(int inNo) throws Exception {
		return inquiryMapper.list(inNo);
	}


	@Override
	public void write(MyInqueryVO vo) throws Exception {
		inquiryMapper.write(vo);
	}


	@Override
	public void modify(MyInqueryVO vo) throws Exception {
		inquiryMapper.modify(vo);
	}


	@Override
	public void delete(MyInqueryVO vo) throws Exception {
		inquiryMapper.delete(vo);
	}

}
