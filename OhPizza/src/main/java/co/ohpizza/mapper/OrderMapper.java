package co.ohpizza.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import co.ohpizza.vo.OrderVO;

public interface OrderMapper {
	List<OrderVO> selectOrderList(String memId);

	// 장바구니 처음 실행 시 오더 생성
	int addOrder(String memId);

	int checkOrder(String memId);

	// 해당 아이디의 cart상태 오더 확인
	OrderVO selectOrder(String memId);

	// 오더 값 넣기
	int priceOrder(@Param("price") int price, @Param("ordNo") int ordNo);

	// 결제 중 내역 만들기
	int addPOrder(OrderVO ovo);

	// 결제 중 내역 번호 가져오기(p상태)
	OrderVO selectPOrder(String memId);

	int updateOrder(int ordNo);
	
	List<OrderVO> orderEList(String memId);
}
