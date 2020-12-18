package cs.board.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import cs.board.dto.BoardDTO;

public class BoardDAO {
	private DataSource ds;
	private static Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public BoardDAO() {
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
	
	public ArrayList<BoardDTO> list(){
		String sql = "SELECT * FROM BOARD order by no desc";
		
		ArrayList<BoardDTO> dtos = new ArrayList<BoardDTO>();
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				BoardDTO dto = new BoardDTO();
				dto.setNo(rs.getString("NO"));
				dto.setTitle(rs.getString("TITLE"));
				dto.setWriter(rs.getString("WRITER"));
				dto.setRegdate(rs.getDate("REGDATE"));
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
	
	//보드 상세 보기	
		public BoardDTO view(String no) {
			String sql ="select title, writer, content, regdate from board where no=?";
			BoardDTO dto = new BoardDTO();
			try {
				con = ds.getConnection();
				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(1, no);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {		//상세보기를 위한 한 레코드셋을 DTO에 저장
					dto.setNo(no);
					dto.setTitle(rs.getString("title"));
					dto.setWriter(rs.getString("writer"));
					dto.setContent(rs.getString("content"));
					dto.setRegdate(rs.getDate("regdate"));
				}
				
				rs.close();
				pstmt.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}finally {
				close();
			}
			return dto;	//DTO객체에 데이터를 담아서 반환
		}
		
	
	
	//보드 추가
	public boolean insert(BoardDTO dto) {
		String sql = "insert into board(no,title,writer,content,regdate) values(no.nextval,?,?,?,SYSDATE)";
		boolean check = false;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
//			pstmt.setString(1, dto.getNo());
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getWriter());
			pstmt.setString(3, dto.getContent());
			
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
	
	// 멤버 정보 수정하기	
		public boolean update(BoardDTO dto) {
			String sql = "update board set writer=?,title=?, content=?, regdate=? where no=?";
			boolean check = false;
			try {
				con = ds.getConnection();
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, dto.getWriter());
				pstmt.setString(2, dto.getTitle());
				pstmt.setString(3, dto.getContent());
				pstmt.setDate(4, dto.getRegdate());
				pstmt.setString(5, dto.getNo());
				
			
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
		}//end update
		
		// 멤버 삭제 하기		
		public boolean delete(String no) {
			String sql = "delete from board where no=?";
			boolean check = false;
			try {
				con = ds.getConnection();
				pstmt =con.prepareStatement(sql);
				pstmt.setString(1, no);
				
				int x = pstmt.executeUpdate();	
				System.out.println(x);
				if(x<1) {
					System.out.println("정상적으로 삭제되지 않았습니다.");
				}else {
					check=true;
				}
				pstmt.close();
			}catch(SQLException ex) {
				System.out.println("SQL insert 오류 : " + ex.getLocalizedMessage());
				check = false;
			}
			return check;
		}//delete
		
		public int getCount() {
			String sql = "SELECT COUNT(no) COUNT FROM BOARD";
			int count = 0;
			ArrayList<BoardDTO> dtos = new ArrayList<BoardDTO>();
			try {
				con = ds.getConnection();
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				if(rs.next())
					count = rs.getInt("count");
				
				rs.close();
				pstmt.close();
						
			}catch (Exception e) {
				e.printStackTrace();
			}finally {
				close();
			}
			return count;
		}//END GETCOUNT
		
		public ArrayList<BoardDTO> getListBoard(int page, int numOfRecords){
			String sql = "SELECT * FROM (SELECT ROWNUM NUM, L.* FROM (SELECT * FROM BOARD ORDER BY NO) L) WHERE NUM BETWEEN ? AND ?";
			
			ArrayList<BoardDTO> dtos = new ArrayList<BoardDTO>();
			try {
				con = ds.getConnection();
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, 1+(page-1)* numOfRecords);
				pstmt.setInt(2, page* numOfRecords);
				rs = pstmt.executeQuery();
				
				while (rs.next()) {
					String no = rs.getString("no");
					String title = rs.getString("title");
					String writer = rs.getString("writer");
					
					String regdate = rs.getString("regdate");
					
					BoardDTO dto = new BoardDTO();
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
		}//end getListBoard

}
