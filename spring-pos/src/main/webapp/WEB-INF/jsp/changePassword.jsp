<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>비밀번호변경</title>
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="/css/changePw.css">
</head>
<body>
	<jsp:include page="menu.jsp" /> 
	<div class="main">
		<div class="container">
			<form  action="/changeComplete.do" method="post" id="change-form">
				<div class="change-form col-md-10 mx-auto" >
					<div class="text-center mb-5">
						<h4 class="title">회원 비밀번호 변경</h4>
					</div>
					<div class="row mb-3 justify-content-center">
				    	<label class="col-md-4 col-form-label"><b>ID</b></label>
				            <div class="col-md-6">
				                <input type="text" class="form-control" name="userId" id="userId" value="${user.userId}" readonly>
				      		 </div>
		       		 	</div>
				   		<div class="row mb-3 justify-content-center">
				  			<label class="col-md-4 col-form-label"><b>변경할 비밀번호</b></label>
				    		<div class="col-md-6">
				 				<input type="password" class="form-control" id="newPw" name="newPw" required>
				  			</div>
				   		</div>
				   		<div class="row mb-3 justify-content-center">
				  			<label class="col-md-4 col-form-label"><b>변경할 비밀번호 확인</b></label>
				    		<div class="col-md-6">
				 				<input type="password" class="form-control" id="newPwConfirm" name="newPwConfirm" required>
				  			</div>
				   		</div>
				       <div class="button-div" >
				         	<button class="change-btn" type="button" id="changeBtn" name="changeBtn">변경하기 </button>
				       </div> 
			       </div>
				</form>
			</div>
		</div>
		
		<script>
		$(document).ready(function(){
			$("#changeBtn").on("click", function(){
				if ($("#newPw").val() != $("#newPwConfirm").val()) {
					alert("변경비밀번호가 일치하지 않습니다.");
					window.location.reload();
					return false;
				}
				
				userId = $("#userId").val();
				newPw = $("#newPw").val();
			
				console.log(userId +" " + newPw);
				
				$.ajax({
					url : "/changePw.do",
					type : "POST",
					data : {userId: userId, newPw : newPw},
					success: function(data){
						if(data==0){
							alert("비밀번호를 변경할 수 없습니다.");
							return;
						}else{
							if(confirm("비밀번호를 변경하시겠습니까?")){
								$("#change-form").submit();
							}
							
						}
					}
				})
				
			})
		})
		</script>
</body>
</html>