package co.ohpizza.control;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.ohpizza.common.Control;
import co.ohpizza.service.BoardService;
import co.ohpizza.service.BoardServiceImpl;
import co.ohpizza.vo.BoardVO;

public class BoardDetailControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp)//
	throws ServletException, IOException {
		
		BoardService boardService = new BoardServiceImpl();

		String bno = req.getParameter("bno");
		
		BoardVO boardDetail = boardService.boardDetail(Integer.parseInt(bno));
		//조회수를 증가시키는 기능
		boardService.viewIncrease(Integer.parseInt(bno));
		
		req.setAttribute("boardDetail", boardDetail);
		
		req.getRequestDispatcher("board/boardDetail.tiles")//
		.forward(req, resp);
		
	}

}
