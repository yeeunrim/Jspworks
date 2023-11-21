<%@page import="bean.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MemberBean 사용</title>
</head>
<body>
	<%
		// 클래스를 임포트하여 객체 생성
		MemberBean member = new MemberBean();
	%>
	
	<p>아이디 : <%=member.getId() %></p>
	<p>이름 : <%=member.getName() %></p>
</body>
</html>