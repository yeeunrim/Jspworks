<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 목록</title>
<link rel="stylesheet" href="../resources/css/style.css">
</head>
<body>
	<jsp:include page="../header.jsp" />
	<div id="container">
		<section id="memberlist">
			<h2>회원 목록</h2>
			<table id="tbl_list">
				<thead>
					<tr>
						<th>번호</th>
						<th>아이디</th>
						<th>비밀번호</th>
						<th>이름</th>
						<th>이메일</th>
						<th>성별</th>
						<th>가입일</th>
					</tr>
				</thead>
				
				<tbody>
					<c:forEach items="${memberList}" var="m">
						<tr>
							<td>${m.mno}</td>
							<td>${m.id}</td>
							<td>${m.passwd}</td>
							<td>${m.name}</td>
							<td>${m.email}</td>
							<td>${m.gender}</td>
							<td>${m.joinDate}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>		
		</section>
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>