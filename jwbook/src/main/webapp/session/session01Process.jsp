<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String userId = request.getParameter("uid");
	String userPw = request.getParameter("passwd");
	
	// id = khit , pw = 1234
	if(userId.equals("khit") && userPw.equals("1234")){
		// 로그인이 성공하면 세션을 발급함(세션이름 - "userID")
		session.setAttribute("userID", userId);
		out.println("세션이 발급되었습니다.");
		session.setMaxInactiveInterval(10*60); // 2분으로 설정
	} else{
		out.println("<script>");
		out.println("alert('아이디나 비밀번호가 일치하지 않습니다.')");
		out.println("history.back()");
		out.println("</script>");
	}
%>

<p><%=session.getAttribute("userID") %>님이 로그인한 상태입니다.</p>