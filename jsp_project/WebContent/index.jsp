<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>남주의 복지를 책임지겠습니다</title>
<!-- 외부에 있는 CSS 파일 불러오기 -->
<link rel="stylesheet" type="text/css" href="css/style.css">
<style>
	button {
		background: url("resources/image/button_background.png") no-repeat;
	}
</style>
</head>
<body>

	<%
		String id = (String)session.getAttribute("loginOK");
	
		if (id != null) {
	%>

<!-- onclick : 원하는 페이지로 이동할 수 있는 속성 -->
<button id="spStartBtn">게임 시작</button>
<form action="/logoutPage" method="post">
	<button id="spLogoutBtn">로그아웃</button>
</form>

	<%
		} else {
	%>
	
<button onclick="location='loginPage.jsp'" id="spLoginBtn">로그인</button>
<button onclick="location='joinPage.jsp'" id="spJoinBtn">회원가입</button>

	<%
		}
	%>
	
</body>
</html>