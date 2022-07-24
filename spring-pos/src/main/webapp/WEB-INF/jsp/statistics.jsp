<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>매출</title>
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
	<jsp:include page="menu.jsp" /> 
	<div class="main">
		<div class="container">
			<ul class="nav nav-tabs mt-4" id="myTab" role="tablist">
			  <li class="nav-item" role="presentation">
			    <button class="nav-link active" id="product-tab" data-bs-toggle="tab" data-bs-target="#product" type="button" role="tab" aria-controls="product" aria-selected="true">제품별통계</button>
			  </li>
			  <li class="nav-item" role="presentation">
			    <button class="nav-link" id="date-tab" data-bs-toggle="tab" data-bs-target="#date" type="button" role="tab" aria-controls="date" aria-selected="false">날짜별통계</button>
			  </li>
			</ul>
			<div class="tab-content" id="myTabContent">
			  	<div class="tab-pane fade show active" id="product" role="tabpanel" aria-labelledby="product-tab">  
			  		<div class="table-div mt-3">
				  		<table class="table table-primary">
				  			<thead>
				  				<tr>
				  					<td>제품이름</td>
				  					<td>팔린수량</td>
				  					<td>팔린금액</td>
				  				</tr>
				  			</thead>
				  			<tbody>
				  				<c:forEach var="list" items="${list}" >
					  				<tr>
										<td><c:out value="${list.stockName}"/></td>
										<td><fmt:formatNumber value="${list.amount}" pattern="###,###,###"/></td>
										<td><fmt:formatNumber value="${list.price}" pattern="###,###,###"/></td>
					  				</tr>
				  				</c:forEach>
				  			</tbody>
				  		</table>
			  		</div>
			  	</div>
			  	
			  
		 		<div class="tab-pane fade" id="date" role="tabpanel" aria-labelledby="contact-tab">
				 	<div class="col-3 mt-3">
				 		<form name="search-form">
					 		<div class="input-group">
					 			<input type="text" class="form-control input-md search-text" id="findInput" placeholder="2022-06-01 형식으로 검색" />
						        	<span class="input-group-btn">
						             <button class="btn btn-info btn-md text-centers search-btn" id="searchBtn" type="button">검색</button>
						       	</span>
				 			</div>
			 			</form>
					 </div>
					 <div class="table-div mt-3">
					 	<table class="table search-table table-primary">
					 		<thead>
					 			<tr>
				  					<td>제품이름</td>
				  					<td>팔린수량</td>
				  					<td>팔린금액</td>
				  					<td>팔린날짜</td>
				  				</tr>
					 		</thead>
					 		<tbody class="table-body">
					 		</tbody>
					 	</table>
					 </div>
					 <div class="totalDiv row">
					 	<div class="col-1 mt-2" >
					 		<label class="col-form-label"><h5>총금액</h5></label>
					 	</div>
					 	<div class="col-2 mt-2">
					 		<input type="text" class="form-control" id="total"  value="0" readonly>
					 	</div>
					 </div>
				</div>
		</div>
	</div>
	
	
	
	<script>
	$(function(){
		$("#searchBtn").click(function() {
			let soldDate = document.getElementById('findInput').value;
			
			$.ajax({
				type: "post",
				url : "/statistics/findSoldDate",
				data : {soldDate : soldDate},
				success : function(result){
					console.log(soldDate);
					$('.table-body').empty();
					
					console.log(result);
					let totalPrice = 0;
				 	if(result.length>=1){
						result.forEach(function(item){
							str='<tr>'
							str += "<td>"+item.stockName+"</td>";
							str+="<td>"+item.amount+"</td>";
							replacePrice = item.price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
							str+="<td>"+replacePrice +"</td>";
							str+="<td>"+item.soldDate+"</td>";
							str+="</tr>"
							$('.table-body').append(str);
							totalPrice += item.price;
		        		});		
						
					} 
				 	totalPrice = totalPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
				 	$("#total").val(totalPrice);
				}
			});
		});
	});
	</script>
</body>
</html>