<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학점 계산 프로그램</title>
</head>
<body>
	<!-- 학점 점수 변수 선언 -->
	<c:set var="score" value="${param.score}" />
	<h2>Test Score : ${score}</h2>
	<hr>
	<c:choose>
		<c:when test="${score >= 90 and score <= 100}">
			<p>Result : A</p>
		</c:when>
		<c:when test="${score >= 80 and score < 90}">
			<p>Result : B</p>	
		</c:when>
		<c:when test="${score >= 70 and score < 80}">
			<p>Result : C</p>
		</c:when>
		<c:when test="${score >= 60 and score < 70}">
			<p>Result : D</p>
		</c:when>
		<c:otherwise>
			<p>Result : F</p>
		</c:otherwise>
	</c:choose>
</body>
</html>