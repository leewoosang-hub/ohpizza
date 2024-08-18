package co.ohpizza.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.ohpizza.common.Control;

public class MypageControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession(false);
		String id = (String) session.getAttribute("logId");
		
		if(id == null || id.isEmpty()) {
			req.getRequestDispatcher("account/login.tiles").forward(req, resp);
		}
		else {
			req.getRequestDispatcher("myOrder.do").forward(req, resp);
		}

	}

}
