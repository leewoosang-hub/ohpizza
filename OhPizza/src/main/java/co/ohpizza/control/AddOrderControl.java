package co.ohpizza.control;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.ohpizza.common.AlertControl;
import co.ohpizza.common.Control;
import co.ohpizza.service.OrderListService;
import co.ohpizza.service.OrderListServiceImpl;
import co.ohpizza.service.OrderService;
import co.ohpizza.service.OrderServiceImpl;
import co.ohpizza.service.ProductService;
import co.ohpizza.service.ProductServiceImpl;
import co.ohpizza.vo.OrderlistVO;
import co.ohpizza.vo.ProductVO;

public class AddOrderControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String prodName = req.getParameter("prodName");
		String memId = req.getParameter("memId");
		String price = req.getParameter("price");
		String cnt = req.getParameter("cnt");
		String prodNo = req.getParameter("prodNo");
		
		OrderService osvc = new OrderServiceImpl();
		OrderListService olsvc = new OrderListServiceImpl();
		
		
		ProductService psvc = new ProductServiceImpl();
		
		ProductVO pvo = psvc.selectProduct(Integer.parseInt(prodNo));
		
		int fullPrice = 0;
		
		String msg = "장바구니 담기 완료";
		
		
		
		// 해당 id의 주문상태가 c인 order가 존재할 경우 
		if(osvc.checkOrder(memId)) {
			int ordNo = osvc.selectOrder(memId).getOrdNo();
			olsvc.addOrderList(Integer.toString(ordNo), prodNo, cnt, price, prodName);
			
			List<OrderlistVO> oList = olsvc.selectOrderListL(ordNo);
			for(OrderlistVO o: oList) {
				System.out.println(o.getCount() +"  " + o.getProdPrice());
				int a = o.getCount()*o.getProdPrice();				
				fullPrice += a;
				System.out.println(fullPrice);
			}
			osvc.priceOrder(fullPrice, ordNo);
			
//			resp.sendRedirect("productList.do");
			AlertControl.alertAndBack(resp, msg);
		} else {
		// 해당 id의 주문상태가 c인 order가 없을 경우
			osvc.addOrder(memId);
			int ordNo = osvc.selectOrder(memId).getOrdNo();
			olsvc.addOrderList(Integer.toString(ordNo), prodNo, cnt, price, prodName);
			
			List<OrderlistVO> oList = olsvc.selectOrderListL(ordNo);
			for(OrderlistVO o: oList) {
				System.out.println(o.getCount() +"  " + o.getProdPrice());
				int a = o.getCount()*o.getProdPrice();				
				fullPrice += a;
				System.out.println(fullPrice);
			}
			osvc.priceOrder(fullPrice, ordNo);
			
//			resp.sendRedirect("productList.do");
			AlertControl.alertAndBack(resp, msg);
		}
		
	}

}
