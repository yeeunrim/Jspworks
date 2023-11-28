<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 목록</title>
<style>
	body{font-family: Lucida Grande;}
	#container{width: 80%; margin: 30px auto; text-align: center;}
	input{padding: 5px; background-color: lightgray;}
</style>
</head>
<jsp:useBean id="product" class="el.Product" />
<body>
	<div id="container">
		<h2>상품 목록</h2>
		<hr>
		<form action="selProduct.jsp" method="get">
			<select name="select">
				<!-- foreach로 변경 -->
				<c:forEach items="${product.productList}" var="product">
					<%-- <option>${product}</option> --%>
					<option><c:out value="${product}" /></option>
				</c:forEach>
				
				<!-- <option value="사과">사과</option> -->
				<%-- <%		
					for(int i=0; i<product.getProductList().length; i++){
						out.println("<option>" + product.getProductList()[i] + "</option>");
					}
				%> --%>
				
				<%-- <%
					for(String item : product.getProductList()){
						out.println("<option>" + item + "</option>");
					}
				%> --%>
			</select>
			<input type="submit" value="선택">
		</form>
	</div>
</body>
</html>