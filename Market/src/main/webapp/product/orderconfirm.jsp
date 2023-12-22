<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Web Market | Order Confirm</title>
<script src="https://kit.fontawesome.com/aa24b12773.js" crossorigin="anonymous"></script>
</head>
<body>
	<jsp:include page="../header.jsp" />
	
	<div class="container">
		<h2 class="my-3">Order Confirm</h2>
		
		<div class="row my-3">
			<table class="table my-3 px-3 caption-top">
				<caption>배송 정보</caption>
				<thead class="table-light">
					<tr>
						<th>성명</th>
						<th>주소</th>
						<th>우편 번호</th>
						<th>배송일</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>${shipping_sname}</td>
						<td>${shipping_address}</td>
						<td>${shipping_zipcode}</td>
						<td>${shipping_shippingDate}</td>
					</tr>
				</tbody>
			</table>

			<!-- 장바구니 품목 -->
			<table class="table my-3 px-3 caption-top">
				<caption>주문 상품</caption>
				<thead class="table-light">
					<tr>	
						<th>상품</th>
						<th>가격 <small>(원)</small></th>
						<th>수량 <small>(개)</small></th>
						<th>소계 <small>(원)</small></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${cartlist}" var="product">
						<tr>
							<td><span class="badge bg-light text-dark">${product.pid}</span> ${product.pname}</td>
							<td><fmt:formatNumber value="${product.price}" pattern="#,##0"/></td>
							<td>${product.quantity}</td>
							<td>
								<fmt:formatNumber value="${product.price * product.quantity}" pattern="#,##0"/>
							</td>
						</tr>
					</c:forEach>
				</tbody>
				<tfoot>
					<tr>
						<td></td>
						<td></td>
						<td>총액</td>
						<td><fmt:formatNumber value="${sum}" pattern="#,##0"/></td>
					</tr>
				</tfoot>
			</table>
		</div>
		
		<div align="right">
			<a href="/thankscustomer.do" class="btn btn-secondary bg-dark bg-gradient">주문 완료</a>
		</div>
	</div>
	
	<jsp:include page="../footer.jsp" />
</body>
</html>