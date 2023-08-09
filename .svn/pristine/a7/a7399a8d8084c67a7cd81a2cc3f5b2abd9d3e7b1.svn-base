package kr.or.ddit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.FileMapper;
import kr.or.ddit.vo.FileVO;

@Service
public class FileServiceImpl implements FileService{
	
	@Autowired
	private FileMapper fileMapper;
	
	@Override
	public int fileInsert(FileVO fileVO) {
		return fileMapper.fileInsert(fileVO);
	}

	@Override
	public List<FileVO> fileList(String ua_no) {
		return fileMapper.fileList(ua_no);
	}


	@Override
	public List<FileVO> reviewImgList(String bookNo) {
		return fileMapper.reviewImgList(bookNo);
	}
	
}
