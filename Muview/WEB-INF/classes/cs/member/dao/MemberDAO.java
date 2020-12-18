package cs.member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.sun.org.apache.bcel.internal.generic.RETURN;

import cs.board.dto.BoardDTO;
import cs.member.dto.MemberDTO;

public class MemberDAO {
	private DataSource ds;
	private static Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public MemberDAO() {
		try {
			Context initContext = new InitialContext();
			Context envContext = (Context) initContext.lookup("java:/comp/env");
			ds = (DataSource)envContext.lookup("jdbc/WEB");
			
		}catch (Exception e) {
			e.printStackTrace();
		}
	} //end DAO
	
	public void close() {
		try {
			if(con != null) {
				con.close();
				con=null;
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
	} //end close
	
	public boolean loginCheck(String id, String pwd) {
		boolean result = false;
		String sql ="SELECT * FROM MEMBER WHERE ID=? and PWD = ?";
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = true;
			}
			rs.close();
			pstmt.close();
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}return result;
	}//end loginCheck
	
	public boolean confirmId(String id) {
		boolean result = false;
		String sql = "select id from member where id=?";
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = true;
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {rs.close();}catch(SQLException s) {}
			try {pstmt.close();}catch(SQLException s) {}
			try {con.close();}catch(SQLException s) {}
		}
		return result; 
	}//end confirmId
	
	public boolean insert(MemberDTO dto) {
		String sql = "insert into member(id,pwd,name,email,joindate) values(?,?,?,?,SYSDATE)";
		boolean check = false;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
//			pstmt.setString(1, dto.getNo());
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPwd());
			pstmt.setString(3, dto.getName());
			pstmt.setString(4, dto.getEmail());
			
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
