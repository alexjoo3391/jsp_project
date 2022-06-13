<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>남주의 복지를 책임지겠습니다</title>
</head>
<body>

	<input type="text" name="input" placeholder="가위, 바위, 보 중에 하나를 입력해 주세요.">
	
	<%
		Random random = new Random();
		String[] result = {"가위", "바위", "보"};
	
		String comRs = result[random.nextInt(3)];
		String playerRs = request.getParameter("input");
		
		switch (comRs) {
			case "가위":
				switch (playerRs) {
					case "가위":
						System.out.println("비겼습니다.");
					case "바위":
						System.out.println("이겼습니다.");
					case "보":
						System.out.println("졌습니다.");
				}
			case "바위":
				switch (playerRs) {
					case "가위":
						System.out.println("졌습니다.");
					case "바위":
						System.out.println("비겼습니다.");
					case "보":
						System.out.println("이겼습니다.");
			}
			case "보":
				switch (playerRs) {
					case "가위":
						System.out.println("이겼습니다.");
					case "바위":
						System.out.println("졌습니다.");
					case "보":
						System.out.println("비겼습니다.");
			}
		}
	%>
	
</body>
</html>