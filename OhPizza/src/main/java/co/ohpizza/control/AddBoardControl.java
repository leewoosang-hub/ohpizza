package co.ohpizza.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.ohpizza.common.Control;
import co.ohpizza.service.BoardService;
import co.ohpizza.service.BoardServiceImpl;
import co.ohpizza.vo.BoardVO;

public class AddBoardControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp)//
	throws ServletException, IOException {

		String title = req.getParameter("title");
		String review = req.getParameter("review");
		String id = req.getParameter("memID");
		
		BoardVO boardVO = new BoardVO();
		boardVO.setBoardTitle(title);
		boardVO.setReview(review);
		boardVO.setMemId(id);
		
		System.out.println(boardVO.getBoardTitle());
		System.out.println(boardVO.getReview());
		System.out.println(boardVO.getMemId());
		
		BoardService boardService = new BoardServiceImpl();
		
		//System.out.println(boardService.insertViewBoard(boardVO));

		if (boardService.insertViewBoard(boardVO)) {
			resp.sendRedirect("boardList.do");
		}else {
			resp.sendRedirect("boardForm.do");
		}
	}
}
