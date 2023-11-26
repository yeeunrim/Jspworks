<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="addrBook" class="addressbook.AddrBook" />
<!-- setBnum()과 같다. setter -->
<jsp:setProperty property="bnum" name="addrBook" />
<jsp:setProperty property="username" name="addrBook" />
<jsp:setProperty property="tel" name="addrBook" />
<jsp:setProperty property="email" name="addrBook" />
<jsp:setProperty property="gender" name="addrBook" />
<jsp:useBean id="abDAO" class="addressbook.AddrBookDAO" scope="application" />

<%
	// 수정 처리 메서드 호출
	// getter
	abDAO.updateAddrBook(addrBook);

	out.println("<script>");
	out.println("alert('주소를 수정했습니다.')");
	out.println("loacation.href='addrList.jsp'"); // 주소 목록 페이지
	out.println("</script>"); 
%>