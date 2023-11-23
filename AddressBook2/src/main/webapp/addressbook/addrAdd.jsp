<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AddressBook Add</title>
<link rel="stylesheet" href="../resources/css/style.css">
</head>
<body>
	<jsp:useBean id="addrBook" class="addressbook.AddrBook" />
	<jsp:setProperty property="*" name="addrBook" />
	<jsp:useBean id="abDAO" class="addressbook.AddrBookDAO" scope="application" />
	
	<%
		abDAO.addAddrBook(addrBook);
	%>

	<div id="container">
		<h2>Registration Content</h2>
		<hr>
		<p>Name : <%=addrBook.getUsername() %></p>
		<p>Tel : <%=addrBook.getTel() %></p>
		<p>Email : <%=addrBook.getEmail() %></p>
		<p>Gender : <%=addrBook.getGender() %></p>
		<hr>
		<p>
			<a href="../index.jsp">Main</a>&nbsp;&nbsp;|
			&nbsp;&nbsp;<a href="addrList.jsp">List View</a>
		</p>
	</div>
</body>
</html>