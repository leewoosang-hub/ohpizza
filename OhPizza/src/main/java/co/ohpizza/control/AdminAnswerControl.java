package co.ohpizza.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.ohpizza.common.AlertControl;
import co.ohpizza.common.Control;
import co.ohpizza.service.BoardService;
import co.ohpizza.service.BoardServiceImpl;
import co.ohpizza.vo.BoardVO;

public class AdminAnswerControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp)//
			throws ServletException, IOException {
			req.setCharacterEncoding("UTF-8");

		BoardService boardservice = new BoardServiceImpl();

		String title = req.getParameter("title");
		String answer = req.getParameter("answer");
		String bno = req.getParameter("bno");

		BoardVO boardvo = new BoardVO();
		boardvo.setBoardTitle(title);
		boardvo.setAnswer(answer);
		boardvo.setBoardNo(Integer.parseInt(bno));

		if (boardservice.adminAnswer(boardvo)) {
			String msg = "답변 등록을 완료했습니다.";
			String url = "adminAnswerList.do";
			AlertControl.alertAndGo(resp, msg, url);
		} else {
			String msg = "답변 등록에 실패했습니다.";
			String url = "adminAnswerForm.do";
			AlertControl.alertAndGo(resp, msg, url);
		}
	}

}
