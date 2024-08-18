package co.ohpizza.service;

import java.util.List;

import co.ohpizza.vo.OrderVO;

public interface OrderService {
	// 장바구니 추가 클릭 시 오더 리스트 생성
	boolean addOrder(String memId);

	// memId의 오더 리스트
	List<OrderVO> orderList(String memId);

	boolean checkOrder(String memId);

	OrderVO selectOrder(String memId);

	// 오더에 총 값 넣기
	int priceOrder(int price, int ordNo);

	// 주문완료내역
	boolean addPOrder(OrderVO ovo);

	OrderVO selectPOrder(String memId);

	int updateOrder(int ordNo);

	List<OrderVO> orderEList(String memId);
}
