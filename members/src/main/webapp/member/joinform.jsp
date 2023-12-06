<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
<script src="../resources/js/jquery-3.7.1.js"></script>
<script src="../resources/js/validation.js"></script>
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
							<input type="text" id="id" name="id" placeholder="아이디는 4~15자리 입력 가능합니다.">
							<button type="button" id="btnChk" class="btn_check" onclick="checkId()" value="N">ID 중복 확인</button>
							<p id="message"></p>
						</li>
						<li>
							<label for="passwd">비밀번호</label>
							<input type="password" id="passwd" name="passwd" required autocomplete="off" 
								placeholder="영문자, 숫자, 특수문자 포함 (8자 이상)">
							<img id="eyeIcon" src="../resources/images/eye.png" onclick="pw_click()" width="20px" class="eye_img">
						</li>
						<li>
							<label for="passwd2">비밀번호 확인</label>
							<input type="password" id="passwd2" name="passwd2" 
								placeholder="비밀번호와 동일하게 입력하세요.">
							<img id="eyeIcon" src="../resources/images/eye.png" onclick="pw_click()" width="20px" class="eye_img2">
						</li>
						<li>
							<label for="name">이름</label>
							<input type="text" id="name" name="name" placeholder="이름은 한글로 입력해주세요.">
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
					<button type="button" onclick="checkMember()">가입</button>
					<button type="reset">취소</button>
				</div>
			</form>
		</section>
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
	
	<script src="../resources/js/main.js"></script>
</body>
</html>