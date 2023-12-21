<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Web Market | Member Account</title>
</head>
<body>
	<jsp:include page="../header.jsp" />
	
	<div class="container">
		<h2 class="my-3">Account</h2>
		
		<form action="#" method="post"> 
			<div class="row g-2">
				<label for="formGroupExampleInput" class="form-label mt-3 mb-0">성명</label>
				<div class="col-3">
			    	<input type="text" class="form-control" placeholder="성" aria-label="First name">
			  	</div>
			  	<div class="col-3">
			    	<input type="text" class="form-control" placeholder="이름" aria-label="Last name">
			 	</div>
			 </div>
			 <div class="row g-2">
	    		<label for="inputEmail4" class="form-label mt-3 mb-0">이메일</label>
				<div class="col-6">
	    			<input type="email" class="form-control" id="inputEmail4">
	  			</div>
	  		 </div>
			 <div class="row g-2">
	    		<label for="inputPassword4" class="form-label mt-3 mb-0">비밀번호</label>
				<div class="col-6">
	    			<input type="password" class="form-control" id="inputPassword4">
	  			</div>
	  		 </div>
			 <div class="row g-2">
	    		<label for="inputAddress" class="form-label mt-3 mb-0">주소</label>
				<div class="col-6">
	    			<input type="text" class="form-control" id="inputAddress" placeholder="기본 주소">
	  			</div>
	  			<div class="col-4">
	    			<input type="text" class="form-control" id="inputAddress" placeholder="상세 주소">
	    		</div>
	    		<div class="col-2">
	    			<input type="text" class="form-control" id="inputZip" placeholder="우편 번호">
	    		</div>
	  		 </div>
	  	</form>
	 </div>
	
	<jsp:include page="../footer.jsp" />
</body>
</html>