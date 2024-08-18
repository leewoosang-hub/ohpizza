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

public class RemoveBoardControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp)//
			throws ServletException, IOException {

		String boardNo = req.getParameter("boardNo");
		
		String msg = "삭제하였습니다.";
		String url = "boardList.do";
		
		String msg2 = "삭제하지 못했습니다.";

		BoardService boardService = new BoardServiceImpl();
		if (boardService.removeBoard(Integer.parseInt(boardNo))) {
			AlertControl.alertAndGo(resp, msg, url);
		} else {
			AlertControl.alertAndGo(resp, msg2, url);
		}

	}

}
