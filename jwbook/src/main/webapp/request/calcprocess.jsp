<%@ page import="java.util.regex.Pattern"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h2>홀수/짝수를 판별하는 프로그램</h2>
	
<% 
	String num = request.getParameter("num");
	String regex = "[0-9]+"; // 정규표현식 (숫자만 가능)
	String result = "";
	
	if(num == "" || !Pattern.matches(regex, num)){ // 빈 공백 처리, 문자 처리
		out.println("<script>");
		out.println("alert('숫자를 입력해주세요.')");
		out.println("history.back()"); // 이전 페이지로 이동
		out.println("</script>");
	} else{ // 숫자 처리
		int number = Integer.parseInt(num);
		
		if(number % 2 == 0){
				result = "짝수";
			} else{
				result = "홀수";
			}
		}
%>

<p>결과는 <%=result %>입니다.</p>