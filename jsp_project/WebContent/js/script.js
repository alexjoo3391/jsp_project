window.onload = () => {
    const body = document.querySelector('body');
	const event = document.createEvent('Event');
	event.initEvent('keydown', false, true);
	event.key = ' '; // 키 다운 이벤트 설정
    let profileImg = document.querySelector('.profile img');
    let profileTxt = document.querySelector('.profile p');
    let scriptTxt = document.querySelector('.text p')
    let str = document.querySelector('input#list').value // value에 값이 들어있는 input태그를 불러온다
    str = str.substring(1, str.length - 1).split(', '); // object타입으로 저장되서 양쪽에 붙어있는 '[',']'을 제거해서 리스트로 저장한다
	let checkpoint = [0, 1, 0, 0]; // 현재 에피소드, 현재 페이지, 잠금 해제 에피소드, 호감도
    let cnt = 1;
    let id = 0;
	
	if(sessionStorage.getItem('checkpoint')) { // 세션 아이템 확인
		checkpoint = JSON.parse(sessionStorage.getItem('checkpoint')); // 세션에 값이 있으면 변수에 저장 
	}
	
	id = checkpoint[0];
	cnt = checkpoint[1] - 1;
	
	if(id > 0) { // 세션에 값이 있어 에피소드가 달라지면 변수들 새로 설정
		document.querySelectorAll('.text-container').forEach(element => {
            element.style.display = 'none';
        });
        document.querySelector('.episode').style.display = 'none';
        document.querySelector('.episode-' + id).style.display = 'block';
		profileImg = document.querySelector('.profile-' + id + ' img');
        profileTxt = document.querySelector('.profile-' + id + ' p');
    	scriptTxt = document.querySelector('.text-' + id + ' p');
        str = document.querySelector('input#list-' + id).value;
        str = str.substring(1, str.length - 1).split(', ');
	}

    document.addEventListener("keydown", (e) => { // 키다운 이벤트 감지
        if(e.key === ' ') { // 입력한 키가 ' '거나 cnt가 리스트의 길이보다 작으면
			if(cnt === -1) { // 세션 값이 0이면 대기화면
				document.querySelectorAll('.text-container').forEach(element => {
                    element.style.display = 'none';
                });
                document.querySelector('.episode').style.display = 'block';
				body.style.backgroundImage = "url('resources/image/illustration/main.png')";
            } else if(str.length > cnt) {
                if(str[cnt][0] === "%") {
                    // 선택지 고르는 중 스페이스 이벤트를 흘리기 위한 if문
                } else if(str[cnt][0] === "$") { // 선택지가 나오는 부분('$'로 감싸둔 부분)을 if문을 사용해서 감지함
                    cnt++; 
                    while(true) {
                        if(str[cnt][0] === "$") break; // 선택지가 끝나는 부분을 감지해서 while문을 빠져나온다
                        let text = str[cnt].split(":"); 
                        scriptTxt.innerHTML += "<br><a class='option' data-option=" + text[1] + " >" + text[0] + "</a>";
                        cnt++; 
                    }
                    document.querySelectorAll('a.option').forEach(element => {
                        element.addEventListener("click", (e) => {
                        	// db에 저장하기 위해서 form태그 생성
                            let love = element.getAttribute("data-option");
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
                            cnt++;
							document.dispatchEvent(event);
                        })
                    })
                    cnt++;
                } else if(str[cnt][0] === ">") {  // 미니게임 부분
					document.querySelectorAll('.text-container').forEach(element => {
	                    element.style.display = 'none';
                	});
					document.querySelector('.minigame').style.display = 'block';
					if(sessionStorage.getItem('minigame') === 1) {
						sesisonStorage.setItem('minigame', 0);
						cnt += 2;
						document.dispatchEvent(event);
					}
				} else {
                    let text = str[cnt].split(":"); // 문장을 분해해서 변수에 저장
                    body.style.backgroundImage = "url('resources/image/illustration/" + text[0] + "')";
                    profileImg.src = "resources/image/illustration/" + (text[1] === "" ? "no_profile.png" : text[1]);
					profileTxt.innerHTML = text[2]; 
                    scriptTxt.innerHTML = text[3];
                    cnt++;

					checkpoint[1] = cnt;
					sessionStorage.setItem("checkpoint", JSON.stringify(checkpoint));
                }
            } else {
				checkpoint[1] = 0;
				sessionStorage.setItem("checkpoint", JSON.stringify(checkpoint));
                document.querySelectorAll('.text-container').forEach(element => {
                    element.style.display = 'none';
                });
                document.querySelector('.episode').style.display = 'block';
				body.style.backgroundImage = "url('resources/image/illustration/main.png')";
            }
        }
    });
    
	
	document.dispatchEvent(event);
	
    document.querySelectorAll('button.episode-link').forEach(element => {
        element.addEventListener("click", (e) => {
            id = element.getAttribute('data-id');

			checkpoint[0] = parseInt(id);
			checkpoint[1] = 1;
			sessionStorage.setItem("checkpoint", JSON.stringify(checkpoint));
			
            document.querySelector('.episode').style.display = 'none';
            document.querySelector('.episode-' + id).style.display = 'block';
            profileImg = document.querySelector('.profile-' + id + ' img');
            profileTxt = document.querySelector('.profile-' + id + ' p');
            scriptTxt = document.querySelector('.text-' + id + ' p');
            str = document.querySelector('input#list-' + id).value;
            str = str.substring(1, str.length - 1).split(', ');
            cnt = 0;

			console.log(id);
			if(id == 7) {
				console.log(id);
				let love = checkpoint[3];
				while(str.length > cnt) {
					if(str[cnt][0] == '#') {
						cnt++;
						if(str[cnt] < love) {
							console.log(str[cnt], cnt);
							break;
						}
					}
					cnt++;
				}
			} else {				
				document.dispatchEvent(event);
			}

        })	
    })
}
