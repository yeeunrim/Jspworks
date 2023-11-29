<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>날짜와 시간 JSTL 연습</title>
</head>
<body>
	<h2>날짜를 다양한 형식으로 표기</h2>
	<% Date present = new Date(); %>
	<p>현재 날짜 및 시간 : <%=present %></p>
	
	<jsp:useBean id="now" class="java.util.Date" /> 
	<p>현재 날짜 및 시간 (JSTL) : ${now}</p>
	<p><fmt:formatDate value="${now}" type="date"/></p>
	<p><fmt:formatDate value="${now}" type="time"/></p>
	<p><fmt:formatDate value="${now}" pattern="YYYY:MM:DD hh:mm:ss"/></p>
	
	<hr>
	
	<h2>숫자 표기</h2>
	<p><fmt:formatNumber value="12300" /></p>
	<p><fmt:formatNumber value="12300" type="number" /></p>
	<!-- 통화 : currency -->
	<p><fmt:formatNumber value="12300" type="currency" /></p>
	<p><fmt:formatNumber value="12300" type="currency" currencySymbol="$"/></p>
	<p><fmt:formatNumber value="0.5" type="percent"/></p>
	<!-- 형식 지정 : 소수자리수  -->
	<p><fmt:formatNumber value="12300.56" pattern="#,##0.0"/></p>
</body>
</html>