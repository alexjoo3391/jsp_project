<%@page import="dao.MemberDAO"%>
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
	String id = (String)session.getAttribute("loginOK");
	MemberDAO dao = new MemberDAO();
	int checkpoint = dao.getCheckpoint(id);
	int love = dao.getLove(id);
%>
<script>
	let checkpoint = sessionStorage.getItem("checkpoint") !== null ? sessionStorage.getItem("checkpoint") : [0, 1, 0, 0];
	checkpoint[2] = <%= checkpoint %>;
	checkpoint[3] = <%= love %>;
	sessionStorage.setItem("checkpoint", JSON.stringify(checkpoint));
	window.history.back();
</script>
</body>
</html>