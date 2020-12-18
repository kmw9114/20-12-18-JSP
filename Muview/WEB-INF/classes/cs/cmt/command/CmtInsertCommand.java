package cs.cmt.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cs.board.dto.BoardDTO;
import cs.cmt.dao.CommentDAO;
import cs.cmt.dto.CommentDTO;

public class CmtInsertCommand implements CmtCommand{
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CommentDTO dto = new CommentDTO();
		String no = request.getParameter("no");
		HttpSession session = request.getSession();
		System.out.println(no);
		session.setAttribute("no", no);
		dto.setComment(request.getParameter("comment"));
		dto.setNo(request.getParameter("no"));
		
		CommentDAO dao = new CommentDAO();
		dao.insert(dto);
		
	}

	
}
