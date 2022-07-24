<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>제품 수정</title>
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
	<div class="container">
		<div>
			<h5><b>제품수정</b></h5>
		</div>
		<div>
			<form action="/stocks/modifyStock/modifyComplete" method="post"  id="modify-form">
				<div class="row mt-2 mb-2">
					<label class="col-sm-2 col-form-label">제품ID</label>
			            <div class="col-sm-2">
			                <input type="text" class="form-control" name="stockId" id="stockId">
			      		 </div>
	   		 	</div>
	   		 	<div class="row mb-2">
	       		 	<label class="col-sm-2 col-form-label">수량</label>
			            <div class="col-sm-2">
			                <input type="text" class="form-control" name="amount" id="amount">
			      		 </div>
	   		 	</div>
	   		 	<div class="row mb-2">
	       		 	<label class="col-sm-2 col-form-label">가격</label>
			            <div class="col-sm-2">
			                <input type="text" class="form-control" name="price" id="price">
			      		 </div>
	   		 	</div>
	   		 	 <div class="col-5 mt-3" >
				         	<button class="btn btn-primary" type="button" id="modifyBtn">제품수정</button>
			       </div> 
			</form>
		</div>
	</div>
	<script>
	$(document).ready(function(){
		$("#modifyBtn").on("click", function() {
			stockId = $('#stockId').val();
			
			$.ajax({
				type: "post",
				url:  "/stocks/idCheck",
				data: {stockId : stockId},
				success: function(data) {
					if(data == 1) {
						if(confirm("제품을 수정하시겠습니까?")){
							$("#modify-form").submit();
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