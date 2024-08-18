package co.ohpizza.service;

import java.util.List;

import co.ohpizza.vo.CouponVO;
import co.ohpizza.vo.MemCouponVO;

public interface CouponService {
	// 쿠폰 전체 목록 (Admin)
	List<CouponVO> couponList();
	// 쿠폰 삭제 (Admin)
	boolean delCoupon(String name);
	// 쿠폰 등록 (Admin)
	boolean addCoupon(CouponVO coupon);
	
	// 쿠폰이름의 할인율 확인
	String getCoupon(String couponNm);  
	
	// 멤버가 보유한 쿠폰 확인
	List<String> memberCouponList(String id);
	
	// 회원 쿠폰 발급 (kangwonjun)
	boolean addMemCoupon(MemCouponVO mcvo);
	
	// 쿠폰 중복 발급 확인
	int duplicateCoupon(String memId, String couponName);

}
