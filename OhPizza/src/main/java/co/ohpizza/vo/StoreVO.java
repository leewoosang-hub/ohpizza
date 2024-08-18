package co.ohpizza.vo;

import lombok.Data;

@Data
public class StoreVO {
	private String storeName; //매장이름
	private String address; //주소
	private String phone; //전화번호
	private String locName; //지점명
	private float latitude; // 위도
	private float longitude; // 경도
	
}
