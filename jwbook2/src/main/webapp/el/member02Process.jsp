<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보</title>
<style>
	table, th, td{border: 1px solid #ccc; border-collapse: collapse; padding: 10px;}
</style>
</head>
<%
	request.setCharacterEncoding("utf-8");
%>
<body>
	<h2>회원 정보</h2>
	<hr>
	<table>
		<tr>
			<th>아이디</th>
			<th>비밀번호</th>
			<th>이름</th>
		</tr>
		<!-- el언어 표기 : param은 getParameter()와 같음 -->
		<tr>
			<td>${param.uid}</td>
			<td>${param.upwd}</td>
			<td>${param.uname}</td>
		</tr>
	</table>
</body>
</html>