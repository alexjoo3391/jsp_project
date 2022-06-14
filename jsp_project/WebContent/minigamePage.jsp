<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>남주의 복지를 책임지겠습니다</title>
<link rel="stylesheet" href="css/style.css">
<style>
</style>
</head>
<body>
	
<form action="/minigamePage" method="get">
	<h3>  
		어이어이, 기사 양반... 여기는 내 구역인데 어딜 마음대로 들어오려 하나- <br>
		나랑 게임을 하나 해서 이겨야 올라갈 수 있게 해주지 <br>
		여기 3개의 호두가 있는데... 속이 들어있는 호두가 뭘지 맞춰봐
	</h3>
	<input type="text" name="input" placeholder="1, 2, 3 중에 하나를 입력해 주세요.">
	<input type="submit" value="결정">
</form>
	
	<%
		boolean resultOK = (boolean)session.getAttribute("resultOK");
	
		if (resultOK) {
	%>
	
	<h3>
		!!! <br>
		이걸 어떻게 맞췄지!!! <br>
		난 정정당당한 다람쥐, 좋아 올라가게 해주지 <br>
		그리고... 같은 사나이로써 한 마디 해주겠다  <br>
		그녀의 얼굴에서 미소가 떠나는 날이 없도록 그녀를 잘 보살펴주도록 해... <br>
		아디오스-
	</h3>
	
	<%
		} else {
	%>
	
	<h3>
		풉, 아 미안. <br>
		난 정중한 다람쥐- 웃으면 안됐었는데 미안하게 됐소. <br>
		하지만 승부는 정정당당한 것. 깔끔하게 패배를 인정하도록 해. <br>
		그리고... 같은 사나이로써 한 마디 해주겠다  <br>
		그렇게 형편없는 실력으로 그녀를 지켜줄 수 있을 거라고 생각하나? <br>
		너 같이 나약한 놈은 그녀에게 보내줄 수 없으니 실력을 더 키워오도록 해. <br>
		아디오스-
	</h3>

	<%
		}
	%>
	
</body>
</html>