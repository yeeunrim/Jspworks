/* 상품 등록 유효성 검사 */
/*
	1. 상품코드는 P와 숫자를 조합하여 5~12자리 입력
	2. 상품명은 4~20자 입력
	3. 가격 및 재고 수는 숫자만 가능
*/

let checkProduct = function(){
	// alert("test");
	let pid = document.getElementById("pid");
	let pname = document.getElementById("pname");
	let price = document.getElementById("price");
	let pstock = document.getElementById("pstock");
	
	// 정규 표현식
	let regexPid = /P[0-9]{4,11}/;
	
	if(!regexPid.test(pid.value)){ 
		// 상품코드와 정규표현식이 일치하지 않으면
		alert("상품 코드는 P(대문자)와 숫자를 조합하여 5~12자리를 입력하세요.");
		pid.select();
		return false;
	} else if(pname.value.length < 4 || pname.value.length > 20){
		alert("상품명은 4~20자까지 입력 가능합니다.");
		pname.select();
		return false;
	} else if(price.value.length == 0 || isNaN(price.value) || price.value < 0){
		alert("가격은 0보다 큰 숫자만 입력 가능합니다.");
		price.select();
		return false;
	} else if(pstock.value.length == 0 || isNaN(pstock.value) || pstock.value < 0){
		alert("재고 수는 0보다 큰 숫자만 입력 가능합니다.");
		pstock.select();
		return false;
	} else {
		document.newProduct.submit();
	}
	
}