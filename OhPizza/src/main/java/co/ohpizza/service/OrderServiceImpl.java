package co.ohpizza.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.ohpizza.common.DataSource;
import co.ohpizza.mapper.OrderMapper;
import co.ohpizza.vo.OrderVO;

public class OrderServiceImpl implements OrderService {
	SqlSession sqlSession = DataSource.getInstance().openSession(true);
	OrderMapper mapper = (OrderMapper) sqlSession.getMapper(OrderMapper.class);

	@Override
	public List<OrderVO> orderList(String memId) {
		return mapper.selectOrderList(memId);
	}
	

	@Override
	public boolean addOrder(String memId) {
		return mapper.addOrder(memId) == 1;
	}


	@Override
	public boolean checkOrder(String memId) {
		// TODO Auto-generated method stub
		return mapper.checkOrder(memId)>=1;
	}


	@Override
	public OrderVO selectOrder(String memId) {
		// TODO Auto-generated method stub
		return mapper.selectOrder(memId);
	}


	@Override
	public int priceOrder(int price, int ordNo) {
		// TODO Auto-generated method stub
		return mapper.priceOrder(price, ordNo);
	}


	@Override
	public boolean addPOrder(OrderVO ovo) {
		// TODO Auto-generated method stub
		return mapper.addPOrder(ovo) == 1;
	}


	@Override
	public OrderVO selectPOrder(String memId) {
		// TODO Auto-generated method stub
		return mapper.selectPOrder(memId);
	}


	@Override
	public int updateOrder(int ordNo) {
		// TODO Auto-generated method stub
		return mapper.updateOrder(ordNo);
	}


	@Override
	public List<OrderVO> orderEList(String memId) {
		// TODO Auto-generated method stub
		return mapper.orderEList(memId);
	}
	
	

}
