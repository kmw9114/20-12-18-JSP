package cs.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cs.member.command.MCommand;
import cs.member.command.MConfirmCommand;
import cs.member.command.MLoginCommand;
import cs.member.command.MLogoutCommand;
import cs.member.command.MRegisterCommand;


@WebServlet("*.mb")
public class memberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String viewPage = null;
		MCommand command = null;
		
		String uri = request.getRequestURI(); 
		String com = uri.substring(uri.lastIndexOf("/")+1, uri.lastIndexOf(".mb"));
		
		if(com !=null && com.trim().equals("login")) {
			command = new MLoginCommand();
			command.execute(request, response);
			viewPage = "/home.jsp";
		}else if(com != null && com.trim().equals("logout")) {
			command = new MLogoutCommand();
			command.execute(request, response);
			viewPage = "/home.jsp";
		}else if(com != null && com.trim().equals("confirmId")) {
			command = new MConfirmCommand();
			command.execute(request, response);
			viewPage = "/home.jsp";
		}else if(com != null && com.trim().equals("register")) {
			command = new MRegisterCommand();
			command.execute(request, response);
			viewPage = "/home.jsp";
		}
		
	//	RequestDispatcher rd = request.getRequestDispatcher(viewPage);
	//	rd.forward(request, response);
	}

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);

	}

}
