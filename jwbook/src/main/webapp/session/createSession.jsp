<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>세션 생성</title>
</head>
<body>
	<h2>세션 생성</h2>
	<!--Session : 내장 객체임 -->
	<p>세션 : <%=session %></p>
	<!-- Cookie: JSESSIONID=2D175DE5248A83E80E566A56B575595C -->
	<p>세션 아이디 : <%=session.getId() %></p>
</body>
</html>