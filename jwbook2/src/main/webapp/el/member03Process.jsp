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
<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="member" class="el.Member"></jsp:useBean>
<jsp:setProperty property="uid" name="member"/>
<jsp:setProperty property="upwd" name="member"/>
<jsp:setProperty property="uname" name="member"/>
<body>
	<h2>회원 정보</h2>
	<hr>
	<table>
		<tr>
			<th>아이디</th>
			<th>비밀번호</th>
			<th>이름</th>
		</tr>
		<!-- el언어 표기 : member.uid = member.getUid()와 같음 -->
		<tr>
			<%-- <td><%=member.getUid() %></td> --%>
			<td>${member.uid}</td>
			<td>${member.upwd}</td>
			<td>${member.uname}</td>
		</tr>
	</table>
</body>
</html>