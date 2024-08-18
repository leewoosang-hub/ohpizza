package co.ohpizza.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.ohpizza.common.Control;
import co.ohpizza.service.OrderListService;
import co.ohpizza.service.OrderListServiceImpl;

public class UpPcntControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		resp.setContentType("text/json;charset=utf-8");
		HttpSession session = req.getSession();

		int upCount = Integer.parseInt(req.getParameter("count")) + 1;
		int listNo = Integer.parseInt(req.getParameter("listNo"));
		String id = (String) session.getAttribute("logId");

		System.out.println(id);

		OrderListService olsvc = new OrderListServiceImpl();

		if (olsvc.modifyOlcnt(upCount, listNo)) {
			// {"retCode": "Success"}
			resp.getWriter().print("{\"retCode\": \"Success\"}");
		} else {
			resp.getWriter().print("{\"retCode\": \"Fail\"}");
		}

	}

}
