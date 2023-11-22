<%@page import="addressbook.AddrBook"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ADDRESS INFORMATION</title>
<link rel="stylesheet" href="../resources/css/style.css">
</head>
<body>
	<jsp:useBean id="abDAO" class="addressbook.AddrBookDAO" scope="application"></jsp:useBean>
	<%
		// username으로 찾은 객체를 생성
		String username = request.getParameter("username");
		AddrBook addrBook = abDAO.getAddrBook(username);
	%>
	<div id="container">
		<h2>Address Information</h2>
		<hr>
		<table id="tbl_view">
			<tr>
				<td>Name</td>
				<td><%=addrBook.getUsername() %></td>
			</tr>
			<tr>
				<td>Tel</td>
				<td><%=addrBook.getTel() %></td>
			</tr>
			<tr>
				<td>Email</td>
				<td><%=addrBook.getEmail() %></td>
			</tr>
			<tr>
				<td>Gender</td>
				<td><%=addrBook.getGender() %></td>
			</tr>
			<tr>
				<td colspan="2">
					<a href="addrList.jsp">List View</a>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>