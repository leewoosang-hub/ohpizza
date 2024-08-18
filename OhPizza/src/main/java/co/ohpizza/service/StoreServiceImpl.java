package co.ohpizza.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.ohpizza.common.DataSource;
import co.ohpizza.mapper.StoreMapper;
import co.ohpizza.vo.StoreVO;

public class StoreServiceImpl implements StoreService {
	SqlSession sqlSession = DataSource.getInstance().openSession(true);
	StoreMapper mapper = sqlSession.getMapper(StoreMapper.class);

	@Override
	public List<StoreVO> storeList() {
		return mapper.selectStore();
	}

	@Override
	public boolean delStore(String name) {
		return mapper.deleteStore(name) == 1;
	}

	@Override
	public boolean addStore(StoreVO svo) {
		return mapper.insertStore(svo) == 1;
	}

}
