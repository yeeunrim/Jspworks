<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
<style>
	#content{width: 800px; margin: 0 auto; text-align: center;}
</style>
</head>
<body>
	<div id="content">
		<h2>장바구니</h2>
		<h3>선택한 상품 목록</h3>
		<hr>
		
		<%
			// 세션 유지
			ArrayList<String> productList = (ArrayList)session.getAttribute("sessionlist");
		
			if(productList != null){
				for(String product: productList){
					out.println(product + "<br>");
				}
			} else{
				out.println("상품이 존재하지 않습니다.");
			}
		%>
	</div>
</body>
</html>