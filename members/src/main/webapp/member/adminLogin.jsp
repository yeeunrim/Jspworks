<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 로그인</title>
<link rel="stylesheet" href="../resources/css/style.css"> 
</head>
<body>
	<jsp:include page="../header.jsp" />
	<div id="container">
		<section id="login">
			<h2>관리자 로그인</h2>
			<form action="j_security_check" method="post">
				<fieldset>
					<ul>
						<li>
							<label for="id">아이디 </label>
							<input type="text" id="id" name="j_username" required autofocus>
						</li>
						<li>
							<label for="passwd">비밀번호</label>
							<input type="password" id="passwd" name="j_password" required autocomplete="off">
							<img id="eyeIcon" src="../resources/images/eye.png" onclick="pw_click()" width="20px">
						</li> 
					</ul>
				</fieldset>
				<%
					String error = request.getParameter("error");
					if(error != null){
						out.println("<div id='login_error'>");
						out.println("관리자 전용 메뉴입니다.<br>");
						out.println("회원 전용 로그인 해주세요.");
						out.println("</div>");
					}
				%>
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