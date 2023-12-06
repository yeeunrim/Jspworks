<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 중복 검사</title>
<script src="../resources/js/jquery-3.7.1.js"></script>
<script>
	$(function(){
		$("#message").css("color", "red");
		$("#message").css("font-size", "10px");
	});
	
	function checkId(){
		// alert("test");
		if($("#id").val() == ""){
			alert("아이디를 입력해주세요.");
			// input의 선택자(id)의 값을 사용
			id.focus();
			return false;
		} else {
			$.ajax({
				type: "get",
				dataType: "text",
				url: "/member/checkid", // http://localhost:8080/member/checkid.jsp
				data: {id: $("#id").val()}, // id 속성이 서버로 전달됨
				success: function(data){
					if(data == "usable"){
						$("#btnChk").attr("value", "Y");
						$("#message").text("사용할 수 있는 ID 입니다.");
					} else{
						$("#message").text("사용할 수 없는 ID 입니다.");
					}
				},
				error: function(){
					alert("에러 발생");
			}
		});
	}
</script>
<style>
	input{margin: 5px;}
	input[type="button"]{padding: 7px; font-size: 12px; background-color: rgb(211, 211, 211);}
</style>
</head>
<body>
	<h3>ID 중복 검사</h3>
	<p>
		<input type="text" id="id" autofocus>
		<input type="button" value="ID 중복" onclick="checkId()">
	</p>
	<div id="message"></div>
</body>
</html>