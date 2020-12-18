package cs.member.command;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cs.member.dao.MemberDAO;

public class MConfirmCommand implements MCommand {
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		System.out.println(id);
		
		MemberDAO dao = new MemberDAO();
		boolean result = dao.confirmId(id);
		String page = "mHome.jsp";
		if(result) {
			response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter(); 
            out.println("<center>");
            out.println("<br/>");
            out.println("<h4>사용할 수 없는ID 입니다!</h4>");
            out.println("<br/><input type='button' value='확인' onClick='window.close()'>");
            out.println("</center>");
            out.flush();
		}else {
			response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<center>");
            out.println("<br/>");
            out.println("<h4>사용 가능한 ID 입니다!</h4>");
            out.println("<br/><input type='button' value='확인' onClick='window.close()'>");
            out.println("</center>");
           
            out.flush();
		}
	}
}
