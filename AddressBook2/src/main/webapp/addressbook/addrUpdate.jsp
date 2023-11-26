<%@page import="addressbook.AddrBook"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Address Update</title>
<link rel="stylesheet" href="../resources/css/style.css">
</head>
<body>
	<jsp:useBean id="abDAO" class="addressbook.AddrBookDAO" scope="application" />
	
	<%
		// bnum으로 찾은 객체를 생성
		int bnum = Integer.parseInt(request.getParameter("bnum"));
		AddrBook addrBook = abDAO.getListAll(bnum);
	%>
	
	<div id="container">
		<h2>Address Update</h2>
		<hr>
		<form action="addrUpdateProcess.jsp" method="post">
			<table id="tbl_view">
				<tr>
					<td>Number</td>
					<td>
						<input type="text" name="bnum" value=<%=addrBook.getBnum() %> readonly>
					</td>
				</tr>
				<tr>
					<td>Name</td>
					<td>
						<input type="text" name="uesrname" value=<%=addrBook.getUsername() %>>
					</td>
				</tr>
				<tr>
					<td>Tel</td>
					<td>
						<input type="text" name="tel" value=<%=addrBook.getTel() %>>
					</td>
				</tr>
				<tr>
					<td>Email</td>
					<td>
						<input type="text" name="email" value=<%=addrBook.getEmail() %>>
					</td>
				</tr>
				<tr>
					<td>Gender</td>
					<td>
						<% if(addrBook.getGender().equals("male")){ %>
						<input type="radio" name="gender" value="male" checked>male
						<input type="radio" name="gender" value="female">female
						<% } else{ %>
						<input type="radio" name="gender" value="male">male
						<input type="radio" name="gender" value="female" checked>female
						<% } %>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="Save">
						<input type="reset" value="Reset">
						<a href="addrList.jsp">
							<button type="button">List</button>
						</a>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>