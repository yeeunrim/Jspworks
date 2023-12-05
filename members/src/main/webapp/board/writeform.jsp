<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 작성</title>
<link rel="stylesheet" href="../resources/css/style.css">
</head>
<body>
	<jsp:include page="../header.jsp" />
	<div id="container">
		<section id="writeform">
			<h2>게시글 작성</h2>
			<form action="/write.do" method="post">
				<table id="tbl_write">
					<tr>
						<td>
							<input type="text" name="title" placeholder="제목을 입력해주세요." required>
						</td>
					</tr>
					<tr>
						<td>
							<textarea rows="7" cols="100" name="content" 
								placeholder="내용을 입력해주세요."></textarea>
						</td>
					</tr>
					<tr>
						<td>
							<div id="write_btn">
								<button type="submit">게시</button>
								<button type="reset">취소</button>
							</div>
						</td>
					</tr>
				</table>
			</form>
		</section>
	</div>
	<jsp:include page="../footer.jsp" />
</body>
</html>