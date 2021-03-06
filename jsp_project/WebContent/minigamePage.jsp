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
		background-repeat : no-repeat;
        background-size : cover;
        overflow:hidden;
        height: 100vh;
        width: 100vw;
	}
	
	.win {
		width: 100vw;
        height: 100vh;
		background-image: url("resources/image/background/minigame_win_background.png");
		background-repeat : no-repeat;
        background-size : cover;
	}
	.lose {
		width: 100vw;
        height: 100vh;
		background-image: url("resources/image/background/minigame_lose_background.png");
		background-repeat : no-repeat;
        background-size : cover;
	}
	button {
		background: url("resources/image/background/subBtn_background.png") no-repeat;
		background-size : cover;
	}
</style>
</head>

<body>

	<%
		boolean resultOK = (boolean) session.getAttribute("resultOK");

		if (resultOK) {
	%>
	
	<div>
		<img src="resources/image/background/minigame_win_background.png" class="win">
		<h3>
			!!! <br>
			이걸 어떻게 맞췄지!!! <br> 
			난 정정당당한 다람쥐, 좋아 올라가게 해주지 <br>
			그리고... 같은 사나이로써 한 마디 당부하지 <br>
			그녀의 얼굴에서 미소가 떠나는 날이 없도록 그녀를 잘 보살펴주도록 해... <br>
			아디오스-
		</h3>
		<button onclick="next()" class="nextBtn">다음으로</button>
	</div>
	
	<%
		} else if (!resultOK) {
	%>
	
	<div>
		<img src="resources/image/background/minigame_lose_background.png" class="lose">
		<h3>
			풉, 아 미안. <br>
			난 정중한 다람쥐- 웃으면 안됐었는데 미안하게 됐소. <br>
			하지만 승부는『정정당당』한 것. 깔끔하게 패배를 인정하도록 해. <br>
			그리고... 같은 사나이로써 한 마디 당부하지 <br>
			그렇게 형편없는 실력으로 그녀를 지켜줄 수 있을 거라고 생각하나? <br>
			너 같이 나약한 놈은 그녀에게 보내줄 수 없으니 실력을 더 키워오도록 해. <br>
			아디오스-
		</h3>
		<button onclick="window.history.back()" class="nextBtn">다시하기</button>
	</div>

	<%
		}
	%>

<script>
	function next() {
		sessionStorage.setItem("minigame", 1);
		window.history.back();
	}

</script>
</body>
</html>