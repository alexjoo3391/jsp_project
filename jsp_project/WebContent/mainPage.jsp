<%@page import="java.nio.file.Files"%>
<%@page import="java.nio.file.Paths"%>
<%@page import="java.nio.file.Path"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="lib/style.css">
<script src="lib/script.js"></script>
<%
	Path currentPath = Paths.get("");
	String path = currentPath.toAbsolutePath().toString();
	System.out.println("현재 작업 경로: " + path);


	BufferedReader reader = new BufferedReader(new FileReader("./lib/script.txt"));
	ArrayList<String> list = new ArrayList<String>();
	
	String str;
	while ((str = reader.readLine()) != null) {
		list.add("str");
	}
%>
</head>
<body>
	<input type="hidden" value=<%= str %>>
    <div class="container">
        <div class="profile">
            <img src="" alt="">
            <p></p>
        </div>
        <div class="text">
            <p></p>
        </div>
    </div>
</body>
</html>