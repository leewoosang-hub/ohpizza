package co.ohpizza.control;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.ohpizza.common.Control;
import co.ohpizza.service.OrderListService;
import co.ohpizza.service.OrderListServiceImpl;
import co.ohpizza.service.OrderService;
import co.ohpizza.service.OrderServiceImpl;
import co.ohpizza.vo.OrderVO;
import co.ohpizza.vo.OrderlistVO;

public class CartControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String id = req.getParameter("id");

		OrderService osvc = new OrderServiceImpl();

		List<OrderlistVO> cart = new ArrayList<OrderlistVO>();

		if (osvc.checkOrder(id)) {

			OrderVO ovo = osvc.selectOrder(id);

			OrderListService olsvc = new OrderListServiceImpl();

			cart = olsvc.selectOrderListL(ovo.getOrdNo());

			System.out.println(cart);

			// aPrice = 총 가격 합
			int aPrice = 0;

			aPrice = ovo.getPrice();

			req.setAttribute("cartList", cart);

			req.setAttribute("aPrice", aPrice);

			req.getRequestDispatcher("product/cartList.tiles").forward(req, resp);
		}

		else {
			osvc.addOrder(id);

			req.setAttribute("cartList", cart);

			req.getRequestDispatcher("product/cartList.tiles").forward(req, resp);
		}
	}

}
