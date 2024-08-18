package co.ohpizza.service;

import java.util.List;

import co.ohpizza.vo.MemberVO;

public interface MemberService {
	// 멤버 리스트 (Admin)
	List<MemberVO> memberList(String orderBy, String auth);
	
	// 멤버 삭제 (Admin)
	boolean delMember(String id);
	
	// 로그인 체크
	MemberVO loginCheck(String id, String pw);
	
	// 비밀번호 찾기
	String getPassword(MemberVO mvo);
	
	// 회원가입
	boolean newMember(MemberVO mvo);
	
    // 김수호
	// id중복체크
	boolean duplicateId(String id);
	
	// 회원 정보
	MemberVO showMember(String id);

	
	// 회원 정보 가져오기
	MemberVO infoMember(String id);
  
	// 회원 정보변경
	boolean modMember(MemberVO mvo);

}
