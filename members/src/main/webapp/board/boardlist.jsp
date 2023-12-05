<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 목록</title>
<link rel="stylesheet" href="../resources/css/style.css">
</head>
<body>
	<jsp:include page="../header.jsp" />
	<div id="container">
		<section id="boardlist">
			<h2>게시글 목록</h2>
			<table id="tbl_list">
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성일</th>
						<th>조회수</th>
						<th>글쓴이</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${boardList}" var="b">
						<tr>
							<td>${b.bno}</td>
							<td><a href="/boardview.do?bno=${b.bno}">${b.title}</a></td>
							<!-- 수정일이 있을 경우 수정 날짜값이 표시되도록함 -->
							<td>
							<c:choose>
								<c:when test="${not empty b.modifyDate}">
								   <fmt:formatDate value="${b.modifyDate}" 
										pattern="yyyy-MM-dd HH:mm:ss" />
								</c:when>
							    <c:otherwise>
							        <fmt:formatDate value="${b.createDate}" 
										pattern="yyyy-MM-dd HH:mm:ss" />
							    </c:otherwise>
							</c:choose>
							</td>		
							<td>${b.hit}</td>
							<td>${b.id}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			
			<!-- 글쓰기 버튼 -->
			<div id="list_btn">
				<a href="/writeform.do">
					<button type="button">글 작성</button>
				</a>
			</div>
		</section>
	</div>
	<jsp:include page="../footer.jsp" />
</body>
</html>