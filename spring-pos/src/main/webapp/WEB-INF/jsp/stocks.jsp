<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>재고 관리</title>
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="/css/stocks.css">
</head>
<body>
	<jsp:include page="menu.jsp" /> 
	<div class="main">
		<div class="container">
			<div class="stocks-div col-12">
				<div class="add-btn mb-4 mt-3">
					<a class="btn btn-primary" href="stocks/addNewStock">제품추가</a>
					<button class="btn btn-primary" onclick="addStockBtn()">제품입고</button>
					<button class="btn btn-primary" onclick="modifyStockBtn()">제품수정</button>
				</div>
					<table class="table table-primary">
						<thead>
							<tr>
								<td> <b> 제품 번호 </b> </td>
								<td> <b> 제품 이름 </b> </td>
								<td> <b> 현재 수량 </b> </td>
								<td> <b> 제품 가격 </b> </td>
								<td> <b> 입고(수정) 날짜</b> </td>
								<td> <b> 제품 상태 </b> </td>
								<td> <b> 상태 변경 </b> </td>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="list" items="${stockList}">
							<tr>
								<td><c:out value="${list.stockId}"/> </td>
								<td><c:out value="${list.stockName}"/> </td>
								<td><fmt:formatNumber value="${list.amount}" pattern="###,###,###"/></td>
								<td><fmt:formatNumber value="${list.price}" pattern="###,###,###"/> </td>
								<td><c:out value="${list.regDate}"/> </td>
								<c:choose>
									<c:when test="${list.available == 1}">
										<td>판매가능</td>
									</c:when>
									<c:otherwise>    
										<td>판매불가</td>
									</c:otherwise>
								</c:choose>
								<td><button class="availableBtn btn btn-danger btn-sm">판매가능</button>
								<button class="deleteBtn btn btn-danger btn-sm">판매불가</button></td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			</div>
		</div>
	</div>
	 <!-- 판매가능 -->
	<script>
	$(".availableBtn").click(function(){ 
		let table = document.getElementById('table-body');
		let tr = $(this).parent().parent();
		let td = tr.children();
		let rowIndex = tr.index();
		
		let stockId = td.eq(0).text();
		console.log(stockId);
		
		$.ajax({
			type: "POST",
			data: { stockId : stockId },
			url: "/stocks/availableStock", 
			success : function(result) {
				window.location.reload();
			}
			
		});
		
	});
	
	</script> 
	<!-- 판매 불가 -->
	<script>
	$(".deleteBtn").click(function(){ 
		let table = document.getElementById('table-body');
		let tr = $(this).parent().parent();
		let td = tr.children();
		let rowIndex = tr.index();
		
		let stockId = td.eq(0).text();
		console.log(stockId);
		
		$.ajax({
			type: "POST",
			data: { stockId : stockId },
			url: "/stocks/deleteStock",
			success : function(data) {
				window.location.reload();
			},
			error: function(jqXHR, textStatus, errorThrown) {
				console.log("error");
			}
		
		});
		
	});
	</script>
	<!--  제품 입고 -->
	<script>
	 	function addStockBtn() {
	 		let addStockUrl = "/stocks/addStock";
			let option = "width = 550px, height=450px, top=100px, left=450px, scrollbars=yes";
			
			window.open(addStockUrl,"제품 입고", option);	
	 	}
	</script>
	<!-- 제품 수정 -->
	<script>
	 	function modifyStockBtn() {
	 		modifyUrl = "/stocks/modifyStock";
			let option = "width = 550px, height=450px, top=100px, left=450px, scrollbars=yes";
			
			window.open(modifyUrl,"제품 수정", option);	
	 	}
	</script>
</body>
</html>