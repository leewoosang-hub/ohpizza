package co.ohpizza.mapper;

import java.util.List;

import co.ohpizza.vo.StoreVO;

public interface StoreMapper {
	List<StoreVO> selectStore();
	
	int deleteStore(String name);
	
	int insertStore(StoreVO svo);
}
