<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="../resources/css/style.css"> 
</head>
<body>
	<jsp:include page="../header.jsp" />
	<div id="container">
		<section id="login">
			<h2>로그인</h2>
			<form action="/login.do" method="post">  
				<fieldset>
					<ul>
						<li>
							<label for="id">아이디</label>
							<input type="text" id="id" name="id" required autofocus="autofocus">
						</li>
						<li>
							<label for="passwd">비밀번호</label>
							<input type="password" id="passwd" name="passwd" required autocomplete="off">
							<img id="eyeIcon" src="../resources/images/eye.png" onclick="pw_click()" width="20px">
						</li> 
					</ul>
				</fieldset>
				<div id="login_error">
					${error}
				</div>
				<div id="login_btn">
					<button type="submit">로그인</button>
				</div>
			</form>
		</section>
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
	
	<script src="../resources/js/main.js"></script>
</body>
</html>