package co.ohpizza.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.ohpizza.common.Control;
import co.ohpizza.service.OrderListService;
import co.ohpizza.service.OrderListServiceImpl;

public class DownPcntControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		int downCount = Integer.parseInt(req.getParameter("count")) - 1;
		int listNo = Integer.parseInt(req.getParameter("listNo"));


		OrderListService olsvc = new OrderListServiceImpl();

		if (olsvc.modifyOlcnt(downCount, listNo)) {
			// {"retCode": "Success"}
			resp.getWriter().print("{\"retCode\": \"Success\"}");
		} else {
			resp.getWriter().print("{\"retCode\": \"Fail\"}");
		}

	}


}


