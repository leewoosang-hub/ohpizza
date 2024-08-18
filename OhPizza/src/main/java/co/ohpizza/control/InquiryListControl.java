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

public class InquiryListControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession(false);
		String id = (String) session.getAttribute("logId");
		
		//페이지 계산 기능
		BoardService boardService = new BoardServiceImpl();
		String page = req.getParameter("page");
		page = page == null ? "1" : page;
		int totalCnt = boardService.inquirypage(id);
		PageDTO pageDTO = new PageDTO(Integer.parseInt(page), totalCnt, 5);	
		System.out.println(page);
		
		//리스트
		List<BoardVO> inquiryList = boardService.inquiryList(page,id);
		
		req.setAttribute("inquiryList", inquiryList);
		req.setAttribute("paging", pageDTO);
		
		req.getRequestDispatcher("user/inquiryList.tiles").forward(req, resp);

	}

}
