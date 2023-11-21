<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	// 데이터를 잠시 저장하는 객체
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
%>

<p>아이디 : <%= id %></p>
<p>패스워드 : <%=pwd %></p>