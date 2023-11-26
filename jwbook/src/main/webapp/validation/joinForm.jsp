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
		let form = document.member;
		let id = form.uid.value;
		let pw = form.upwd.value;
		let name = form.uname.value;
		let phone = form.phone1.value + "-" + 
					form.phone2.value + "-" + 
					form.phone3.value;
		
		// 정규표현식
		let regexId = /^[a-zA-Z가-힣]/; // 1. 아이디는 문자로 시작
		let regexPw = /[0-9]+/          // 2. 비밀번호는 숫자만 가능
		let regexName = /[가-힣]+/;     // 3. 이름은 한글만 가능 (맨 마지막에 $로 끝맺을 지으면 된다.)
		let regexEn = /^[a-zA-Z]/;
		let regexPhone = /\d{2,3}-\d{3,4}-\d{4}/; // 4. 전화번호
		
		if(!regexId.test(id)){
			alert("아이디는 문자로 시작해주세요.");
			form.uid.select();
			return false;
		} else if(!regexPw.test(pw)){
			alert("비밀번호는 숫자만 입력해주세요.");
			form.upwd.select();
			return false;
		} else if(!regexName.test(name) || regexEn.test(name)){
			alert("이름은 한글만 가능합니다.");
			form.uname.select();
			return false;
		} else if(!regexPhone.test(phone)){
			alert("연락처 입력을 확인해주세요.");
			form.phone.select();
			return false;
		} else{
			form.submit();
		}
		
	}
</script>
</head>
<body>
	<form action="" method="post" name="member">
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
				<label for="uname">이름</label>
				<input type="text" id="uname" name="uname">
			</li>
			<li>
				<label for="phone">연락처</label>
				<select name="phone1">
					<option value="010">010</option>
					<option value="02">02</option>
					<option value="031">031</option>					
				</select>
				-<input type="text" id="phone2" name="phone2" size=4 maxlength=4>
				-<input type="text" id="phone3" name="phone3" size=4 maxlength=4>
			</li>
			<li>
				<!-- <input type="submit" value="로그인"> -->
				<button type="button" onclick="checkForm()">로그인</button>
			</li>
		</ul>
	</form>
</body>
</html>