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

public class DeleteMeControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession(false);
		String id = (String) session.getAttribute("logId");
		
		String msg = null;
		String url = "index.jsp";
		
		MemberService msv = new MemberServiceImpl();
		if(msv.delMember(id)) {
			session.invalidate();
			msg = "탈퇴 처리 되었습니다!!";
			AlertControl.alertAndGo(resp, msg, url);
		}
		else {
			msg = "탈퇴 처리 중 오류가 발생했습니다!";
			url = "myPage.do";
			AlertControl.alertAndGo(resp, msg, url);
		}

	}

}
