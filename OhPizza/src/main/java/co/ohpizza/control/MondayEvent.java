package co.ohpizza.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.ohpizza.common.Control;

public class MondayEvent implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		req.getRequestDispatcher("event/MondayEvent.tiles").forward(req, resp);

	}

}
