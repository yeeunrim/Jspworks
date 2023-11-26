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
		let form = document.loginForm;
		let name = form.name.value;
		let regex = /^[a-zA-Z가-힣]/ // +는 여러개를 뜻함
		
		if(!regex.test(name)){
			alert("이름은 숫자로 시작할 수 없습니다.");
			form.uname.select();
			return false;
		} else{
			form.submit();
		}
	}
</script>
</head>
<body>
	<form action="" method="post" name="loginForm">
		<ul>
			<li>
				<label for="name">이름</label>
				<input type="text" id="name" name="name">
			</li>
			<li>
				<button type="button" onclick="checkForm()">로그인</button>
			</li>
		</ul>
	</form>
</body>
</html>