package co.ohpizza.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import co.ohpizza.vo.MemberVO;

public interface MemberMapper {
	// 멤버 리스트 출력
	List<MemberVO> selectList(@Param("orderBy") String order, @Param("auth") String res);
	
	// 멤버 삭제
	int deleteMember(String id);
	
	// 로그인 체크
	MemberVO checkMember(@Param("id") String id, @Param("pw") String pw); // xml에서 사용
	
	// 비밀번호 찾기
	String findPass(MemberVO mvo);
	
	// 회원가입
	int insertMember(MemberVO mvo);
	
	// 김수호
	// id중복체크
	int selectId(String id);

	// 멤버 정보
	MemberVO selectMember(String id);
	
	// 멤버 정보변경
	int updateMember(MemberVO mvo);
	
	// 멤버 정보
	MemberVO infoMember(String id);

}
