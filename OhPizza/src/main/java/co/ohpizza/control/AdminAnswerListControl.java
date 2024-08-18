package co.ohpizza.control;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.ohpizza.common.Control;
import co.ohpizza.common.PageDTO;
import co.ohpizza.service.BoardService;
import co.ohpizza.service.BoardServiceImpl;
import co.ohpizza.vo.BoardVO;

public class AdminAnswerListControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String page = req.getParameter("pageNum");
		page = page == null ? "1" : page;
		BoardService boardservice = new BoardServiceImpl();
		List<BoardVO> boardvo = boardservice.adminAnswerList(page);
		req.setAttribute("adminAnswerList", boardvo);
		
		int totalCnt = boardservice.totalCntTypeC();
		PageDTO pageDTO = new PageDTO(Integer.parseInt(page), totalCnt, 5);
		req.setAttribute("paging", pageDTO);

		req.getRequestDispatcher("admin/adminAnswerList.tiles")//
		.forward(req, resp);
	}

}
