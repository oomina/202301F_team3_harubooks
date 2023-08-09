package kr.or.ddit.service.odh;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import kr.or.ddit.ResultStatus;
import kr.or.ddit.mapper.odh.wishListMapper;
import kr.or.ddit.vo.kmw.BookInfoVO;
import kr.or.ddit.vo.kmw.CartVO;

@Service
public class WishListServiceImpl implements WishListService {

	@Inject
	wishListMapper wishMapper;

	@Override
	public List<BookInfoVO> selectWishList(String userId) {
		List<BookInfoVO> likeList = wishMapper.selectWishList(userId);
		return likeList;
		
	}

	@Override
	public ResultStatus deleteList(HttpServletRequest req, String id, String bookNo) {
		ResultStatus result = null;
		
		int status = wishMapper.deleteList(id, bookNo);
		
		if(status > 0) {
			result = ResultStatus.OK;
		}else {
			result = ResultStatus.FAIL;
		}
		return result;
	}

	@Override
	public void delete(String book_no, String id) {
		wishMapper.deleteList(id, book_no);
		}
	


	@Override
	public boolean existCart(CartVO vo) {
		boolean isExist = false;
		int cnt = wishMapper.existCart(vo);
		if(cnt>0) {
			isExist = true;
		}else {
			isExist = false;
		}
		return isExist;
	}

	@Override
	public ResultStatus inputCart(CartVO vo) {
		ResultStatus result = null;
		
		wishMapper.inputCart(vo);
		
		int cnt  = wishMapper.delete(vo.getBook_no(), vo.getAe_id());
		if(cnt > 0) {
			result = ResultStatus.OK;
		}else{
			result = ResultStatus.FAIL;
		}
		return result;
	}

	@Override
	public ResultStatus insert(CartVO vo) {
		ResultStatus result = null;
		
		wishMapper.insert(vo);
		
		int cnt  = wishMapper.delete(vo.getBook_no(), vo.getAe_id());
		if(cnt > 0) {
			result = ResultStatus.OK;
		}else{
			result = ResultStatus.FAIL;
		}
		return result;
	}

	
}	