<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- 선언문 태그  -->
<%!
	// 전역변수
	int pageCount = 0;

	// 함수 정의 (자바)
	void addCount(){
		pageCount++;
	}
%>

<%
	// 함수 호출
	addCount();
%>

<p>이 사이트 방문은 <%=pageCount %>번째 입니다.</p>
