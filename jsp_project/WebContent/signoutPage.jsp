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
		background: url("resources/image/joinBackground.png");
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

<button onclick="location='index.jsp'" class="backBtn"></button>

<form action="/signoutPage" method="post">
	<input type="text" name="id" placeholder=" ID를 입력해 주세요." id="lpIdTextbox"> <br>
	<input type="password" name="password" placeholder=" 비밀번호를 입력해 주세요." id="lpPwdTextbox"> <br>
	<input type="submit" value="탈퇴하기" class="submitBtn" id="lpLoginBtn">
</form>

</body>
</html>