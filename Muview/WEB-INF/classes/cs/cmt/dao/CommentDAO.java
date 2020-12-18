package cs.cmt.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import cs.board.dto.BoardDTO;
import cs.cmt.dto.CommentDTO;

public class CommentDAO {
	private DataSource ds;
	private static Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public CommentDAO() {
		try {
			Context initContext = new InitialContext();
			Context envContext = (Context) initContext.lookup("java:/comp/env");
			ds = (DataSource)envContext.lookup("jdbc/WEB");
			
		}catch (Exception e) {
			e.printStackTrace();
		}
	}//end BoardDAO()
	
	public void close() {
		try {
			if(con != null) {
				con.close();
				con=null;
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
	}//end close()
	
	public ArrayList<CommentDTO> list(String no){
		String sql = "SELECT * FROM bcomment where no=? order by commentdate desc";
		
		ArrayList<CommentDTO> dtos = new ArrayList<CommentDTO>();
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, no);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				CommentDTO dto = new CommentDTO();

				dto.setCmtDate(rs.getDate("commentdate"));
				dto.setComment(rs.getString("cmt"));
				dto.setNo(rs.getString("no"));
				dtos.add(dto);
			}
			rs.close();
			pstmt.close();
					
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		
		return dtos;
	}//end list
	
	public boolean insert(CommentDTO dto) {
		String sql = "insert into bcomment(commentdate,cmt, NO) values(SYSDATE,?,?)";
		boolean check = false;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
						
			pstmt.setString(1, dto.getComment());
			pstmt.setString(2, dto.getNo());
			int x = pstmt.executeUpdate();
			
			if(x<1) {
				System.out.println("정상적으로 저장되지 않았습니다.");
			}else {
				check=true;
			}
			pstmt.close();
		}catch(SQLException ex) {
			System.out.println("SQL insert 오류 : " + ex.getLocalizedMessage());
			check = false;
		}
		return check;
	}//end insert
	
}
