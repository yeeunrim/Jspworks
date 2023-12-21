<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Web Market | Product Registration</title>
<script src="../resources/js/validation.js"></script>
</head>
<body>
	<jsp:include page="../header.jsp" />
	
	<div class="container">
		<h2 class="my-3">Product Reg.</h2>
		
		<div class="row">
			<form action="/insertproduct.do" method="post" enctype="multipart/form-data" name="newProduct"> 
				<div class="form-group row my-3">
					<label class="col-2">상품 코드</label>
					<div class="col-3">
						<input type="text" id="pid" name="pid" class="form-control" placeholder="ex) P0001, P0002">
					</div>
				</div>
				<div class="form-group row my-3">
					<label class="col-2">상품 이름</label>
					<div class="col-3">
						<input type="text" id="pname" name="pname" class="form-control">
					</div>
				</div>
				<div class="form-group row my-3">
					<label class="col-2">상품 가격</label>
					<div class="col-3">
						<input type="text" id="price" name="price" class="form-control">
					</div>
				</div>
				<div class="form-group row my-3">
					<label class="col-2">상품 설명</label>
					<div class="col-4">
						<textarea rows="2" cols="40" name="description" class="form-control"></textarea>
					</div>
				</div>
				<div class="form-group row my-3">
					<label class="col-2">상품 분류</label>
					<div class="col-3">
						<input type="text" name="category" class="form-control">
					</div>
				</div>
				<div class="form-group row my-3">
					<label class="col-2">상품 재고</label>
					<div class="col-3">
						<input type="text" id="pstock" name="pstock" class="form-control">
					</div>
				</div>
				<div class="form-group row my-3">
					<label class="col-2">상품 상태</label>
					<div class="col-3">
						<label><input type="radio" name="condition" value="New" class="form-check-input" checked>&nbsp;신상품</label>
						<label><input type="radio" name="condition" value="Old" class="form-check-input">&nbsp;중고품</label>
					</div>
				</div>
				<div class="form-group row my-3">
					<label class="col-2">상품 이미지</label>
					<div class="col-3">
						<input type="file" name="pimage" class="form-control">
					</div>
				</div>
				<div class="form-group row my-3">
					<div class="col-3">
						<input type="button" value="등록" class="btn btn-secondary" onclick="checkProduct()">
					</div>
				</div>
			</form>
		</div>
	</div>
	
	<jsp:include page="../footer.jsp" />
</body>
</html>