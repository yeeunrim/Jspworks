<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 상세보기</title>
<link rel="stylesheet" href="resources/css/style.css">
<script src="https://kit.fontawesome.com/aa24b12773.js" crossorigin="anonymous"></script>
</head>
<body>
	<jsp:include page="../header.jsp" />
	
    <div id="container">
      <section id="board_view">
		<h2>글 상세보기</h2>
		<table>
			<tbody>
				<tr>
					<td><input type="text" name="title" 
							value="${board.title}" readonly></td>
				</tr>
				<tr>
					<td>
						<div>
							<c:if test="${not empty board.filename}">
								<img src="../upload/${board.filename}" alt="">
							</c:if>
						</div>
						${board.content}
					</td>
				</tr>
			    <tr>
					<td>
						<c:out value="글쓴이 : ${board.id}"/>
          					<c:choose>
          						<c:when test="${not empty board.modifyDate}">
          						  (수정일 : <fmt:formatDate value="${board.modifyDate}" 
          						  				pattern="yyyy-MM-dd HH:mm:ss"/>)
          				    	</c:when>
	           				    <c:otherwise>
	           				   	  (작성일 : <fmt:formatDate value="${board.createDate}" 
	           				   	  				pattern="yyyy-MM-dd HH:mm:ss"/>)
	           				   </c:otherwise>
          				   </c:choose>
          				</td>
				</tr>
			    <tr>
			    	<td>
			    	<c:choose>
			    		<c:when test="${not empty board.filename}">
			    			파일 : ${board.filename}<a href="filedown.do?filename=${board.filename}">
			    						&nbsp;[다운로드]</a> 
			    		</c:when>
			    		<c:otherwise>
			    			<c:out value="첨부파일 : " />
			    		</c:otherwise>
			    	</c:choose>
			    	</td>
			    </tr>
			    <tr>
					<td>
						조회수 : ${board.hit}&nbsp;&nbsp;&nbsp;&nbsp;
						<!-- 좋아요 영역 -->
						<c:choose>
							<c:when test="${empty sessionId}">
								<span><i class="fa-regular fa-heart" style="color: dimgray;"></i></span>
								<span>${voteCount}</span>
								<a href="#" onclick="location.href='/loginform.do'">좋아요는 로그인이 필요합니다.</a>
							</c:when>
							<c:otherwise>
								<!-- 하트의 상태 바꾸기  -->
								<c:choose>
									<c:when test="${sw eq true}">
										<span>
											<a href="/like.do?bno=${board.bno}&id=${sessionId}">
												<i class="fa-regular fa-heart" style="color: dimgray;"></i>
											</a>
										</span>
									</c:when>
									<c:otherwise>
										<span>
											<a href="/like.do?bno=${board.bno}&id=${sessionId}">
												<i class="fa-solid fa-heart" style="color: dimgray;"></i>
											</a>
										</span>		
									</c:otherwise>
								</c:choose>
								<span>${voteCount}</span>
							</c:otherwise>
						</c:choose>
					</td>
				</tr>
			    <tr>
			    	<td class="file">
			    	    <c:if test="${sessionId eq board.id}">
			    		<a href="/updateBoardform.do?bno=${board.bno}">
			    			<button type="button" class="view_btn">수정</button>
		    			</a>
			    		<a href="/deleteboard.do?bno=${board.bno}"
			    		   onclick="return confirm('정말로 삭제하시겠습니까?')">
			    			<button type="button" class="view_btn">삭제</button>
		    			</a>
		    			</c:if>
			    		<a href="/boardlist.do">
			    			<button type="button" class="view_btn">목록</button>
		    			</a>
			    	</td>
			    </tr>
			</tbody>
		</table>
		
		<!-- 댓글 영역 -->
		<h3><i class="fa-regular fa-pen-to-square"></i> 댓글</h3>
		<c:forEach items="${replyList}" var="reply">
		<div class="reply">
			<p>${reply.rcontent}</p>
			<p>작성자 : ${reply.replyer} (작성일: <fmt:formatDate value="${reply.rdate}" 
	           				   	  				pattern="yyyy-MM-dd HH:mm:ss"/>)</p>
			<p>
				<c:if test="${sessionId eq reply.replyer}">
				<a href="/updateReplyform.do?bno=${board.bno}&rno=${reply.rno}">수정</a>
				| <a href="/deletereply.do?bno=${board.bno}&rno=${reply.rno}"
				   onclick="return confirm('정말로 삭제하시겠습니까?')">삭제</a>
				</c:if>
			</p>
		</div>
		</c:forEach>
		
		<!-- 댓글 등록 -->
		<form action="/insertreply.do" method="post" id="replyform">
			<input type="hidden" name="bno" value="${board.bno}">
			<input type="hidden" name="replyer" value="${sessionId}">
			<p>
				<textarea rows="4" cols="50" name="rcontent"
						placeholder="댓글을 남겨보세요" id="replyform_txtarea"></textarea>
			</p>
		    <button type="submit" id="reply_btn">등록</button>
		</form>
		<!-- 로그인한 사용자만 댓글 등록 가능 -->
		<c:if test="${empty sessionId}">
		<div class="replylogin">
			<a href="/loginform.do">
				<i class="fa-solid fa-user"></i> 로그인한 사용자만 댓글 등록이 가능합니다.
			</a>
		</div>
		</c:if>
	  </section>
	</div>
	
	<jsp:include page="../footer.jsp" />
</body>
</html>