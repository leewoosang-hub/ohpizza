package co.ohpizza.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import co.ohpizza.vo.OrderlistVO;

public interface OrderListMapper {
	int addOrderList(@Param("ordNo")String ordNo,
					@Param("prodNo")String prodNo,
					@Param("count")String count,
					@Param("prodPrice")String prodPrice,
					@Param("prodName")String prodName);
	
	// 같은 주문번호 목록 가져오기
	
	List<OrderlistVO> selectOrderListL(int ordNo);
	
	int countOrderList(int ordNo);
	
	int deleteOrderList(int listNo);
	
	int modifyOlcnt(@Param("count")int count, 
					@Param("listNo")int listNo);
	
	OrderlistVO selectOrderList(int listNo);
	
	int updateOrderList(@Param("ordNo")int ordNo, @Param("listNo")int listNo);
}
