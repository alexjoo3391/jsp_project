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
	BufferedReader reader = new BufferedReader(new FileReader(realPath + "test.txt")); // 파일 경로에 있는 텍스트 파일 가져오기
	ArrayList<String> list = new ArrayList<String>(); // 텍스트 파일 내용을 담을 변수 생성
	
	String str;
	while ((str = reader.readLine()) != null) {
		list.add(str); // 변수에 텍스트 파일 내용 담기
	}
	
	String[] text = list.get(0).split(":"); // 텍스트 파일의 첫번째 줄만 빼내서 분해한다
	// 
%>
<link rel="stylesheet" href="css/style.css">
<style>
	.text-container .profile p {
		background: url("resources/image/background/button_background.png") no-repeat;
	}
	
	body {
		background-repeat : no-repeat;
        background-size : cover;
	}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script type="text/javascript">
	window.onload = () => {
		const body = document.querySelector('body');
		let profileImg = document.querySelector('.profile img');
		let profileTxt = document.querySelector('.profile p');
		let scriptTxt = document.querySelector('.text p')
		let str = document.querySelector('input#list').value // value에 값이 들어있는 input태그를 불러온다
		let session = document.querySelector('input#session').value // value에 값이 들어있는 input태그를 불러온다
		str = str.substring(1, str.length - 1).split(', '); // object타입으로 저장되서 양쪽에 붙어있는 '[',']'을 제거해서 리스트로 저장한다
		let cnt = 1;
		let id = 1;
		document.addEventListener("keydown", (e) => { // 키다운 이벤트 감지
			if(e.key === ' ') { // 입력한 키가 ' '거나 cnt가 리스트의 길이보다 작으면
				if(str.length > cnt) {
					if(str[cnt][0] === "%") {
						// 선택지 고르는 중 스페이스 이벤트를 흘리기 위한 if문
					} else if(str[cnt][0] === "$") { // 선택지가 나오는 부분('$'로 감싸둔 부분)을 if문을 사용해서 감지함
						cnt++; 
						while(true) {
							if(str[cnt][0] === "$") break; // 선택지가 끝나는 부분을 감지해서 while문을 빠져나온다
							let text = str[cnt].split(":"); 
							document.querySelector('.text p').innerHTML += "<br><a class='option' data-option=" + text[1] + " >" + text[0] + "</a>";
							cnt++; 
						}
						document.querySelectorAll('a.option').forEach(element => {
							element.addEventListener("click", (e) => {
								let love = element.getAttribute("data-option");
								document.querySelector('.text p').innerHTML = love;
								let form = document.createElement('form');
								let input = document.createElement('input');
								form.setAttribute('action', '/DBUpdateLovePage.jsp');
								form.setAttribute('method', 'post');
								input.setAttribute('type', 'hidden');
								input.setAttribute('name', 'param');
								input.setAttribute('value', love);
								form.appendChild(input);
								body.appendChild(form);
								form.submit();
								console.log(form);
								cnt++;
							})
						})
						cnt++;
					} else {
						let text = str[cnt].split(":"); // 문장을 분해해서 변수에 저장
						body.style.backgroundImage = "resources/image/" + text[0];
						profileImg.src = "resources/image/" + text[1];
						profileTxt.innerHTML = text[2]; 
						scriptTxt.innerHTML = text[3];
						cnt++;
					}
				} else {
					document.querySelectorAll('.text-container').forEach(element => {
						element.style.display = 'none';
					});
					document.querySelector('.episode').style.display = 'block';
				}
			}
		});
		
		document.querySelectorAll('button.episode-link').forEach(element => {
			element.addEventListener("click", (e) => {
				id = element.getAttribute('data-id');
				document.querySelector('.episode').style.display = 'none';
				document.querySelector('.episode-' + id).style.display = 'block';
				console.log('.profile-' + id + ' img');
				profileImg = document.querySelector('.profile-' + id + ' img');
				profileTxt = document.querySelector('.profile-' + id + ' p');
				scriptTxt = document.querySelector('.text-' + id + ' p');
				str = document.querySelector('input#list-' + id).value;
				str = str.substring(1, str.length - 1).split(', ');
				cnt = 1;
			})	
		})
	}

</script>
</head>
<body style="background-image: url('resources/image/<%= text[0] %>');">
	<input id="session" type="hidden" value="<%= (String)session.getAttribute("loginOK") %>">
	<input id="list" type="hidden" value="<%= list %>">
	<div class="episode">
		<button class="episode-link" data-id="1">에피소드1</button>
		<button class="episode-link" data-id="2">에피소드2</button>
		<button class="episode-link" data-id="3">에피소드3</button>
		<button class="episode-link" data-id="4">에피소드4</button>
		<button class="episode-link" data-id="5">에피소드5</button>
		<button class="episode-link" data-id="6">에피소드6</button>
		<button class="episode-link" data-id="7">엔딩</button>
	</div>
    <div class="text-container">
        <div class="profile">
			<div class="img"><img src="resources/image/<%= text[1] %>"></div>
            <p><%= text[2] %></p>
        </div>
        <div class="text">
            <p><%= text[3] %></p>
        </div>
    </div>
    
   	<!-- 미니게임 도입부 -->
    <div class="minigame">
    	<h3>  
			어이어이, 기사 양반... 여기는 내 구역인데 어딜 마음대로 들어오려 하나- <br>
			나랑 게임을 하나 해서 이겨야 올라갈 수 있게 해주지 <br>
			여기 3개의 호두가 있는데... 속이 들어있는 호두가 뭘지 맞춰봐
		</h3>
		<form action="/minigamePage" method="post">
			<input type="text" name="input" placeholder="1, 2, 3 중에 하나를 입력해 주세요.">
			<input type="submit" value="결정">
		</form>
    </div>
	
<%
	for(int i = 1; i <= 1; i++) {
		realPath = application.getRealPath("/resources/"); 
		reader = new BufferedReader(new FileReader(realPath + "script" + i + ".txt"));
		list = new ArrayList<String>(); // 텍스트 파일 내용을 담을 변수 생성
		
		while ((str = reader.readLine()) != null) {
			list.add(str); // 변수에 텍스트 파일 내용 담기
		}
		
		text = list.get(0).split(":"); // 텍스트 파일의 첫번째 줄만 빼내서 분해한다
%>
	<input id="list-<%= i %>" type="hidden" value="<%= list %>">
	<div class="text-container episode-<%= i %>">
        <div class="profile profile-<%= i %>">
			<div class="img"><img src="resources/image/<%= text[1] %>"></div>
            <p><%= text[2] %></p>
        </div>
        <div class="text text-<%= i %>">
            <p><%= text[3] %></p>
        </div>
    </div>
<%
	}
%>

</body>
</html>