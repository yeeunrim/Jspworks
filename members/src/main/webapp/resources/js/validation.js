function checkMember(){
	// input의 name 속성을 변수에 할당
	let form = document.member;
	let id = form.id.value; // id - name, id 속성 모두 사용 가능
	let pw1 = form.passwd.value;
	let pw2 = form.passwd2.value;
	let name = form.name.value;
	let btnChk = form.btnChk.value;
	
	// 정규 표현식
	// 비밀번호
	let regexPw1 = /[0-9]+/;
	let regexPw2 = /[a-zA-Z]+/;
	let regexPw3 = /[~!@#$%^&*()_+|]+/;
	// 이름
	let regexName = /^[가-힣]+$/
	
	if(id.length < 4 || id.length > 15){
		alert("아이디는 4~15자리 입력 가능합니다.");
		id.select();
		return false;
	} else if(pw.length < 8 || !regexPw1.test(pw1) || !regexPw2.test(pw1) || !regexPw3.test(pw1)){	
		alert("비밀번호는 영문자, 숫자, 특수문자를 포함해 8자 이상 입력 가능합니다.");
		id.select();
		return false;
	} else if(pw1 != pw2){
		// pw1과 pw2가 일치하지 않을 때
		alert("비밀번호가 일치하지 않습니다.");
		id.select();
		return false;
	} else if(!regexName.test(name)){
		alert("이름은 한글로 작성해주세요.");
		id.select();
		return false;
	} else if(btnChk == 'N'){
		alert("아이디 중복 체크를 해주세요.");
		return false;
	} else{
		// 오류가 없으면 폼을 메인컨트롤러로 전송
		form.submit();
	}
}

$(function(){
	$("#message").css("color", "red");
	$("#message").css("font-size", "10px");
});

function checkId(){
	// alert("test");
	if($("#id").val() == ""){
		alert("아이디를 입력해주세요.");
		// input의 선택자(id)의 값을 사용
		id.focus();
		return false;
	} else {
		$.ajax({
			type: "get",
			dataType: "text",
			url: "/member/joinform", // http://localhost:8080/member/checkid.jsp
			data: {id: $("#id").val()}, // id 속성이 서버로 전달됨
			success: function(data){
				if(data == "usable"){
					$("#btnChk").attr("value", "Y");
					$("#message").text("사용할 수 있는 ID 입니다.");
				} else{
					$("#message").text("사용할 수 없는 ID 입니다.");
				}
			},
			error: function(){
				alert("에러 발생했습니다.");
			}
		});
	}
}