<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<link rel="stylesheet" href="resources/css/style.css">

<header>
	<div id="logo">
		<h1><a href="/">KH</a></h1>
	</div>
	<nav>
		<c:choose>
			<c:when test="${empty sessionId}">
				<ul id="topMenu">
					<li><a href="/loginform.do">로그인</a></li>
					<li><a href="/joinform.do">회원가입</a></li>
					<li><a href="/boardlist.do">게시판</a></li>
					<li><a href="/memberlist.do">회원 목록</a></li>
				</ul>
			</c:when>
			<c:otherwise >
				<ul id="topMenu">
					<li><a href="/logout.do">${sessionName}님, 로그아웃</a></li>
					<li><a href="/memberview.do?id=${sessionId}">나의 정보</a></li>
					<li><a href="boardlist.do">게시판</a></li>
					<li><a href="/memberlist.do">회원 목록</a></li>
				</ul>
			</c:otherwise>
		</c:choose> 
		<!-- <ul id="topMenu">
			<li><a href="/loginform.do">로그인</a></li>
			<li><a href="/joinform.do">회원가입</a></li>
			<li><a href="">게시판</a></li>
			<li><a href="/memberlist.do">회원 목록</a></li>
		</ul> -->
	</nav>
</header>