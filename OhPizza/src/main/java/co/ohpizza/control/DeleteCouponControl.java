package co.ohpizza.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.ohpizza.common.AlertControl;
import co.ohpizza.common.Control;
import co.ohpizza.service.CouponService;
import co.ohpizza.service.CouponServiceImpl;

public class DeleteCouponControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name = req.getParameter("name");
		CouponService csv = new CouponServiceImpl();
		
		String msg = null;
		String url = "couponList.do";
		
		if(csv.delCoupon(name)) {
			msg = name + " 쿠폰 삭제 완료!";
		}
		else {
			msg = "쿠폰 삭제 중 오류 발생!";
		}
		AlertControl.alertAndGo(resp, msg, url);
	}

}
