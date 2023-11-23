<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 세션 정보 얻기
	// 발급된 세션 아이디를 통해 가져오기
	// 강제 형변환(Object -> String)
	String id = (String)session.getAttribute("userID");

	out.println("설정된 세션의 속성값 : " + id);
%>