<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 폼</title>
<style>
	ul li{list-style: none; margin: 10px;}
</style>
</head>
<body>
	<form action="/jwbook/loginsession" method="post">
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
				<button type="submit">로그인</button>
			</li>
		</ul>
	</form>
</body>
</html>