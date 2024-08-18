package co.ohpizza.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.ohpizza.common.AlertControl;
import co.ohpizza.common.Control;
import co.ohpizza.service.CouponService;
import co.ohpizza.service.CouponServiceImpl;
import co.ohpizza.vo.CouponVO;

public class CreateCouponControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8"); // 한글이 깨질수도 있어서 UTF-8로 인코딩 처리
		String name = req.getParameter("name");
		String discount = req.getParameter("discount");
		
		System.out.println(name);
		System.out.println(discount);
		
		CouponService csv = new CouponServiceImpl();
		CouponVO coupon = new CouponVO();
		
		coupon.setCouponName(name);
		coupon.setDiscount(Integer.parseInt(discount));
		
		String msg = null;
		String url = "addCoupon.do";
		if(csv.addCoupon(coupon)) {
			msg = "쿠폰이 등록되었습니다!";
		}
		else {
			msg = "쿠폰 등록에 오류가 발생했습니다!";
		}
		AlertControl.alertAndGo(resp, msg, url);
	}

}
