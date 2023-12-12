<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Cookie[] cookies = request.getCookies();
	out.println("현재 쿠키의 수 : " + cookies.length + "개<br><br>");
	
	for(int i=0; i<cookies.length; i++){
		out.println("쿠키 속성의 이름 : " + cookies[i].getName() + "<br>");
		out.println("쿠키 속성의 값 : " + cookies[i].getValue() + "<br><br>");
	}
%>