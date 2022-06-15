<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="dao.JDBCUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String column = request.getParameter("column");
	String param = request.getParameter("param");
	String id = (String)session.getAttribute("loginOK");
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String sql = "update member set ?=? where id=?";
	int result = 0;
	
	conn = JDBCUtil.getConnection();
	
	try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, column);
		pstmt.setString(2, param);
		pstmt.setString(3, id);
		result = pstmt.executeUpdate();
	} catch (SQLException e) {
		e.printStackTrace();
	} finally {
		JDBCUtil.close(conn, pstmt);
	}
%>
</body>
</html>