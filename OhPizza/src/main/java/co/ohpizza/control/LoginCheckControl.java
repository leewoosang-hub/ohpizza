package co.ohpizza.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.ohpizza.common.AlertControl;
import co.ohpizza.common.Control;
import co.ohpizza.service.MemberService;
import co.ohpizza.service.MemberServiceImpl;
import co.ohpizza.vo.MemberVO;

public class LoginCheckControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");  //한글이 깨질수도 있어서 UTF-8로 인코딩 처리
		String id = req.getParameter("id");
		String pw = req.getParameter("pw");

		MemberService msv = new MemberServiceImpl();
		MemberVO mvo = msv.loginCheck(id, pw);

		if(mvo == null) {
			String msg = "아이디와 비밀번호를 확인하세요!";
			String url = "login.do";
			AlertControl.alertAndGo(resp, msg, url);
			return;
		}
		
		// 세션객체(attribute 활용해서 저장)
		HttpSession session = req.getSession();
		session.setAttribute("logId", id); // logId에 id값을 담음
		session.setMaxInactiveInterval(30 * 60); // 30분
		if(mvo.getAuthority().equals("User")) {
			resp.sendRedirect("index.jsp");
		}
		else if(mvo.getAuthority().equals("Admin")) {
			resp.sendRedirect("memberList.do");
		}
		else {
			String msg = "권한을 지정하세요!";
			AlertControl.alert(resp, msg);
		}
		
	}

}
