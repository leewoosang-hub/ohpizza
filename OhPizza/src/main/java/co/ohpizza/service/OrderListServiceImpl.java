package co.ohpizza.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.ohpizza.common.DataSource;
import co.ohpizza.mapper.OrderListMapper;
import co.ohpizza.vo.OrderlistVO;

public class OrderListServiceImpl implements OrderListService{
	SqlSession sqlSession = DataSource.getInstance().openSession(true);
	OrderListMapper mapper = (OrderListMapper) sqlSession.getMapper(OrderListMapper.class);
	
	@Override
	public boolean addOrderList(String orderNo, String prodNo, String count, String prodPrice, String prodName) {
		return mapper.addOrderList(orderNo, prodNo, count, prodPrice, prodName) == 1;
	}

	@Override
	public List<OrderlistVO> selectOrderListL(int ordNo) {
		// TODO Auto-generated method stub
		return mapper.selectOrderListL(ordNo);
	}

	@Override
	public int countOrderList(int ordNo) {
		// TODO Auto-generated method stub
		return mapper.countOrderList(ordNo);
	}

	@Override
	public boolean deleteOrderList(int listNo) {
		// TODO Auto-generated method stub
		return mapper.deleteOrderList(listNo) == 1;
	}

	@Override
	public boolean modifyOlcnt(int count, int listNo) {
		// TODO Auto-generated method stub
		return mapper.modifyOlcnt(count, listNo)==1;
	}

	@Override
	public OrderlistVO selectOrderList(int listNo) {
		// TODO Auto-generated method stub
		return mapper.selectOrderList(listNo);
	}

	@Override
	public int updateOrderList(int ordNo, int listNo) {
		// TODO Auto-generated method stub
		return mapper.updateOrderList(ordNo, listNo);
	}

	
}
