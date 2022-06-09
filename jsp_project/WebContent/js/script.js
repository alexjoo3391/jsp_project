window.onload = () => {
	let str = document.querySelector('input[type=hidden]').value
	str = str.substring(1, str.length - 1).split(', ');
	let cnt = 1;
	document.addEventListener("keydown", (e) => {
		if(e.key === ' ' && str.length > cnt) {
			let text = str[cnt].split(":");
			document.querySelector('.profile img').src = "resources/image/" + text[0];
			document.querySelector('.profile p').innerText = text[1]; 
			document.querySelector('.text p').innerText = text[2];
			cnt++;
		}
	});
}