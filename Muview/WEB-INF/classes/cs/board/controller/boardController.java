package cs.board.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cs.board.command.BCommand;
import cs.board.command.BDeleteCommand;
import cs.board.command.BInsertCommand;
import cs.board.command.BListCommand;
import cs.board.command.BUpdateCommand;
import cs.board.command.BViewCommand;

/**
 * Servlet implementation class boardController
 */
@WebServlet("*.do")
public class boardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
		
	protected void  doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String viewPage = null;
		BCommand command = null;
		
		String uri = request.getRequestURI(); //uri :/board/list.do
		String com = uri.substring(uri.lastIndexOf("/")+1, uri.lastIndexOf(".do"));
		

		if(com !=null && com.trim().equals("list")) {
			command = new BListCommand();
			command.execute(request, response);
			viewPage = "/WEB-INF/view/bList.jsp";
		}else if(com !=null && com.trim().equals("list2")) {
			command = new BListCommand();
			command.execute(request, response);
			viewPage = "/WEB-INF/view/about.jsp";
		}else if(com !=null && com.trim().equals("insertForm")) {
			viewPage = "/WEB-INF/view/bInsertForm.jsp";
			
		}else if(com !=null && com.trim().equals("aboutForm")) {
			viewPage = "/WEB-INF/view/aInsertForm.jsp";
		}else if(com !=null && com.trim().equals("insert")) {
			command = new BInsertCommand();
			command.execute(request, response);
			viewPage ="/WEB-INF/view/list.do";
		}else if(com !=null && com.trim().equals("insert2")) {
			command = new BInsertCommand();
			command.execute(request, response);
			viewPage ="/WEB-INF/view/list2.do";
		}else if(com !=null && com.trim().equals("view")) {
			command = new BViewCommand();
			command.execute(request, response);
			viewPage = "/WEB-INF/view/bView.jsp";
		}else if(com !=null && com.trim().equals("view2")) {
			command = new BViewCommand();
			command.execute(request, response);
			viewPage = "/WEB-INF/view/aView.jsp";
		}else if(com !=null && com.trim().equals("update")){
			command = new BUpdateCommand();
			command.execute(request, response);
			viewPage = "/WEB-INF/view/list.do";
		}else if(com !=null && com.trim().equals("update2")){
			command = new BUpdateCommand();
			command.execute(request, response);
			viewPage = "/WEB-INF/view/list2.do";
		}else if(com !=null && com.trim().equals("delete")){
			command = new BDeleteCommand();
			command.execute(request, response);
			viewPage = "/WEB-INF/view/list.do";
		}else if(com !=null && com.trim().equals("delete2")){
			command = new BDeleteCommand();
			command.execute(request, response);
			viewPage = "/WEB-INF/view/list2.do";
		}else if(com !=null && com.trim().equals("useUpdate")){
			command = new BViewCommand();
			command.execute(request, response);
			viewPage = "/WEB-INF/view/aUpdate.jsp";
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
