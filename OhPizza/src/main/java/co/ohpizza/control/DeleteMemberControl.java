package co.ohpizza.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.ohpizza.common.AlertControl;
import co.ohpizza.common.Control;
import co.ohpizza.service.MemberService;
import co.ohpizza.service.MemberServiceImpl;

public class DeleteMemberControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = req.getParameter("id");
		MemberService msv = new MemberServiceImpl();
		
		String msg = null;
		String url = "memberList.do";
//		String url = req.getParameter("url");
//		url = url == null ? "memberList.do" : url;
		
		if(id == "admin") {
			msg = "admin 계정은 삭제할 수 없습니다!!";
			AlertControl.alertAndGo(resp, msg, url);
			return;
		}
		
		if(msv.delMember(id)) {
			msg = id + " 계정 삭제 완료!";
		}
		else {
			msg = "계정 삭제 중 오류 발생!";
		}
		AlertControl.alertAndGo(resp, msg, url);
		
	}

}
