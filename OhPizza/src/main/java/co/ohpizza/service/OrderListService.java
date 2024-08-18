package co.ohpizza.service;

import java.util.List;

import co.ohpizza.vo.OrderlistVO;

public interface OrderListService {

	boolean addOrderList(String orderNo, String prodNo, String cnt, String prodPrice, String prodName);
	
	List<OrderlistVO> selectOrderListL(int ordNo);
	
	// 장바구니 품목 숫자
	int countOrderList(int ordNo);
	
	// 장바구니 삭제
	boolean deleteOrderList(int listNo);
	
	// 장바구니 품목 수량 변경
	boolean modifyOlcnt(int count, int listNo);
	
	OrderlistVO selectOrderList(int listNo);
	
	int updateOrderList(int ordNo, int listNo);
}
