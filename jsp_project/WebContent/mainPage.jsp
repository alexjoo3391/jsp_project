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
		background: url("resources/image/background/button_background.png") no-repeat;
	}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script type="text/javascript" src="js/script.js"></script>
<%
	String realPath = application.getRealPath("/resources/"); // 파일 경로 가져오기
	BufferedReader reader = new BufferedReader(new FileReader(realPath + "test.txt")); // 파일 경로에 있는 텍스트 파일 가져오기
	ArrayList<String> list = new ArrayList<String>(); // 텍스트 파일 내용을 담을 변수 생성
	
	String str;
	while ((str = reader.readLine()) != null) {
		list.add(str); // 변수에 텍스트 파일 내용 담기
	}
	
	String[] text = list.get(0).split(":"); // 텍스트 파일의 첫번째 줄만 빼내서 분해한다
	
%>
</head>
<body>
	<input type="hidden" value="<%= list %>">
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