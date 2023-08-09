package kr.or.ddit.mapper.ljy;

import java.util.List;

import kr.or.ddit.vo.ljy.PubMngVO;

public interface PubMngMapper {

	public List<PubMngVO> pubList(PubMngVO pubMngVO);

	public void insertAllEmplyr(PubMngVO pubMngVO);

	public void insertAuthor(PubMngVO pubMngVO);

	public int insertPub(PubMngVO pubMngVO);

	public void insertUsers(PubMngVO pubMngVO);

	public void insertMember(PubMngVO pubMngVO);

	public int pubListCnt();

	public PubMngVO getPub(String pub_nm);
	
	

}
