package co.ohpizza.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.ohpizza.common.AlertControl;
import co.ohpizza.common.Control;

public class LogoutControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession(false);
		if (session != null) {
			session.invalidate();
//			Writer out = resp.getWriter();
//			String msg = URLEncoder.encode("로그아웃 되었습니다!","UTF-8");
//			resp.setContentType("text/html; charset=UTF-8");
//			out.write("<script type=\"text/javascript\">alert(decodeURIComponent('"+msg+"'.replace(/\\+/g, '%20'))); location.href='index.jsp'</script>");
//			out.flush();
//			resp.flushBuffer();
//			out.close();
			String msg = "로그아웃 되었습니다!";
			String url = "index.jsp";
			AlertControl.alertAndGo(resp, msg, url);
		}
		
		resp.sendRedirect("index.jsp");

	}

}
