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
		background-image: url("resources/image/background/password_background.png");
		background-repeat : no-repeat;
        background-size : cover;
	}
	.backBtn {
		background: url("resources/image/background/backBtn_background.png") no-repeat;
	}
	.submitBtn {
		background: url("resources/image/background/pwdBtn_background.png") no-repeat;
	}
</style>
</head>
<body>

<button onclick="location='loginPage.jsp'" class="backBtn"></button>

<form action="/passwordPage" method="post">
	<input type="text" name="id" placeholder=" ID를 입력해 주세요." id="ppIdTextbox"> <br>
	<input type="submit" value="비밀번호 찾기" class="submitBtn" id="ppSearchBtn">
</form>

</body>
</html>