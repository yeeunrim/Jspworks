<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="login" class="bean.LoginBean" />
<jsp:setProperty property="uid" name="login" />
<jsp:setProperty property="upwd" name="login" />

<!-- setUid(), setUpwd()를 참조함 -->
<%
	String id = request.getParameter("uid");
	String pwd = request.getParameter("upwd");
	
	// 빈칸이었을 경우, 예외 처리
	if(id == "" || pwd == ""){
		out.println("<script>");
		out.println("alert('아이디나 비밀번호를 입력해주세요.')");
		out.println("history.back()"); // 이전 페이지로 이동
		out.println("</script>");
	} else{
		boolean result = login.checkUser();
		if(result){
			out.println("로그인 성공");
		} else{
			out.println("로그인 실패");
		}
	}
%>

<p>아이디 : <%= login.getUid() %></p>
<p>비밀번호: <%= login.getUpwd() %></p>