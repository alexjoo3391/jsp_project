<%@page import="dao.MemberDAO"%>
<%@page import="java.io.PrintWriter"%>
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
	String param = request.getParameter("param");
	String id = (String)session.getAttribute("loginOK");
	
	MemberDAO dao = new MemberDAO();
	int love = dao.getLove(id) + (Integer.parseInt(param));
	
	dao.updateLove(love, id);

%>

<script>
	sessionStorage.setItem("love", <%= love %>);
</script>

<%
	out.print("<script>window.history.back();</script>");
%>
</body>
</html>