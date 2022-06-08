window.onload = () => {
	let str = document.querySelector('input[type=hidden]').value.split(',');
	let cnt = 0;
	document.addEventListener("keydown", (e) => {
		if(e.key === ' ' && str.length > cnt) {
			document.querySelector('.text p').innerText = str[cnt];
			cnt++;
		}
	});
}