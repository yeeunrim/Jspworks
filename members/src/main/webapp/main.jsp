<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 메인페이지</title>
<link rel="stylesheet" href="resources/css/style.css">
</head>
<body>
	<jsp:include page="header.jsp" />
	<div id="container">
		<section id="main">
			<h1>Hello, Welcome KH's Community :)</h1>
			<div class="main_img">
				<img src="resources/images/bgimg.jpg" alt="눈" 
					width="400" height="250">
			</div>
			<!-- 최신 게시글 박스 -->
			<div class="newboard">
				<h3>최신 게시글</h3>
				<c:forEach items="${boardList}" var="board">
					<p>
						<a href="/boardview.do?bno=">${board.title}</a>
						(작성자 : ${board.id}, 작성일 : 
						<fmt:formatDate value="${board.createDate}" 
							pattern="yyyy-MM-dd HH:mm:ss"/>)
					</p>
				</c:forEach>
			</div>
		</section>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>