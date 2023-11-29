<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>fmt 태그</title>
</head>
<body>
	<%=response.getLocale() %>
	
	 <!-- 언어 세팅 -->
	 <fmt:setLocale value="ko"/>
	 <p><%=response.getLocale() %></p>
	 
	 <fmt:setLocale value="en"/>
	 <p><%=response.getLocale() %></p>
</body>
</html>