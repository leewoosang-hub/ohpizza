package co.ohpizza.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.ohpizza.common.AlertControl;
import co.ohpizza.common.Control;
import co.ohpizza.service.BoardService;
import co.ohpizza.service.BoardServiceImpl;
import co.ohpizza.vo.BoardVO;

public class AddInquiryControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		HttpSession session = req.getSession(false);
		String id = (String) session.getAttribute("logId");
	
		String title = req.getParameter("title");
		String question = req.getParameter("question");
		
		BoardVO board = new BoardVO();
		board.setMemId(id);
		board.setBoardTitle(title);
		board.setQuestion(question);
		
		BoardService bsv = new BoardServiceImpl();
		
		String msg = null;
		String url = "inquiryList.do";
		if(bsv.addInquiry(board)) {
			msg = "문의가 등록되었습니다!";
		}
		else {
			msg = "문의 등록 중 오류가 발생했습니다!";
		}
		AlertControl.alertAndGo(resp, msg, url);
		
	}

}
