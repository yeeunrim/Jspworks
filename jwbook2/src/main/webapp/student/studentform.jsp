<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생 등록</title>
<link rel="stylesheet" href="../resources/css/style.css">
</head>
<body>
	<section id="content">
		<h2>Student Registration</h2>
		<hr>
		<form action="/insertstudent.do" method="post">
			<ul>
				<li>	
					<label>Name</label>
					<input type="text" name="username">
				</li>
				<li>	
					<label>University</label>
					<input type="text" name="univ">
				</li>
				<li>	
					<label>Birthday</label>
					<input type="date" name="birth" class="birth">
				</li>
				<li>	
					<label>Email</label>
					<input type="email" name="email">
				</li>
			</ul>
			<div>
				<button type="submit">Submit</button>
				<button type="reset">Reset</button>
			</div>
		</form>
	</section>
</body>
</html>