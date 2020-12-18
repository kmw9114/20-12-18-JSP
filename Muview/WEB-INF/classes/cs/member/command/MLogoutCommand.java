package cs.member.command;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MLogoutCommand implements MCommand{
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		session.getAttribute("id");
		session.invalidate();
		
		String page = "home.jsp";
		//response.sendRedirect(request.getContentType()+page);
		
		RequestDispatcher rd = request.getRequestDispatcher(page);
		rd.forward(request, response);
	}
}