<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오늘의 날짜와 시간</title>
</head>
<body>
	<h2>Today Date and Time</h2>
	
	<%
		Date date = new Date();
		out.println(date);
	%>
	
	<%-- <%= date %> --%>
</body>
</html>