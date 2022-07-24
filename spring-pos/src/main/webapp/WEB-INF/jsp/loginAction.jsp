<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>home</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<title>loginAction</title>
	<style>
		.photo-div{
			margin-top:50px;
		
		}
		.title {
			font-size: 70px;
    		font-weight: 500;
    		color:  #6AAFE6;
    		font-family: 'Black Han Sans', sans-serif;
		}
		#photo {
			 width:700px; 
			 height:500px;
		 
		}
	</style>
</head>
<body>
	<jsp:include page="menu.jsp" /> 
	
	<div class="main text-center">
		<div class="photo-div">
			<h3 class="title">Welcome <br> POS System!</h3>
			<img src="/img/photo.jpg" alt="welcome" id="photo">
		</div>
	</div>
</body>
</html>