package co.ohpizza.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.ohpizza.common.Control;
import co.ohpizza.service.MemberService;
import co.ohpizza.service.MemberServiceImpl;
import co.ohpizza.vo.MemberVO;

public class ShowMemInfoControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession(false);
		String id = (String) session.getAttribute("logId");
		
		MemberVO mvo = new MemberVO();
		MemberService msv = new MemberServiceImpl();
		mvo = msv.showMember(id);
		
		req.setAttribute("member", mvo);
		
		req.getRequestDispatcher("user/showMemInfo.tiles").forward(req, resp);

	}

}
