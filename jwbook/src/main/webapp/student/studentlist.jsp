<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생 목록</title>
<link rel="stylesheet" href="../resources/css/style.css">
</head>
<body>
	<section id="content">
		<h2>Student List</h2>
		<hr>
		<p><a href="/studentform.do">Student Add</a></p>
		<table>
			<tr>
				<th>Number</th>
				<th>Name</th>
				<th>University</th>
				<th>Birthday</th>
				<th>Email</th>
			</tr>
			<c:forEach items="${students}" var="s" varStatus="i">
				<tr>
					<td>${i.count}</td>
					<td>${s.username}</td>
					<td>${s.univ}</td>
					<td>${s.birth}</td>
					<td>${s.email}</td>
				</tr>
			</c:forEach>
		</table>
	</section>
</body>
</html>