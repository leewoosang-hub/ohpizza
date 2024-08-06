package co.ohpizza.service;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.ohpizza.common.DataSource;
import co.ohpizza.mapper.MemberMapper;
import co.ohpizza.vo.MemberVO;

public class MemberServiceImpl implements MemberService {
	SqlSession sqlSession = DataSource.getInstance().openSession(true);
	MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);

	@Override
	public MemberVO loginCheck(String id, String pw) {
		return mapper.selectMember(id, pw);
	}

	@Override
	public List<MemberVO> memberList(String orderBy, String auth) {
		return mapper.selectList(orderBy, auth);
	}

	// 회원가입
	@Override
	public boolean newMember(MemberVO mvo) {
		return mapper.insertMember(mvo) == 1;
	}
}
