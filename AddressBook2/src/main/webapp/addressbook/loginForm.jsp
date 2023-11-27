<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AddressBook login</title>
<link rel="stylesheet" href="../resources/css/style.css">
</head>
<body>
	<div id="container">
		<h2>Login Page</h2>
		<hr>
		<p>
			<a href="../index.jsp">Main</a>
		</p>
		<form action="loginProcess.jsp" method="post">
			<table id="tbl_login">
				<tr>
					<td><label>Email </label></td>
					<td><input type="text" name="email" required 
						autofocus="autofocus" size="30" maxlength="30"></td>
				</tr>
				<tr>
					<td colspan="2" id="btn2">
						<input type="submit" value="Login">
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>