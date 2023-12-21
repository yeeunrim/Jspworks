<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Web Market | Product Edit</title>
<script src="https://kit.fontawesome.com/aa24b12773.js" crossorigin="anonymous"></script>
</head>
<body>
	<jsp:include page="../header.jsp" />

	<div class="container">
		<h2 class="my-3">Product Edit</h2>
		
		<div class="row my-4" align="center">
			<c:forEach items="${products}" var="product">
				<div class="col-4">
					<c:if test="${not empty product.pimage}">
						<img src="../upload/${product.pimage}" alt="product_image" style="width: 100%">
					</c:if>
					<h3 class="mt-4">${product.pname}</h3>
					<p>${product.category} | <fmt:formatNumber value="${product.price}" pattern="#,##0"/>원</p>	
					<p>
						<!-- edit가 update면 수정, delete면 삭제 -->
						<c:if test="${edit eq 'update'}">
							<a href="/updateform.do?pid=${product.pid}">
								<i class="fa-solid fa-pen-to-square fa-xl" style="color: dimgray;"></i>
							</a>
						</c:if>
						<c:if test="${edit eq 'delete'}">
							<a href="/deleteproduct.do?pid=${product.pid}" onclick="return confirm('정말로 삭제하시겠습니까 ?')">
								<i class="fa-solid fa-trash fa-xl" style="color: dimgray;"></i>
							</a>
						</c:if>
					</p>
				</div>
			</c:forEach>	
		</div>
	</div>
	
	<jsp:include page="../footer.jsp" />
</body>
</html>