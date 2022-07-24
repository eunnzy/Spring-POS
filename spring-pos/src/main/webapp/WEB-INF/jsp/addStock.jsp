<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<title>제품추가</title>
</head>
<body>	
		<div class="container">
			<div>
				<h5><b>제품입고</b></h5>
			</div>
			<form action="/stocks/addStock/addComplete" method="post" id="addStock-form">
				<div class="register-form">
					<div class="row mb-3">
				    	<label class="col-sm-3 col-form-label">제품 ID</label>
				            <div class="col-sm-3">
				                <input type="text" class="form-control" name="stockId" id="stockId">
				      		 </div>
		       		 	</div>
				     	<div class="row mb-3">
				  			<label class="col-sm-3 col-form-label">입고 수량</label>
				    		<div class="col-sm-3">
				 				<input type="text" class="form-control" name="amount" id="amount">
				  			</div>
				   		</div>
				       <div class="col-5 mt-3" >
				         	<button class="btn btn-primary" type="button" id="addBtn">제품입고</button>
				       </div> 
				</div>
			</form>
		</div>
	<script>
	$(document).ready(function(){
		$("#addBtn").on("click", function() {
			stockId = $('#stockId').val();
			
			$.ajax({
				type: "post",
				url:  "/stocks/idCheck",
				data: {stockId : stockId},
				success: function(data) {
					if(data == 1) {
						if(confirm("제품을 입고하시겠습니까?")){
							$("#addStock-form").submit();
						}
					}else {
						alert("제품코드를 확인해주세요");
						window.location.reload();
					}
				}
			})
		})
	})
	</script>
</body>
</html>