package co.ohpizza.control;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.ohpizza.common.AlertControl;
import co.ohpizza.common.Control;
import co.ohpizza.service.MemberService;
import co.ohpizza.service.MemberServiceImpl;
import co.ohpizza.service.OrderListService;
import co.ohpizza.service.OrderListServiceImpl;
import co.ohpizza.vo.MemberVO;
import co.ohpizza.vo.OrderlistVO;

public class PayControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		if(req.getParameter("cartList").isEmpty()) {
			String msg = "결제할 항목이 없습니다!";
			AlertControl.alertAndBack(resp, msg);
			return;
		}
		
		String[] cartList = req.getParameter("cartList").split(",");
		
		String id = req.getParameter("id");
		
		OrderListService olsvc = new OrderListServiceImpl();
		
		MemberService msvc = new MemberServiceImpl();
		
		MemberVO member = msvc.infoMember(id);
				
				
		List<OrderlistVO> olList = new ArrayList<OrderlistVO>();

		
		for(String a: cartList) {
			olList.add(olsvc.selectOrderList(Integer.parseInt(a)));
		}
		
		System.out.println(olList);
				
		
		int lastPrice = Integer.parseInt(req.getParameter("lastPrice"));
		
		System.out.println(lastPrice);
		
		req.setAttribute("lastPrice", lastPrice);
		
		req.setAttribute("olList", olList);
		
		req.setAttribute("member", member);
		
		req.getRequestDispatcher("product/pay.tiles").forward(req, resp);

	}

}
