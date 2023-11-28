<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>점수 입력 폼</title>
<script>
	function check(){
		/* alert("test"); */
		let form = document.form1;
		let score = form.score.value;
		
		// 값이 입력되지 않았을 때, 처리
		// 문자가 입력되었을 때, 처리
		if(score == "" || isNaN(score)){
			alert("숫자를 입력해주세요.");
			score.focus();
			return false;
		} else{
			form.submit();
		}
	}
</script>
</head>
<body>
	<h3>📝 Enter Your Score !</h3>
	<hr>
	<form action="core02.jsp" method="post" name="form1">
		<p>
			Your Score <input type="text" name="score" size="5" maxlength="3" max="100">
			<input type="button" value="submit" onclick="check()">
		</p>
	</form>
</body>
</html>