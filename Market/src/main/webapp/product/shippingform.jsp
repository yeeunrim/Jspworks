<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Web Market | Shipping Info.</title>
<script src="../resources/js/validation.js"></script>
</head>
<body>
	<jsp:include page="../header.jsp" />
	
	<div class="container">
		<h2 class="my-3">Shipping Info.</h2>
		
		<div class="row">
			<form action="/shippinginfo.do" method="post"> 
				<input type="hidden" name="cartId" value="${cartId}">
				<div class="form-group row my-3">
					<label class="col-2">성명</label>
					<div class="col-3">
						<input type="text" name="sname" class="form-control">
					</div>
				</div>
				<div class="form-group row my-3">
					<label class="col-2">배송일</label>
					<div class="col-3">
						<input type="text" name="shippingdate" class="form-control" placeholder="ex) YYYY/MM/DD">
					</div>
				</div>
				<div class="form-group row my-3">
					<label class="col-2">우편번호</label>
					<div class="col-3">
						<input type="text" name="zipcode" class="form-control">
					</div>
				</div>
				<div class="form-group row my-3">
					<label class="col-2">주소</label>
					<div class="col-4">
						<input type="text" name="address" class="form-control">
					</div>
				</div>
				</div>
				<div class="form-group row my-3">
					<div class="col-3">
						<input type="submit" value="등록" class="btn btn-secondary bg-dark bg-gradient">
					</div>
				</div>
			</form>
		</div>
	</div>
	
	<jsp:include page="../footer.jsp" />
</body>
</html>