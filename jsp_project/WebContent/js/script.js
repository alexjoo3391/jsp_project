window.onload = () => {
    const body = document.querySelector('body');
    let profileImg = document.querySelector('.profile img');
    let profileTxt = document.querySelector('.profile p');
    let scriptTxt = document.querySelector('.text p')
    let str = document.querySelector('input#list').value // value에 값이 들어있는 input태그를 불러온다
    str = str.substring(1, str.length - 1).split(', '); // object타입으로 저장되서 양쪽에 붙어있는 '[',']'을 제거해서 리스트로 저장한다
	let checkpoint = [0, 1];
    let cnt = 1;
    let id = 1;
	
	if(sessionStorage.getItem('checkpoint')) {
		checkpoint = JSON.parse(sessionStorage.getItem('checkpoint'));
	}
	
	console.log(JSON.parse(sessionStorage.getItem('checkpoint')));
	
	id = checkpoint[0];
	cnt = checkpoint[1];
	console.log(cnt);
	if(id > 0) {
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
            if(str.length > cnt) {
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
                        })
                    })
                    cnt++;
                } else if(str[cnt][0] === ">") {  
					document.querySelectorAll('.text-container').forEach(element => {
	                    element.style.display = 'none';
                	});
					document.querySelector('.minigame').style.display = 'block';
				} else {
                    let text = str[cnt].split(":"); // 문장을 분해해서 변수에 저장
                    body.style.backgroundImage = "url('resources/image/illustration/" + text[0] + "')";
                    profileImg.src = "resources/image/illustration/" + (text[1] === "" ? "no_profile.png" : text[1]);
					profileTxt.innerHTML = text[2]; 
                    scriptTxt.innerHTML = text[3];
                    cnt++;

					checkpoint[1] = cnt;
					sessionStorage.setItem("checkpoint", JSON.stringify(checkpoint));
							
					console.log(sessionStorage.getItem("checkpoint"));
                }
            } else {
                document.querySelectorAll('.text-container').forEach(element => {
                    element.style.display = 'none';
                });
                document.querySelector('.episode').style.display = 'block';
				body.style.backgroundImage = "url('resources/image/illustration/main.png')";
            }
        }
    });
    
    document.querySelectorAll('button.episode-link').forEach(element => {
        element.addEventListener("click", (e) => {
            id = element.getAttribute('data-id');

			checkpoint[0] = id;
			sessionStorage.setItem("checkpoint", JSON.stringify(checkpoint));
			
            document.querySelector('.episode').style.display = 'none';
            document.querySelector('.episode-' + id).style.display = 'block';
            profileImg = document.querySelector('.profile-' + id + ' img');
            profileTxt = document.querySelector('.profile-' + id + ' p');
            scriptTxt = document.querySelector('.text-' + id + ' p');
            str = document.querySelector('input#list-' + id).value;
            str = str.substring(1, str.length - 1).split(', ');
            cnt = 1;
        })	
    })
}
