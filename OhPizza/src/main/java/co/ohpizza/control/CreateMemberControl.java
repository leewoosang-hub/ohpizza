package co.ohpizza.control;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

import com.google.gson.Gson;

import co.ohpizza.common.AlertControl;
import co.ohpizza.common.Control;
import co.ohpizza.common.DataSource;
import co.ohpizza.mapper.MemberMapper;
import co.ohpizza.service.MemberService;
import co.ohpizza.service.MemberServiceImpl;
import co.ohpizza.vo.MemberVO;

public class CreateMemberControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8"); // 한글이 깨질수도 있어서 UTF-8로 인코딩 처리
		SqlSession sqlSession = DataSource.getInstance().openSession(true); // <--true 써야지 자동커밋
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);

		// --------------회원가입 ---------------
		String loginId = req.getParameter("loginId");
		String loginPw = req.getParameter("loginPw");
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String cellphoneNo = req.getParameter("cellphoneNo");
		String address = req.getParameter("address");
		String address_detail = req.getParameter("address_detail");
		address += " " + address_detail;

		MemberVO mvo = new MemberVO();
		mvo.setMemId(loginId);
		mvo.setMemPw(loginPw);
		mvo.setMemName(name);
		mvo.setEmail(email);
		mvo.setPhone(cellphoneNo);
		mvo.setAddress(address);
		mvo.setAuthority("User");
		// mapper. 안에 있는 insertMember 매소드호출하는데 매개변수가 있어서 mvo () 넣은것.
		
		String msg = null;
		String url = "index.jsp";
		if (mapper.insertMember(mvo) == 1) {
			HttpSession session = req.getSession();
			session.setAttribute("logId", loginId); // logId에 id값을 담음
			session.setMaxInactiveInterval(30 * 60); // 30분
			msg = "회원이 되신걸 환영합니다!!";
			AlertControl.alertAndGo(resp, msg, url);
		} else {
			msg = "가입 양식을 다시 확인 바랍니다!";
			url = "addMember.do"; // 회원가입 실패 할 경우 회원가입 이동
			
		}
	
	}

}


//
//MemberService svc = new MemberServiceImpl();
//MemberVO mvo2 = svc.duplicateId(id);

//if(mvo2 == null) {
//	// 메세지를 "아이디와 비번을 확인하세요!"
//	req.setAttribute("msg", "중복된 아이디입니다");
//	return;
//}
////중복아이디 실패작3
//MemberVO member = mapper.selectList(loginId);
//if (member == null) {
//    resp.getWriter().write("available");
//} else {
//    resp.getWriter().write("duplicated");
//}
