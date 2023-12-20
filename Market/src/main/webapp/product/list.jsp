<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Web Market | Product List</title>
</head>
<body>
	<jsp:include page="../header.jsp" />

	<div class="container">
		<h2 class="my-3">Product List</h2>
		
		<div class="row my-4" align="center">
			<c:if test="${empty products}">
				<p class="my-4">Sorry, Empty Product List...</p>
			</c:if>
			<c:if test="${not empty products}">
				<c:forEach items="${products}" var="product">
					<div class="col-4">
						<c:if test="${not empty product.pimage}">
							<img src="../upload/${product.pimage}" alt="product_image" style="width: 100%">
						</c:if>
						<h3 class="mt-4">${product.pname}</h3>
						<p>${product.category} | ${product.price}원</p>		
						<a href="/productinfo.do?pid=${product.pid}" class="btn btn-secondary">
							Detail View &raquo;
						</a>
					</div>
				</c:forEach>	
			</c:if>
		</div>
	</div>
	<jsp:include page="../footer.jsp" />
</body>
</html>