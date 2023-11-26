<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("uid");
	String pw = request.getParameter("upwd");
%>

<p>로그인 성공 !</p>
<p>아이디 : <%=id  %></p>
<p>비밀번호 : <%=pw %></p>