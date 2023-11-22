<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="abDAO" class="addressbook.AddrBookDAO" scope="application" />

<%
 	String username = request.getParameter("username");
	abDAO.deleteAddrBook(username);
	
	// 삭제 후 페이지 이동 (redirect)
	response.sendRedirect("addrList.jsp");
%>