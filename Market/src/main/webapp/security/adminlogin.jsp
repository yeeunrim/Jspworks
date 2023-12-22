<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Web Market | Admin</title>
</head>
<body>
	<jsp:include page="../header.jsp" />
	
	<div class="container my-3" align="center">
		<div class="col-4">			
			<h3>Login</h3>
			<form action="j_security_check" method="post">
				<div class="form-group my-3">
					<input type="text" id="id" name="j_username" class="form-control" 
						placeholder="ID" required autofocus>
				</div>
				<div class="form-group">
					<input type="password" id="passwd" name="j_password" class="form-control" 
						placeholder="PASSWORD" required autocomplete="off">
				</div>
				<div class="d-grid my-4">
					<button type="submit" class="btn btn-secondary p-2 bg-dark bg-gradient">로그인</button>
				</div>
				<%
					String error = request.getParameter("error");
					if(error != null){
						out.println("<div class='alert alert-danger'>");
						out.println("관리자 전용 메뉴입니다.<br>");
						out.println("회원 전용 로그인 해주세요.");
						out.println("</div>");
					}
				%>
			</form>
		</div>
	</div>
	
	<jsp:include page="../footer.jsp" />
</body>
</html>