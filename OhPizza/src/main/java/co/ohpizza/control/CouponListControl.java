package co.ohpizza.control;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.ohpizza.common.Control;
import co.ohpizza.service.CouponService;
import co.ohpizza.service.CouponServiceImpl;
import co.ohpizza.vo.CouponVO;

public class CouponListControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		CouponService csv = new CouponServiceImpl();
		List<CouponVO> couponList = csv.couponList();
		
		req.setAttribute("coupons", couponList);
		req.getRequestDispatcher("admin/couponList.tiles").forward(req, resp);

	}

}
