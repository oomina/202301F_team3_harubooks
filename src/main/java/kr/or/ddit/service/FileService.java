package kr.or.ddit.service;

import java.util.List;

import kr.or.ddit.vo.FileVO;

public interface FileService {
	public int fileInsert(FileVO fileVO);
	public List<FileVO> fileList(String ua_no);
	public List<FileVO> reviewImgList(String bookNo);
}
