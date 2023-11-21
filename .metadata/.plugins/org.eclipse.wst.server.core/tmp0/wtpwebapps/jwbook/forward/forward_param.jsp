<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>param 액션 태그</title>
</head>
<body>
	<h2>아이디와 비밀번호 전달하기</h2>
	<jsp:forward page="param_data.jsp">
		<jsp:param value="today" name="id"/>
		<jsp:param value="1234" name="pwd"/>
	</jsp:forward>
</body>
</html>