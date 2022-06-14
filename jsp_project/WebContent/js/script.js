window.onload = () => {
	let str = document.querySelector('input[type=hidden]').value // value에 값이 들어있는 input태그를 불러온다
	str = str.substring(1, str.length - 1).split(', '); // object타입으로 저장되서 양쪽에 붙어있는 '[',']'을 제거해서 리스트로 저장한다
	let cnt = 1;
	document.addEventListener("keydown", (e) => { // 키다운 이벤트 감지
		if(e.key === ' ' && str.length > cnt) { // 입력한 키가 ' '거나 cnt가 리스트의 길이보다 작으면
			console.log(str[cnt]);
			if(str[cnt][0] === "%") {
				// 선택지 고르는 중 스페이스 이벤트를 흘리기 위한 if문
			} else if(str[cnt][0] === "$") { // 선택지가 나오는 부분('$'로 감싸둔 부분)을 if문을 사용해서 감지함
				cnt++; 
				while(true) {
					if(str[cnt][0] === "$") break; // 선택지가 끝나는 부분을 감지해서 while문을 빠져나온다
					let text = str[cnt].split(":"); 
					document.querySelector('.text p').innerHTML += "<br><a href='#none' value=" + text[1] + " >" + text[0] + "</a>";
					cnt++; 
				}
				document.querySelectorAll('a').forEach(element => {
					element.addEventListener("click", (e) => {
						document.querySelector('.text p').innerHTML = element.getAttribute("value");
						cnt++;
					})
				})
				cnt++;
			} else {
				let text = str[cnt].split(":"); // 문장을 분해해서 변수에 저장
				document.querySelector('body').style.backgroundImage = "resources/image/" + text[0];
				document.querySelector('.profile img').src = "resources/image/" + text[1];
				document.querySelector('.profile p').innerHTML = text[2]; 
				document.querySelector('.text p').innerHTML = text[3];
				cnt++;
			}
		}
	});
}