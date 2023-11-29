<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>경로(path) 알아보기</title>
</head>
<body>
	<%
		StringBuffer url = request.getRequestURL();
		String uri = request.getRequestURI();
		String context = request.getContextPath();
	%>
	
	URL : <%=url %><br>
	URI : <%=uri %><br>
	Context : <%=context %><br>
</body>
</html>