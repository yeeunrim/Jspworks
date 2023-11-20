/**
 * time.jsp 시계 구현
 */

setInterval(myWatch, 1000);

function myWatch(){
	let date = new Date();
	let time = date.toLocaleTimeString();
	
	document.getElementById("display").innerHTML = time;
}