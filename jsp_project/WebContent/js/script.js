window.onload = () => {
	let str = document.querySelector('input[type=hidden]').value // value에 값이 들어있는 input태그를 불러온다
	str = str.substring(1, str.length - 1).split(', '); // object타입으로 저장되서 양쪽에 붙어있는 '[',']'을 제거해서 리스트로 저장한다
	let cnt = 1;
	document.addEventListener("keydown", (e) => { // 키다운 이벤트 감지
		if(e.key === ' ' && str.length > cnt) { // 입력한 키가 ' '거나 cnt가 리스트의 길이보다 작으면
			let text = str[cnt].split(":"); // 문장을 분해해서 변수에 저장
			document.querySelector('.profile img').src = "resources/image/" + text[0];
			document.querySelector('.profile p').innerText = text[1]; 
			document.querySelector('.text p').innerText = text[2];
			cnt++;
		}
	});
}