package co.ohpizza.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.ohpizza.common.AlertControl;
import co.ohpizza.common.Control;
import co.ohpizza.service.OrderListService;
import co.ohpizza.service.OrderListServiceImpl;
import co.ohpizza.service.OrderService;
import co.ohpizza.service.OrderServiceImpl;
import co.ohpizza.vo.OrderVO;

public class FinalBuyControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 내용 가져오기
		String price = req.getParameter("price");

		String[] cartList = req.getParameter("listNoL").split(",");

		String id = req.getParameter("id");

		String msg = "결제 완료";
		String url = "myPage.do";

		System.out.println(id);

		OrderService osvc = new OrderServiceImpl();

		OrderListService olsvc = new OrderListServiceImpl();
		// 결제 중(P) 오더 만들기

		OrderVO ovo = new OrderVO();// osvc.selectPOrder(id);
		ovo.setMemId(id);
		ovo.setPrice(Integer.parseInt(price));

		osvc.addPOrder(ovo);
		System.out.println(ovo);

		// 결제중 오더 넘버 가져오기
		int ordNo = ovo.getOrdNo();

		System.out.println(ordNo);

		// 결제할 장바구니 품목들 P 오더넘버로 바꾸기
		for (String listNo : cartList) {
			System.out.println(listNo);
			olsvc.updateOrderList(ordNo, Integer.parseInt(listNo));
		}

		// 결제중 오더(P)를 결제완료 넘버로 바꾸기(E)
		osvc.updateOrder(ordNo);

		AlertControl.alertAndGo(resp, msg, url);

	}

}
