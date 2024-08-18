package co.ohpizza.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.ohpizza.common.AlertControl;
import co.ohpizza.common.Control;
import co.ohpizza.service.MemberService;
import co.ohpizza.service.MemberServiceImpl;
import co.ohpizza.vo.MemberVO;

public class GetPassControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");  //한글이 깨질수도 있어서 UTF-8로 인코딩 처리
		String id = req.getParameter("id");
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		
		MemberVO mvo = new MemberVO();
		mvo.setMemId(id);
		mvo.setMemName(name);
		mvo.setEmail(email);
				
		MemberService msv = new MemberServiceImpl();
		
		String msg = null;
		String url = "login.do";
		if(!(msv.getPassword(mvo) == null) && !msv.getPassword(mvo).isEmpty()) {
			msg = "현재 비밀번호는 [" + msv.getPassword(mvo) +"] 입니다!";
			AlertControl.alertAndGo(resp, msg, url);
		}
		else {
			msg = "입력된 정보를 다시 확인해 주세요!";
			url = "findPass.do";
			AlertControl.alertAndGo(resp, msg, url);
		}

	}

}
