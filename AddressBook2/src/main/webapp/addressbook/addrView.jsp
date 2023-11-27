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
		// bnum으로 찾은 객체를 생성
		int bnum = Integer.parseInt(request.getParameter("bnum"));
		AddrBook addrBook = abDAO.getAddrBook(bnum);
	%>
	<div id="container">
		<h2>Address Information</h2>
		<hr>
		<table id="tbl_view">
			<tr>
				<td>Number</td>
				<td><%=addrBook.getBnum() %></td>
			</tr>
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
				<td>Registration Date</td>
				<td><%=addrBook.getDate() %></td>
			</tr>
			<tr>
				<td colspan="2">
					<%
					String sessionId = (String)session.getAttribute("sessionId");
					if(sessionId.equals(addrBook.getEmail())){
					%>
					<a href="addrUpdate.jsp?bnum=<%=addrBook.getBnum() %>">
						<button type="button">Update</button>
					</a>
					<a onclick="return confirm('정말로 삭제하시겠습니까?')" 
						href="addrDelete.jsp?bnum=<%=addrBook.getBnum() %>">
						<button type="button">Delete</button>
					</a>
					<%
					}
					%>
					
					<a href="addrList.jsp">
						<button type="button">List</button>
					</a>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>