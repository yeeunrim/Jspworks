<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Web Market | Cart</title>
<script src="https://kit.fontawesome.com/aa24b12773.js" crossorigin="anonymous"></script>
</head>
<body>
	<jsp:include page="../header.jsp" />
	
	<div class="container">
		<h2 class="my-3">Cart</h2>
		
		<div class="row my-3">
			<!-- 장바구니 품목 -->
			<table class="table table-hover my-3 px-3">
				<thead>
					<tr>	
						<th>상품</th>
						<th>가격 <small>(원)</small></th>
						<th>수량 <small>(개)</small></th>
						<th>소계 <small>(원)</small></th>
						<th>비고</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${cartlist}" var="product">
						<tr>
							<td><span class="badge bg-dark">${product.pid}</span> ${product.pname}</td>
							<td><fmt:formatNumber value="${product.price}" pattern="#,##0"/></td>
							<td>${product.quantity}</td>
							<td>
								<fmt:formatNumber value="${product.price * product.quantity}" pattern="#,##0"/>
							</td>
							<td style="padding-left: 15px;">
								<a href="/removecart.do?pid=${product.pid}">
									<i class="fa-solid fa-trash fa-lg" style="color: dimgray;"></i>
								</a>
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
						<td></td>
					</tr>
				</tfoot>
			</table>
			
			<!-- 주문 / 삭제 -->
			<table>
				<tr>
					<td align="left">
						<a href="/deletecart.do" class="btn btn-secondary btn-sm">전체 상품 삭제</a>
					</td>
					<td align="right">
						<!-- 장바구니 주문이므로 카트아이디를 전달해줌 -->
						<a href="/shippingform.do?cartId=${cartId}" class="btn btn-secondary btn-sm">전체 상품 주문</a>
					</td>
				</tr>
			</table>
		</div>
	</div>
	
	<jsp:include page="../footer.jsp" />
</body>
</html>