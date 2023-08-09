package kr.or.ddit.mapper.kmw;

import java.util.List;

import kr.or.ddit.vo.kmw.OrderVO;
import kr.or.ddit.vo.kmw.PagingVO;
import kr.or.ddit.vo.kmw.RefundVO;

public interface OrderMapper {

	int insertOrder(OrderVO orderVO);

	int insertPurchs(OrderVO orderVO);

	int insertDelivery(OrderVO orderVO);

	void spendMileage(OrderVO orderVO);

	void deleteCart(String ae_id);

	List<OrderVO> orderCompleteList(String ae_id);

	List<OrderVO> preparedProd(String ae_id);

	int preparedDelivery(String ae_id);

	int DeliveringCnt(String ae_id);

	int finishDelivery(String ae_id);

	int refundCnt(String ae_id);

	List<OrderVO> deliveryList();

	void updateDeliveryStatus(OrderVO delivery);

	List<OrderVO> completeDeliveryList(String ae_id);

	int decisionPurchase(OrderVO vo);

	int updateMileage(OrderVO vo);

	int decreaseCnt(OrderVO vo);

	void changeRefundState(RefundVO refundVO);

	List<OrderVO> refundList(String ae_id);

	List<OrderVO> completeList(String ae_id);

	int completePurCnt(String ae_id);

	List<OrderVO> pagingComplete(PagingVO<OrderVO> pagingVO);

	int refundListCnt(String ae_id);

	List<OrderVO> pagingRefundList(PagingVO<OrderVO> pagingVO);

}
