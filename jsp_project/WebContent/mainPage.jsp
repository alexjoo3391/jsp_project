<%@page import="dao.MemberDAO"%>
<%@page import="dao.JDBCUtil"%>
<%@page import="javax.swing.JFileChooser"%>
<%@page import="java.nio.file.Files"%>
<%@page import="java.nio.file.Paths"%>
<%@page import="java.nio.file.Path"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>남주의 복지를 책임지겠습니다</title>
<%
	String realPath = application.getRealPath("/resources/"); // 파일 경로 가져오기
	BufferedReader reader = new BufferedReader(new FileReader(realPath + "script0.txt")); // 파일 경로에 있는 텍스트 파일 가져오기
	ArrayList<String> list = new ArrayList<String>(); // 텍스트 파일 내용을 담을 변수 생성
	
	String str;
	while ((str = reader.readLine()) != null) {
		list.add(str); // 변수에 텍스트 파일 내용 담기
	}

%>
<link rel="stylesheet" href="css/style.css">
<style>
	body {
		background-repeat : no-repeat;
        background-size : cover;
	}
	
	button {
		background: url("resources/image/background/startBtn_background.png") no-repeat;
		background-size : cover;
	}
	.text2 {
		position: absolute;
    	top: 0;
    	left: 18%;
	}
	.minigame_img {
		width: 100vw;
		height: 100vh;
	}
	.submitBtn {
		background: url("resources/image/background/subBtn_background.png") no-repeat;
		background-size : cover;
	}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script type="text/javascript" src="js/script.js"></script>
</head>
<body>
	<input id="session" type="hidden" value="<%= (String)session.getAttribute("loginOK") %>">
	<input id="list" type="hidden" value="<%= list %>">
	<div class="episode">
		<button class="episode-link" id="ep1Btn" data-id="1">에피소드1</button>
		<button class="episode-link" id="ep2Btn" data-id="2">에피소드2</button>
		<button class="episode-link" id="ep3Btn" data-id="3">에피소드3</button>
		<button class="episode-link" id="ep4Btn" data-id="4">에피소드4</button>
		<button class="episode-link" id="ep5Btn" data-id="5">에피소드5</button>
		<button class="episode-link" id="ep6Btn" data-id="6">에피소드6</button>
		<button class="episode-link" id="endingBtn" data-id="7">엔딩</button>
	</div>
    <div class="text-container">
        <div class="profile">
			<div class="img"><img src=""></div>
            <p></p>
        </div>
        <div class="text">
            <p></p>
        </div>
    </div>
    
   	<!-- 미니게임 도입부 -->
    <div class="minigame">
    	<img src="resources/image/background/minigame_start_2_background.png" class="minigame_img">
    	<h3>  
			어이어이, 기사 양반... 여기는 내 구역인데 어딜 마음대로 들어오려 하나- <br>
			나랑 게임을 하나 해서 이겨야 올라갈 수 있게 해주지 <br>
			여기 3개의 호두가 있는데... 속이 들어있는 호두가 뭘지 맞춰봐
		</h3>
		<form action="/minigamePage" method="post">
			<input type="text" name="input" placeholder="1, 2, 3 중에 하나를 입력해 주세요." id="inputTextbox">
			<input type="submit" value="결정" id="okBtn" class="submitBtn">
		</form>
    </div>
	
<%
	for(int i = 1; i <= 7; i++) { 
		reader = new BufferedReader(new FileReader(realPath + "script" + i + ".txt"));
		list = new ArrayList<String>(); // 텍스트 파일 내용을 담을 변수 생성
		
		while ((str = reader.readLine()) != null) {
			list.add(str); // 변수에 텍스트 파일 내용 담기
		}
%>
	<input id="list-<%= i %>" type="hidden" value="<%= list %>">
	<div class="text-container episode-<%= i %>">
        <div class="profile profile-<%= i %>">
			<div class="img"><img src=""></div>
            <p></p>
        </div>
        <div class="text text-<%= i %>">
            <p class="text2"></p>
        </div>
    </div>
<%
	}
%>

</body>
</html>