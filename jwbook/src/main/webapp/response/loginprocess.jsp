<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	// 한글 인코딩
	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("uid");
	String pwd = request.getParameter("upwd");
	
	/* id = today, pwd = 1234 */
	if(id.equals("today") && pwd.equals("1234")){
		/* out.println("로그인을 성공했습니다."); */
		response.sendRedirect("loginsuccess.jsp");
	} else{
		/* out.println("로그인을 실패했습니다."); */
		response.sendRedirect("loginfail.jsp");
	}
	/* out.println(id + ", " + pwd); */
%>