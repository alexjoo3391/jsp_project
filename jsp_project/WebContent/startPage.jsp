<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 외부에 있는 CSS 파일 불러오기 -->
<link rel="stylesheet" type="text/css" href="lib/style.css">
<style>
	.bold {
		background: url("lib/image/button_background.png") no-repeat;
	}
</style>
</head>
<body>

	<%
		String id = (String)session.getAttribute("loginOK");
	
		if (id != null) {
	%>

<!-- onclick : 원하는 페이지로 이동할 수 있는 속성 -->
<button class="bold">게임 시작</button>
<button class="bold">로그아웃</button>

	<%
		} else {
	%>
	
<button onclick="location='loginPage.jsp'" class="bold">로그인</button>
<button onclick="location='joinPage.jsp'" class="bold">회원가입</button>

	<%
		}
	%>
	
</body>
</html>