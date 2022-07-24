<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<title>제품추가</title>
	<link rel="stylesheet" href="/css/addNewStock.css">
</head>
<body>
	<jsp:include page="menu.jsp" /> 
	
	<div class="main">
		<div class="container">
			<form action="/stocks/addNewStock.do"  method="post" id="addStock-form">
				<div class="addStock-form  col-sm-10 mx-auto">
					<div class="title-div mb-5">
						<h3 class="title"><b>새로운 제품 추가</b></h3>
					</div>
					<div class="row mb-3 justify-content-center">
				    	<label class="col-sm-2 col-form-label"><b>제품코드</b></label>
				            <div class="col-sm-5">
				                <input type="text" class="form-control" name="stockId" id="stockId" required>
				      		 </div>
		       		 </div>
					<div class="row mb-3 justify-content-center">
				    	<label class="col-sm-2 col-form-label"><b>제품이름</b></label>
				            <div class="col-sm-5">
				                <input type="text" class="form-control" name="stockName" id="stockName" required>
				      		 </div>
		       		 </div>
				     <div class="row mb-3 justify-content-center">
				  			<label class="col-sm-2 col-form-label"><b>제품수량</b></label>
				    		<div class="col-sm-5">
				 				<input type="text" class="form-control" name="amount" id="amount" required>
				  			</div>
				   	</div>
				   	<div class="row mb-3 justify-content-center">
				  			<label for="inputPassword3" class="col-sm-2 col-form-label"><b>제품가격</b></label>
				    		<div class="col-sm-5">
				 				<input type="text" class="form-control" name="price" id="price" required>
				  			</div>
				   	</div>
				   		<div class="button-div" >
			         		<button class="stockBtn" type="button" id="addNewBtn"> 등록하기 </button>
			       		</div> 
				   	</div>
				</form>
			</div>
		</div>
	</div>
	
	<script>
	$(document).ready(function(){
		$("#addNewBtn").on("click", function() {
			stockId = $('#stockId').val();
			
			$.ajax({
				type: "post",
				url:  "/stocks/idCheck",
				data: {stockId : stockId},
				success: function(data) {
					if(data == 1) {
						alert("이미 사용하고 있는 제품코드 입니다.");
						window.location.reload();
					}else {
						if(confirm("제품을 추가하시겠습니까?")){
							$("#addStock-form").submit();
						}
					}
				}
			})
		})
	})
	</script>
	
</body>
</html>