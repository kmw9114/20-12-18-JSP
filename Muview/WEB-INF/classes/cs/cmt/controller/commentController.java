package cs.cmt.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cs.cmt.command.CmtCommand;
import cs.cmt.command.CmtInsertCommand;
import cs.member.command.MCommand;

/**
 * Servlet implementation class commentController
 */
@WebServlet("*.cmt")
public class commentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String viewPage = null;
		CmtCommand command = null;
		
		String uri = request.getRequestURI(); 
		String com = uri.substring(uri.lastIndexOf("/")+1, uri.lastIndexOf(".cmt"));
		
		if(com !=null && com.trim().equals("comment")) {
			command = new CmtInsertCommand();
			command.execute(request, response);
			viewPage = "view2.do";
		}
	
	
		RequestDispatcher rd = request.getRequestDispatcher(viewPage);
		rd.forward(request, response);
	}


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}

}
