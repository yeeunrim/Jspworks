<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("uid");
	String pwd = request.getParameter("upwd");
	String name = request.getParameter("uname");
	String email = request.getParameter("email");
	String tel1 = request.getParameter("tel1");
	String tel2 = request.getParameter("tel2");
	String tel3 = request.getParameter("tel3");
	String[] hobbyList = request.getParameterValues("hobby");
	String gender = request.getParameter("gender");
	String comment = request.getParameter("comment");
%>

<p>아이디 : <%=id %></p>
<p>비밀번호 : <%=pwd %></p>
<p>이름 : <%=name %></p>
<p>이메일 : <%=email %></p>
<p>전화번호 : <%=tel1 %>-<%=tel2 %>-<%=tel3 %></p>
<p>	
	취미 : 
	<%
		for(int i=0; i<hobbyList.length; i++){
			out.println(hobbyList[i]);
		}
	%>
</p>
<p>성별 : <%=gender %></p>
<p>가입인사 : <%=comment %></p>