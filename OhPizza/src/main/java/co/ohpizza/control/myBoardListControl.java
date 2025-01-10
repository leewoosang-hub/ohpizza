package co.ohpizza.control;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;

import co.ohpizza.common.Control;
import co.ohpizza.service.BoardService;
import co.ohpizza.service.BoardServiceImpl;
import co.ohpizza.vo.BoardVO;

public class myBoardListControl implements Control {
	@Override
	@ResponseBody
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession(false);
		resp.setContentType("application/json;charset=UTF-8");
		
		String id = (String) session.getAttribute("logId");
		
		String page = req.getParameter("page");
		page = page == null ? "1" : page;
		
		BoardService myBoardList = new BoardServiceImpl();
		
		List<BoardVO> board = myBoardList.myBoardList(id);
		
		 Map<String, Object> responseMap = new HashMap<>();
		 responseMap.put("myBoardList", board);
		
		 ObjectMapper mapper = new ObjectMapper();
		 String jsonResponse = mapper.writeValueAsString(responseMap);
		 resp.getWriter().write(jsonResponse);
	}
	
}
