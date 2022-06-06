<%@page import="javax.swing.JFileChooser"%>
<%@page import="java.nio.file.Files"%>
<%@page import="java.nio.file.Paths"%>
<%@page import="java.nio.file.Path"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="lib/style.css">
<script type="text/javascript" src="lib/script.js"></script>
<%
	String realPath = application.getRealPath("/WEB-INF/lib/test.txt");
	System.out.print(realPath + "\n");
	BufferedReader reader = new BufferedReader(new FileReader(realPath));
	ArrayList<String> list = new ArrayList<String>();
	
	String str;
	while ((str = reader.readLine()) != null) {
		list.add(str);
	}
	System.out.print(list);
%>
</head>
<body>
	<input type="hidden" value="<%= list %>">
    <div class="container">
        <div class="profile">
            <img src="" alt="">
            <p></p>
        </div>
        <div class="text">
            <p>test</p>
        </div>
    </div>
</body>
</html>