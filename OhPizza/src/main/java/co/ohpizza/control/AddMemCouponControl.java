package co.ohpizza.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.velocity.runtime.directive.Foreach;

import co.ohpizza.common.AlertControl;
import co.ohpizza.common.Control;
import co.ohpizza.service.CouponService;
import co.ohpizza.service.CouponServiceImpl;
import co.ohpizza.vo.MemCouponVO;

public class AddMemCouponControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession(false);
		String id = (String) session.getAttribute("logId");
		String couponName = "가입 쿠폰";

		MemCouponVO mcvo = new MemCouponVO();
		mcvo.setMemId(id);
		mcvo.setCouponName(couponName);

		String msg = null;
		String url = "event.do";
		CouponService csv = new CouponServiceImpl();
		
		if(id == null || id.isEmpty()) {
			msg = "로그인이 필요합니다!";
			url = "login.do";
			AlertControl.alertAndGo(resp, msg, url);
			return;
		}
		// 중복 발급 체크
		if (csv.duplicateCoupon(id, couponName) < 1) {
			if(csv.addMemCoupon(mcvo)) {
				msg = couponName + "이 발행되었습니다!";
			}else {
				msg = "쿠폰 발행중 오류가 발생했습니다!";
			}
		} else {
			msg = "이미 발행되었습니다!";
		}
		AlertControl.alertAndGo(resp, msg, url);

	}
}
