<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>직원등록</title>
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<link rel="stylesheet" href="/css/register.css">
</head>
<body>
		<div class="container">
			<form action="register/complete.do" method="post">
				<div class="register-form col-md-12 mx-auto">
					<div class="text-center mb-5">
						<h3 class="title"><b>직원등록</b></h3>
					</div>	
					<div class="row mb-3 justify-content-center">
				    	<label class="col-md-2 col-form-label"><b>ID</b></label>
				            <div class="col-md-6">
				                <input type="text" class="form-control" name="userId" id="userId">
				      		 </div>
				      		 <div class="col-md-3">
				      		 	 <button class="btn btn-primary" type="button" onclick="idCheck();" >중복확인</button>
				      		 </div>
		       		 	</div>
				     	<div class="row mb-3 justify-content-center">
				  			<label class="col-md-2 col-form-label"><b>Password</b></label>
				    		<div class="col-md-6">
				 				<input type="password" class="form-control" name="userPw" id="userPw">
				  			</div>
				  			 <div class="col-md-3">  </div>
				   		</div>
				   		<div class="row mb-3 justify-content-center"">
				  			<label for="inputPassword3" class="col-md-2 col-form-label"><b>이름</b></label>
				    		<div class="col-md-6">
				 				<input type="text" class="form-control" name="userName" id="userName">
				  			</div>
				  			 <div class="col-md-3">  </div>
				   		</div>
				   		<div class="row mb-3 justify-content-center"">
				  			<label for="inputPassword3" class="col-md-2 col-form-label"><b>전화번호</b></label>
				    		<div class="col-md-6">
				 				<input type="text" class="form-control" name="userPhone" id="userPhone">
				  			</div>
				  			 <div class="col-md-3">  </div>
				   		</div>
				   		<div class="row mb-3 justify-content-center">
				  			<label class="col-md-2" ><b>직원유형</b></label>
		        	 			<div class="col-md-6">
					    			<input class="form-check-input" type="radio" name="userType" value="관리자" >
							       	<label class="form-check-label"> 관리자 </label>
						            <input class="form-check-input" type="radio" name="userType" value="직원" checked>
						            <label class="form-check-label" > 직원 </label>
					            </div>
					             <div class="col-md-3">  </div>
				   		</div>
				   		<div class="button-div" >
			         		<button class="registerBtn" type="submit"> 등록하기 </button>
			       		</div> 
			       </div>
				</form>
			</div>
		</div>
 <script>
	function idCheck() {
		userId = $("#userId").val();
		console.log(userId);
		$.ajax({
			type : "post",
			url : "/register/idCheck.do",
			data: { userId : userId },
			success: function(result) {
				console.log(result);
				alert(result);
			}
		})
	}
</script> 
</body>
</html>