<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Web Market | Order Success</title>
<script src="https://kit.fontawesome.com/aa24b12773.js" crossorigin="anonymous"></script>
</head>
<body>
	<jsp:include page="../header.jsp" />
	
	<div class="container text-center">
		<h1 class="mt-4">주문 완료</h1>
		<h3 class="my-2">주문해 주셔서 감사합니다.</h3>
		<p class="my-2">주문은 ${shipping_shippingDate}에 배송될 예정입니다.</p>
		<p class="my-2">주문 번호 : ${shipping_cartId}</p> 
		<p><a href="/productlist.do" class="btn btn-secondary mt-2 bg-dark bg-gradient">상품 목록</a></p>
	</div>
	
	<jsp:include page="../footer.jsp" />
</body>
</html>