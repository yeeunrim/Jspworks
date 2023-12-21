<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Web Market | Product Info</title>
<script src="https://kit.fontawesome.com/aa24b12773.js" crossorigin="anonymous"></script>
<script>
	let addToCart = function(){
		if(confirm("상품을 주문하시겠습니까 ?")){ // 확인, 취소
			document.addform.submit();
		} else{
			document.addform.reset();
		}
	}
</script>
</head>
<body>
	<jsp:include page="../header.jsp" />
	<div class="container">
		<h2 class="my-3">Product Info.</h2>
		
		<div class="row">
			<div class="col-5">
				<c:if test="${not empty product.pimage}">
					<img src="../upload/${product.pimage}" alt="product_image" style="width: 100%">
				</c:if>
			</div>
			<div class="col-6">
				<h2>${product.pname}</h2>
				<p class="mb-2">
					<span class="badge bg-dark">${product.condition}</span> | 
					${product.category} | 
					<fmt:formatNumber value="${product.price}" pattern="#,##0"/>원
				</p>
				<p class="mb-2" style="color: red;">현재 재고는 ${product.pstock}개 남았습니다.</p>
				<form action="/addcart.do?pid=${product.pid}" method="post" name="addform">
					<!-- 상품 주문 버튼을 클릭 시, 폼이 전송되어야 함 -->
					<a href="#" onclick="addToCart()"><i class="fa-solid fa-bag-shopping fa-lg" style="color: dimgray;"></i></a>
					<a href="/cart.do"><i class="fa-solid fa-cart-shopping fa-lg" style="color: dimgray;"></i></a>
					<a href="/productlist.do"><i class="fa-solid fa-list fa-lg" style="color: dimgray;"></i></a>
				</form>
				<hr>
				<h5>상세설명</h5>
				<p>${product.description}</p>
			</div>
		</div>
	</div>
	<jsp:include page="../footer.jsp" />
</body>
</html>