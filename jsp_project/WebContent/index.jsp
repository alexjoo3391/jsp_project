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
	body {
		background-image: url("resources/image/background/title_background.png");
		background-repeat : no-repeat;
        background-size : cover;
	}
	button {
		background: url("resources/image/background/startBtn_background.png") no-repeat;
		 background-size : cover;
		 background-position: center;
	}
</style>
</head>
<body>

	<%
		String id = (String)session.getAttribute("loginOK");
	
		if (id != null) {
	%>

	<!-- onclick : 원하는 페이지로 이동할 수 있는 속성 -->
	<button onclick="location='signoutPage.jsp'" id="spSignoutBtn">회원탈퇴</button>

	<button onclick="location='mainPage.jsp'" id="spStartBtn">게임 시작</button>
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