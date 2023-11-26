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
		// 폼 이름 선택 - name 속성을 선택
		let form = document.loginForm;
		alert("아이디 : " + form.uid.value + "\n비밀번호 : " + form.upwd.value);
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
				<button type="submit" onclick="checkForm()">로그인</button>
			</li>
		</ul>
	</form>
</body>
</html>