<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
<link rel="stylesheet" href="../resources/css/style.css">
<script>
	function checkMember(){
		// input의 name 속성을 변수에 할당
		let form = document.member;
		let id = form.id.value;
		let pw1 = form.passwd.value;
		let pw2 = form.passwd2.value;
		let name = form.name.value;
		
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
		} else{
			// 오류가 없으면 폼을 메인컨트롤러로 전송
			form.submit();
		}
	}
</script>
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