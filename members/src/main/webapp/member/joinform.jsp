<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
<link rel="stylesheet" href="../resources/css/style.css">
</head>
<body>
	<jsp:include page="../header.jsp" />
	<div id="container">
		<section id="join">
			<h2>회원 가입</h2>
			<form action="/insertmember.do" method="post">  
				<fieldset>
					<ul>
						<li>
							<label for="id">아이디</label>
							<input type="text" id="id" name="id" required>
						</li>
						<li>
							<label for="passwd">비밀번호</label>
							<input type="text" id="passwd" name="passwd" required>
						</li>
						<li>
							<label for="passwd2">비밀번호 확인</label>
							<input type="text" id="passwd2" name="passwd2" required>
						</li>
						<li>
							<label for="name">이름</label>
							<input type="text" id="name" name="name" required>
						</li>
						<li>
							<label for="email">이메일</label>
							<input type="text" id="email" name="email">
						</li>
						<li>
							<label for="gender">성별</label>
							<div id="gender_opt">
								<span class="check"><input type="radio" id="gender" name="gender" value="male" checked>남</span>
								<span class="check"><input type="radio" id="gender" name="gender" value="female">여</span>
							</div>
						</li>
					</ul>
				</fieldset>
				<div id="join_btn">
					<button type="submit">가입</button>
					<button type="reset">취소</button>
				</div>
			</form>
		</section>
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>