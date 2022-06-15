package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MemberDAO {

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	// 1. Sign in
	
	// 유저 정보를 삽입하는 메소드
	public int insertUser(String id, String pwd) {
		String sql = "INSERT INTO member VALUES(?, ?, ?, ?, ?, ?)";
		conn = JDBCUtil.getConnection();
		
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			pstmt.setInt(3, 0);
			pstmt.setString(4, null);
			pstmt.setInt(5, 0);
			pstmt.setInt(6, 0);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt);
		}
		
		return result;
	}
	
	// 2. Login
	
	// ID를 체크하는 메소드
	public boolean checkId(String id) {
		String sql = "SELECT id FROM member WHERE id=?";
		boolean result = false;
		
		conn = JDBCUtil.getConnection();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				result = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt, rs);
		}
		
		return result;
	}
	
	// 비밀번호를 체크하는 메소드
	public boolean checkPassword(String id, String pwd) {
		String sql = "SELECT password FROM member WHERE id=?";
		boolean result = false;
		
		conn = JDBCUtil.getConnection();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				if (pwd.equals(rs.getString("password"))) {
					result = true;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt, rs);
		}
		
		return result;
	}
	
	// 3. Password
	
	public String searchPwd(String id) {
		String sql = "SELECT password FROM member WHERE id=?";
		String pwd = null;
		
		conn = JDBCUtil.getConnection();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				pwd = rs.getString("password");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt, rs);
		}
		
		return pwd;
	}
	
	// 4. Sign out
	
	public int deleteUser(String id) {
		String sql = "DELETE FROM member WHERE id=?";
		int result = 0;
		
		System.out.println(id);
		conn = JDBCUtil.getConnection();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt);
		}
		
		return result;
	}
}