<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>home</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	<script  src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="  crossorigin="anonymous"></script>
	<link rel="stylesheet" href="/css/index.css">
</head>
<body>
		<div class="container">
			<form action="/loginAction" method="post">
				<div class="login-form mx-auto">
				    <div class="mb-4 text-center">
						<h1 class="title-font"> <b>POS System</b> </h1>
					</div>
					<div class="mt-4 mb-3 text-center">
			            <div class="col-10 mx-auto">
			                <input type="id"  class="form-control" name="userId" id="userId" placeholder="ID" required>
			      		 </div>
	       		 	</div>
			     	<div class="mb-4">
			    		<div class="col-10 mx-auto">
			 				<input type="password" class="form-control" name="userPw" id="userPw" placeholder="Password" required>
			  			</div>
			   		</div>
			   		<c:if test="${result==0}">
			   		 	<div class="warning">아이디와 비밀번호를 다시 확인해주세요.</div>
			   		</c:if>
			       <div class="button-div" >
			         	<button class="loginButton" type="submit"> 로그인 </button>
			       </div> 
			       <div class="text-center mt-2">
			       		<a href="/register"> <b>직원등록하기</b></a>
			       </div>
		       </div>
			</form>
		</div>
	
</body>
</html>