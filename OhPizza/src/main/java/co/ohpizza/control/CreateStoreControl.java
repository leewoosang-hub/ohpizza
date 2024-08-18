package co.ohpizza.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.ohpizza.common.AlertControl;
import co.ohpizza.common.Control;
import co.ohpizza.service.StoreService;
import co.ohpizza.service.StoreServiceImpl;
import co.ohpizza.vo.StoreVO;

public class CreateStoreControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8"); // 한글이 깨질수도 있어서 UTF-8로 인코딩 처리
		String name = req.getParameter("name");
		String phone = req.getParameter("phone");
		String address = req.getParameter("address");
		String address_detail = req.getParameter("address_detail");
		address += " " + address_detail;
		String locName = req.getParameter("locName");
		float lati = Float.parseFloat(req.getParameter("lat"));
		float longi = Float.parseFloat(req.getParameter("long"));
		
		StoreVO store = new StoreVO();
		store.setStoreName(name);
		store.setPhone(phone);
		store.setAddress(address);
		store.setLocName(locName);
		store.setLatitude(lati);
		store.setLongitude(longi);
		
		StoreService ssv = new StoreServiceImpl();
		
		String msg = null;
		String url = "addStore.do";
		if(ssv.addStore(store)) {
			msg = name + " 매장이 등록되었습니다!";
		}
		else {
			msg = "매장 등록 중 오류가 발생했습니다!";
		}
		AlertControl.alertAndGo(resp, msg, url);

	}

}
