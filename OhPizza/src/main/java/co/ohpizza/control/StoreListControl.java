package co.ohpizza.control;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.ohpizza.common.Control;
import co.ohpizza.service.StoreService;
import co.ohpizza.service.StoreServiceImpl;
import co.ohpizza.vo.StoreVO;

public class StoreListControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession(false);
		String id = (String) session.getAttribute("logId");
		
		StoreService ssv = new StoreServiceImpl();
		List<StoreVO> stores = ssv.storeList();
		
		req.setAttribute("stores", stores);
		
		if(id != null && id.equals("admin")) {
			req.getRequestDispatcher("admin/storeList.tiles").forward(req, resp);
		}
		else {
			req.getRequestDispatcher("store/stores.tiles").forward(req, resp);
		}

	}

}
