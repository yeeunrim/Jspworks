<%@page import="addressbook.AddrBook"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AddressBook List</title>
<link rel="stylesheet" href="../resources/css/style.css">
</head>
<body>
	<jsp:useBean id="abDAO" class="addressbook.AddrBookDAO" scope="application" />
	
	<%
		// 세션이 없는 경우, 로그인하도록 알림창 띄움
		String sessionId = null; 
		if(session.getAttribute("sessionId") != null){
			// 세션 가져와서 유지함
			sessionId = (String)session.getAttribute("sessionId");
		} else{
			out.println("<script>");
			out.println("alert('로그인을 해주세요.')");
			out.println("location.href='loginForm.jsp'");
			out.println("</script>"); 
		}
	%>
	<div id="container">
		<h2>Address List</h2>
		<hr>
		<p>
			<a href="logout.jsp" id="accent">
				👤 <span class="accent"><%=session.getAttribute("sessionName")%></span>님 [Logout]
			</a>
		</p>
		<table id="tbl_list">
			<thead>
				<tr>
					<th>Number</th>
					<th>Name</th>
					<th>Tel</th>
					<th>Email</th>
					<th>Gender</th>
					<th>Registration Date</th>
					<th>View</th>
				</tr>
			</thead>
			<tbody>
				<%
					for(int i=0; i<abDAO.getListAll().size(); i++){
						AddrBook addrBook = abDAO.getListAll().get(i);
				%>
				<tr>
					<td><%=addrBook.getBnum() %></td>
					<td><%=addrBook.getUsername() %></td>
					<td><%=addrBook.getTel() %></td>
					<td><%=addrBook.getEmail() %></td>
					<td><%=addrBook.getGender() %></td>
					<td><%=addrBook.getDate() %></td>
					<td>
						<a href="addrView.jsp?bnum=<%=addrBook.getBnum() %>">
							<button type="button">View</button>
						</a>
					</td>
				</tr>
				<% } %>
			</tbody>
		</table>
	</div>
</body>
</html>