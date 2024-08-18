package co.ohpizza.vo;

import lombok.Data;
@Data
public class OrderVO {
	private int ordNo; // 주문번호
	private String memId; // 구매한 id
	private String ordDate; // 구매날짜
	private int price; // 총 구매가격
	private String locName; // 지점명
	private String ordStat; // 장바구니 : 'C', 주문 : 'O'
	private String couponName; // 주문시 사용한 쿠폰명
	
	public String orderDate() {
		return ordDate.substring(0, 10);
	}

}

