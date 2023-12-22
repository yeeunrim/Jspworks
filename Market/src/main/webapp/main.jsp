<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Web Market | Main</title>
</head>
<body>
	<%-- <%@ include file="header.jsp" %> --%>
	<jsp:include page="header.jsp" />
	
	<div class="container my-3">
		<h1 class="text-center">Hello, Welcome To Web Market :)</h1>
		<div class="text-center my-4">
			<img src="resources/images/snowman.jpg" alt="snowman" class="rounded">
		</div>
	</div>
	
	<jsp:include page="footer.jsp" />
</body>
</html>