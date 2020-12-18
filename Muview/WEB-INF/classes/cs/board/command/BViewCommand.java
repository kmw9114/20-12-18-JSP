package cs.board.command;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cs.board.dao.BoardDAO;
import cs.board.dto.BoardDTO;
import cs.cmt.dao.CommentDAO;
import cs.cmt.dto.CommentDTO;


public class BViewCommand implements BCommand{
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		CommentDAO daos = new CommentDAO();
		String no = request.getParameter("no");//링크가 걸려있는 id를 클릭하면 매개변수로 전달 받음
		ArrayList<CommentDTO> dtos = daos.list(no);
		
		BoardDAO dao = new BoardDAO();

		BoardDTO dto = dao.view(no);	//상세보기를 위해 선택한 id로 DB에서 데이터 추출하여 DTO에 담는다.
		request.setAttribute("dtoss", dtos);
		request.setAttribute("dto", dto);//DTO를 view에서 데이터를 접근할 수 있도록 Request scope에 저장
	}

}
