<%@page import="addressbook.AddrBook"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ADDRESSBOOK LIST</title>
<link rel="stylesheet" href="../resources/css/style.css">
</head>
<body>
	<jsp:useBean id="abDAO" class="addressbook.AddrBookDAO" scope="application"></jsp:useBean>
	<div id="container">
		<h2>Address List</h2>
		<hr>
		<p>
			<a href="addrForm.jsp">Address Add</a> &nbsp;&nbsp;|
			&nbsp;&nbsp;<a href="../index.jsp">Address Main</a>
		</p>
		<table id="tbl_list">
			<tr>
				<th>Name</th>
				<th>Tel</th>
				<th>Email</th>
				<th>Gender</th>
				<th>View</th>
				<th>Delete</th>
			</tr>
			
			<%
				for(int i=0; i<abDAO.getListAll().size(); i++){
					AddrBook addrBook = abDAO.getListAll().get(i);
			%>
			<tr>
				<td><%=addrBook.getUsername() %></td>
				<td><%=addrBook.getTel() %></td>
				<td><%=addrBook.getEmail() %></td>
				<td><%=addrBook.getGender() %></td>
				<td>
					<a href="addrView.jsp?username=<%=addrBook.getUsername() %>">
						<button type="button">View</button>
					</a>
				</td>
				<td>
					<a onclick="return confirm('정말로 삭제하시겠습니까?')" href="addrDelete.jsp?username=<%=addrBook.getUsername() %>">
						<button type="button">Delete</button>
					</a>
				</td>
			</tr>
			<%
				}
			%>
		</table>
	</div>
</body>
</html>