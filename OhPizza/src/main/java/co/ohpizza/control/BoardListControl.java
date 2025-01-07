package co.ohpizza.control;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.ohpizza.common.Control;
import co.ohpizza.common.PageDTO;
import co.ohpizza.service.BoardService;
import co.ohpizza.service.BoardServiceImpl;
import co.ohpizza.vo.BoardVO;

public class BoardListControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=UTF-8");
		BoardService BoardServiceList = new BoardServiceImpl();
		
		//게시판 출력
		//기본 페이지의 번호는 1번으로 한다.
		String page = req.getParameter("pageNum");
		page = page == null ? "1" : page;
		List<BoardVO> board = BoardServiceList.boardList(page);
		req.setAttribute("boardList", board);
		//
		
		//페이지//
		//총 게시물 수를 구하기 위한 식
		int totalCnt = BoardServiceList.totalPage();
		//pageDTO의 생성자에 넣어줄 매개변수

//		PageDTO pageDTO = new PageDTO(Integer.parseInt(page),totalCnt,5);
//		//System.out.println(totalCnt);
		//System.out.println(page);
		PageDTO pageDTO = new PageDTO(Integer.parseInt(page), totalCnt , 5);

		//jsp에 넘겨줄 값
		req.setAttribute("pageOut", pageDTO);
		System.out.println(pageDTO);
		//end 페이지//
		
		req.getRequestDispatcher("board/boardList.tiles")//
		.forward(req, resp);
	}

}
