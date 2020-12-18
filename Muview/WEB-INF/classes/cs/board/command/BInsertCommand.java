package cs.board.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cs.board.dao.BoardDAO;
import cs.board.dto.BoardDTO;

public class BInsertCommand implements BCommand{
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		BoardDTO dto = new BoardDTO();
		
		dto.setNo(request.getParameter("no"));
		dto.setTitle(request.getParameter("title"));
		dto.setWriter(request.getParameter("writer"));
		dto.setContent(request.getParameter("content"));
		
		BoardDAO dao = new BoardDAO();
		dao.insert(dto);
		
	}
}
