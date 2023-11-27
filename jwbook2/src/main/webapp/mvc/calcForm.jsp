<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>계산기</title>
<style>
	body{font-family: Lucida Grande;}
	#container{width: 80%; margin: 30px auto; text-align: center;}
	button{padding: 5px; background-color: lightgray;}
</style>
</head>
<body>
	<div id="container">
		<h2>간단한 계산기</h2>
		<hr>
		<form action="/jwbook2/calc" method="get">
			<input type="text" name="n1" size="10">
			<select name="op">
				<option>+</option>
				<option>-</option>
				<option>÷</option>
				<option>x</option>
			</select>
			<input type="text" name="n2" size="10">
			<button type="submit">계산</button>
		</form>
	</div>
</body>
</html>