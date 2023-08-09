package kr.or.ddit.service.omn.books;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.ljy.RemainMngMapper;
import kr.or.ddit.mapper.omn.books.MngBookRequestMapper;
import kr.or.ddit.vo.omn.MngBooksVO;
import kr.or.ddit.vo.omn.MngPaginationInfoVO;
import kr.or.ddit.vo.omn.NewBookRequestVO;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class MngBookRequestServiceImpl implements IMngBookRequestService{
	
	@Inject
	private MngBookRequestMapper mapper;
	
	@Inject
	private RemainMngMapper remainMapper;
	
	@Override
	public NewBookRequestVO requestList(String nbr_no) {
		return mapper.requestList(nbr_no);
	}

	@Override
	public int requestCount(MngPaginationInfoVO<NewBookRequestVO> pagingVO) {
		return mapper.requestCount(pagingVO);
	}

	@Override
	public int requestAllCount(String nbr_no) {
		return mapper.requestAllCount(nbr_no);
	}

	@Override
	public List<NewBookRequestVO> selectRequestList(MngPaginationInfoVO<NewBookRequestVO> pagingVO) {
		return mapper.selectRequestList(pagingVO);
	}
	
	@Override
	public int booksInsert(List<NewBookRequestVO> booksList) {
		int cnt = 0;
		for(int i = 0; i < booksList.size(); i++) {
			String nbr_no = booksList.get(i).getNbr_no();
			NewBookRequestVO newBookRequestVO = mapper.requestList(nbr_no);
			log.info(""+ newBookRequestVO);
			MngBooksVO mngBooksVO = new MngBooksVO();
			mngBooksVO.setBook_title(newBookRequestVO.getNbr_nm());
			mngBooksVO.setBook_content(newBookRequestVO.getNbr_content());
			mngBooksVO.setBook_cover(newBookRequestVO.getNbr_cover());
			mngBooksVO.setBook_spmt_ymd(newBookRequestVO.getNbr_spmt_ymd());
			mngBooksVO.setBook_author(newBookRequestVO.getNbr_author());
			mngBooksVO.setPub_nm(newBookRequestVO.getPub_nm());
			mngBooksVO.setBook_talt(newBookRequestVO.getBook_talt());
			mngBooksVO.setCcg_b001(newBookRequestVO.getCcg_b001());
			mngBooksVO.setCcg_b002(newBookRequestVO.getCcg_b002());
			mngBooksVO.setCcg_b003(newBookRequestVO.getCcg_b003());
			mngBooksVO.setBook_page_cnt(newBookRequestVO.getBook_page_cnt());
			mngBooksVO.setBook_amt(newBookRequestVO.getBook_amt());
			mngBooksVO.setBook_isbn(newBookRequestVO.getBook_isbn());
			cnt	= mapper.booksInsert(mngBooksVO);
			if(mngBooksVO.getCcg_b001().equals("종이책")) {
				cnt	= mapper.paperBookInsert(mngBooksVO);
			} else {
				cnt	= mapper.ebookInsert(mngBooksVO);
			}
			mapper.requestApproval(newBookRequestVO);
			remainMapper.booksInsert(mngBooksVO.getBook_no());
		}
		return cnt;
	}
	
	@Override
	public int requestRefuse(List<NewBookRequestVO> refuseList) {
		int cnt = 0;
		for(int i = 0; i < refuseList.size(); i++) {
			String nbr_no = refuseList.get(i).getNbr_no();
			NewBookRequestVO newBookRequestVO = mapper.requestList(nbr_no);
			cnt	= mapper.requestRefuse(newBookRequestVO);
		}
		return cnt;
	}

	@Override
	public int countBookReq() {
		return mapper.countBookReq();
	}
}
