package co.ohpizza.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.ohpizza.common.AlertControl;
import co.ohpizza.common.Control;
import co.ohpizza.service.StoreService;
import co.ohpizza.service.StoreServiceImpl;

public class DeleteStoreControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name = req.getParameter("name");
		
		StoreService ssv = new StoreServiceImpl();
		
		String msg = null;
		String url = "storeList.do";
		if(ssv.delStore(name)) {
			msg = name + " 매장이 삭제되었습니다!";
		}
		else {
			msg = "매장 삭제 중 오류가 발생했습니다!";
		}
		AlertControl.alertAndGo(resp, msg, url);

	}

}
