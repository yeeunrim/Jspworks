<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ADDRESSBOOK REGISTRATION</title>
<link rel="stylesheet" href="../resources/css/style.css">
</head>
<body>
	<div id="container">
		<h2>AddressBook Registration</h2>
		<hr>
		<p>
			<a href="../index.jsp">Address Main</a>
		</p>
		<form action="addrAdd.jsp" method="post">
			<table id="tbl_reg">
				<tr>
					<td><label>Name </label></td>
					<td><input type="text" name="username" required></td>
				</tr>
				<tr>
					<td><label>Tel. </label></td>
					<td>
						<input type="text" name="tel">
					</td>
				</tr>
				<tr>
					<td><label>Email </label></td>
					<td><input type="text" name="email" required></td>
				</tr>
				<tr>
					<td><label>Gender </label></td>
					<td>
						<select name="gender">
							<option selected>Male</option>
							<option>Female</option>
						</select>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="Submit">
						<input type="reset" value="Reset">
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>