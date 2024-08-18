package co.ohpizza.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import co.ohpizza.vo.CouponVO;
import co.ohpizza.vo.MemCouponVO;

public interface CouponMapper {
	// 쿠폰 전체 목록 (Admin)
	List<CouponVO> selectCoupons();
	// 쿠폰 삭제 (Admin)
	int removeCoupon(String name);
	// 쿠폰 등록 (Admin)
	int insertCoupon(CouponVO coupon);
	
	// 쿠폰 할인율
	String selectCoupon(String couponNm);
	
	// 회원 보유 쿠폰
	List<String> memberCouponList(String id);
	
	// 회원 쿠폰 발급 (kangwonjun)
	int insertMemCoupon(MemCouponVO mcv);
	
	// 회원 쿠폰 중복 확인 
	int duplicateCoupon(@Param("mem_id")String memId,
						@Param("coupon_name")String couponName);

}
