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
<title>남주의 복지를 책임지겠습니다</title>
<link rel="stylesheet" href="css/style.css">
<style>
	.text-container .profile p {
		background: url("resources/image/button_background.png") no-repeat;
	}
</style>
<script type="text/javascript" src="js/script.js"></script>
<%
	String realPath = application.getRealPath("/resources/");
	System.out.print(realPath + "\n");
	BufferedReader reader = new BufferedReader(new FileReader(realPath + "test.txt"));
	ArrayList<String> list = new ArrayList<String>();
	
	String str;
	while ((str = reader.readLine()) != null) {
		list.add(str);
	}
	System.out.print(list);
	
	String[] text = list.get(0).split(":");
	
%>
</head>
<body>
	<input type="hidden" value="<%= list %>">
	<div class="background">
		<img alt="" src="">
	</div>
    <div class="text-container">
        <div class="profile">
			<div class="img"><img src="resources/image/<%= text[0] %>"></div>
            <p><%= text[1] %></p>
        </div>
        <div class="text">
            <p><%= text[2] %></p>
        </div>
    </div>
</body>
</html>