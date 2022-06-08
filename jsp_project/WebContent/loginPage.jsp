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
	.backBtn {
		background: url("lib/image/backBtn_background.png") no-repeat;
	}
	.submitBtn {
		background: url("lib/image/button_background.png") no-repeat;
	}
</style>
</head>
<body>

<button onclick="location='index.jsp'" class="backBtn"></button>

<form action="/loginPage" method="post">
	<input type="text" name="id" placeholder=" ID를 입력해 주세요." id="lpIdTextbox"> <br>
	<input type="password" name="password" placeholder=" 비밀번호를 입력해 주세요." id="lpPwdTextbox"> <br>
	<input type="submit" value="로그인" class="submitBtn" id="lpLoginBtn">
</form>

</body>
</html>