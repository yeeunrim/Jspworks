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
	<form action="joinProcess.jsp" method="post">
		<ul>
			<li>
				<label for="uid">아이디 </label>
				<input type="text" id="uid" name="uid" required autofocus>
			</li>
			<li>
				<label for="upwd">비밀번호 </label>
				<input type="password" id="upwd" name="upwd" required>
			</li>
			<li>
				<label for="uname">이름 </label>
				<input type="text" id="uname" name="uname" required>
			</li>
			<li>
				<label for="email">이메일 </label>
				<input type="text" id="email" name="email" required>
			</li>
			<li>
				<label for="tel">연락처 </label>
				<input type="text" id="tel1" name="tel1" required size=4 maxlength="3">
				-
				<input type="text" id="tel2" name="tel2" required size=4 maxlength="4">
				-
				<input type="text" id="tel3" name="tel3" required size=4 maxlength="4">
			</li>
			<li>
				<label for="hobby">취미 </label>
				<input type="checkbox" id="hobby" name="hobby" value="exercise" checked>운동
				<input type="checkbox" id="hobby" name="hobby" value="movie">영화보기
				<input type="checkbox" id="hobby" name="hobby" value="game">게임
			</li>
			<li>
				<label for="gender">성별 </label>
				<label>
					<input type="radio" id="gender" name="gender" value="male" checked>남성
				</label>
				<label>
					<input type="radio" id="gender" name="gender" value="female">여성				
				</label>
			</li>
			<li>
				<textarea rows="3" cols="30" name="comment" 
					placeholder="가입인사를 남겨주세요."></textarea>
			</li>
			<li>
				<button type="submit">회원가입</button>
				<button type="reset">가입취소</button>
			</li>
		</ul>
	</form>
</body>
</html>