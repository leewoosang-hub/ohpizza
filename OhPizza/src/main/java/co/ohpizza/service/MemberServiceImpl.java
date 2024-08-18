package co.ohpizza.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.ohpizza.common.DataSource;
import co.ohpizza.mapper.MemberMapper;
import co.ohpizza.vo.MemberVO;

public class MemberServiceImpl implements MemberService {
	SqlSession sqlSession = DataSource.getInstance().openSession(true);
	MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
	
	// 멤버 리스트(Admin)
	@Override
	public List<MemberVO> memberList(String orderBy, String auth) {
		return mapper.selectList(orderBy, auth);
	}
	
	// 멤버 삭제(Admin)
	@Override
	public boolean delMember(String id) {
		return mapper.deleteMember(id) == 1;
	}
	
	@Override
	public MemberVO loginCheck(String id, String pw) {
		return mapper.checkMember(id, pw);
	}

	@Override
	public String getPassword(MemberVO mvo) {
		return mapper.findPass(mvo);
	}
	
	// 회원가입
	@Override
	public boolean newMember(MemberVO mvo) {
		return mapper.insertMember(mvo) == 1;
	}

	// 김수호
	// id중복체크
	@Override
	public boolean duplicateId(String id) {
		return mapper.selectId(id) == 0;
	}

	@Override
	public MemberVO showMember(String id) {
		return mapper.selectMember(id);
	}
	
	public boolean modMember(MemberVO mvo) {
		return mapper.updateMember(mvo) == 1;
	}

	@Override
	public MemberVO infoMember(String id) {
		// TODO Auto-generated method stub
		return mapper.infoMember(id);
	}
  
}
