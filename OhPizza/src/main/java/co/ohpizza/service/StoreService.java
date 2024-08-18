package co.ohpizza.service;

import java.util.List;

import co.ohpizza.vo.StoreVO;

public interface StoreService {
	// 매장 리스트
	List<StoreVO> storeList();
	
	// 매장 삭제
	boolean delStore(String name);
	
	// 매장 등록
	boolean addStore(StoreVO svo);
	
}
