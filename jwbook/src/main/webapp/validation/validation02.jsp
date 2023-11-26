<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>유효성 검사</title>
<style>
	ul li{list-style: none; margin: 10px;}
</style>
<script>
	function checkForm(){
		// 자바스크립트 함수 - focus(), select(), submit()
		// 글자의 크기나 길이를 정하는 속성 - length
		// 폼 이름 선택 - name 속성을 선택
		let form = document.loginForm;
		let id = form.uid.value;
		let pw = form.upwd.value;
		
		if(id == ""){
			alert("아이디를 입력해주세요");
			form.uid.focus();
			return false;
		}else if(pw == "" || pw.length < 8){
			alert("비밀번호는 8자 이상 입력해주세요");
			form.upwd.select();
			return false;
		}else{
			// 자바스크립트에서 폼을 전송하는 메서드
			form.submit();
		}
	}
</script>
</head>
<body>
	<form action="loginProcess.jsp" method="post" name="loginForm">
		<ul>
			<li>
				<label for="uid">아이디</label>
				<input type="text" id="uid" name="uid">
			</li>
			<li>
				<label for="upwd">비밀번호</label>
				<input type="password" id="upwd" name="upwd">
			</li>
			<li>
				<!-- <input type="submit" value="로그인"> -->
				<button type="button" onclick="checkForm()">로그인</button>
			</li>
		</ul>
	</form>
</body>
</html>