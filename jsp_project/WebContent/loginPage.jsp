<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>남주의 복지를 책임지겠습니다</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<style>
	body {
		background-image: url("resources/image/background/login_background.png");
		background-repeat : no-repeat;
        background-size : cover;
	}
	.backBtn {
		background: url("resources/image/background/backBtn_background.png") no-repeat;
	}
	.submitBtn {
		background: url("resources/image/background/subBtn_background.png") no-repeat;
	}
	#lpPasswordBtn {
		background: url("resources/image/background/pwdBtn_background.png") no-repeat;
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
<button onclick="location='passwordPage.jsp'" id="lpPasswordBtn">비밀번호 찾기</button>

</body>
</html>