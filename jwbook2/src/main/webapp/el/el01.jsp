<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL 언어</title>
</head>
<body>
	<h2>EL 언어 실습</h2>
	<h3>문자, 숫자 데이터 표기</h3>
	${100}<br>
	${"안녕하세요"}<br>
	${100+1}<br>
	
	<h3>산술 연산</h3>
	${10 + 4}<br>
	${10 - 4}<br>
	${10 * 4}<br>
	${10 / 4}<br>
	${10 % 4}<br>
	
	<h3>비교 연산</h3>
	${12 == 12}, ${12 eq 12}<br>
	${12 != 12}<br>
	${12 > 13}, ${12 gt 13}<br>
	${12 < 13}, ${12 lt 13}<br>
	
	<h3>논리 연산</h3>
	${not (12 == 12)}<br>
	${(12 == 12) && (12 > 13)}, ${(12 == 12) and (12 > 13)}<br>
	${(12 == 12) || (12 > 13)}, ${(12 == 12) or (12 > 13)}<br>
</body>
</html>