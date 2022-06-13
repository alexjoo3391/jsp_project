<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>남주의 복지를 책임지겠습니다</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
<style>
	body {
		background: url("resources/image/signoutBackground.png");
		background-repeat : no-repeat;
        background-size : cover;
	}
	.backBtn {
		background: url("resources/image/backBtn_background.png") no-repeat;
	}
	.submitBtn {
		background: url("resources/image/button_background.png") no-repeat;
	}
</style>
</head>
<body>

<%
	String id = (String)session.getAttribute("loginOK");
%>

현재 로그인 된 계정의 ID는 '<b><%= id %></b>'입니다. <br>
탈퇴를 진행하시겠습니까?
<form action="/signoutPage" method="post">
	<input type="submit" value="예" class="submitBtn" id="lpLoginBtn">
</form>
<button onclick="location='index.jsp'">아니오</button>

</body>
</html>