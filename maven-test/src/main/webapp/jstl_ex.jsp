<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL 예제</title>
</head>
<body>
	<!-- el 언어  -->
	${10*3}
	<!-- 조건문 사용 -->
	<c:set var="num" value="10" />
	<c:if test="${num % 2 == 0}">
		<p>짝수입니다</p>
	</c:if>
	<c:if test="${num % 2 == 1}">
		<p>홀수입니다</p>
	</c:if>
</body>
</html>