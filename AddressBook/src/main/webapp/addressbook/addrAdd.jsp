<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>

<title>ADDRESS ADD</title>
<link rel="stylesheet" href="../resources/css/style.css">

<!-- AddrBook 클래스의 객체 : addrBook을 new 한 것임-->
<jsp:useBean id="addrBook" class="addressbook.AddrBook"></jsp:useBean>
 <!-- property의 username = serUsername() -->
<jsp:setProperty property="username" name="addrBook"/>
<jsp:setProperty property="tel" name="addrBook"/>
<jsp:setProperty property="email" name="addrBook"/>
<jsp:setProperty property="gender" name="addrBook"/>

 <!-- AddrBookDAT dbDAO = new AddrBookSAO(); -->
<jsp:useBean id="abDAO" class="addressbook.AddrBookDAO" scope="application"></jsp:useBean>

<%
	// 주소 추가
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
	<p><a href="addrList.jsp">List View</a></p>
</div>