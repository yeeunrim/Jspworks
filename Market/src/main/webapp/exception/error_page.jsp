<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Web Market | Error Page</title>
</head>
<body>
	<jsp:include page="../header.jsp" />
	
	<div class="container my-3">
		<div class="text-center">
			<h2 class="alert-danger">코드 오류로 인한 장애가 발생했습니다. 빠른 조치하겠습니다.</h2>
		</div>
	</div>
	
	<p><a href="/productlist.do" class="btn btn-secondary">&laquo; Product List</a></p>
	
	<jsp:include page="../footer.jsp" />
</body>
</html>