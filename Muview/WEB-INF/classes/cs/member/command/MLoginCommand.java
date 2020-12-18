package cs.member.command;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cs.member.dao.MemberDAO;

public class MLoginCommand implements MCommand{
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		
		MemberDAO dao = new MemberDAO();
		boolean result = dao.loginCheck(id, pwd);
		
		if(result) {
			HttpSession session = request.getSession();
			session.setAttribute("id", id);
			session.setAttribute("pwd", pwd);
			String page = "/home.jsp";

			response.sendRedirect(request.getContextPath()+page);
			
		}else {
			System.out.println("실패");
			response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter(); 
            out.println("<script>alert('로그인 정보를 확인해주세요.'); history.go(-1);</script>");
            out.flush();
		}
		
	}
}