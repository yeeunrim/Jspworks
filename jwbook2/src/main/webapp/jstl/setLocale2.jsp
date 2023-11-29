<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>다국어 처리</title>
<style>
	body{font-family: Lucida Grande;}
	a{text-decoration: none; color: dimgray;}
	a:hover{text-decoration: line-through;}
</style>
</head>
<body>
	<h2>Java Server Page</h2>
	
	<fmt:setLocale value="${param.language}"/>
	<fmt:setBundle basename="com.bundle.message"/>
	
	<p>
		<a href="?language=ko">KOR</a> | <a href="?language=en">ENG</a>
	</p>
	
	<p>제목 : <fmt:message key="title" /></p>
	<p>이름 : <fmt:message key="username" /></p>
	<%-- <p>비밀번호 : <fmt:message key="password" /></p> --%>
</body>
</html>