<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>제품판매</title>
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	<script src="/js/sales.js"></script>
	<link rel="stylesheet" href="/css/sales.css">
</head>
<body style="overflow:hidden;">
	<!-- 메누  -->
	<jsp:include page="menu.jsp" /> 
	
	<div class="main">
	<div class="container">
		<div class="row">
			<div class="col-6">
				<div class="stock_div mt-3">
					<c:forEach var="list" items="${stockList}">
						<button class="sales-btn btn btn-outline-primary" type="button"  onclick="btnOnclick('${list.stockName}', ${list.price})" value="${list.stockName}">
							<c:out value="${list.stockName}"/>
							<br>	
							<c:out value="현재 개수: ${list.amount}" />
						</button>
					</c:forEach>
				</div>
			</div>
			<div class="col-6">
				<div class="table-div mt-3">
					<table class="table table-primary" >
						<thead>
							<tr>
								<td><b>제품이름</b></td>
								<td><b>제품수량</b></td>
								<td><b>금액</b></td>						
							</tr>
						</thead>
						<tbody id="table-body">
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-6 mt-2">
				<div class="mt-3">
					<button class="btn-list btn btn-outline-primary"  type="button" onclick="salesHistory()">판매내역</button>
					<button class="btn-list btn btn-outline-primary" type="button" name="credit" id="credit" >카드결제</button> 
					<button class="btn-list btn btn-outline-primary" type="button" name="cash" id="cash">현금결제</button>
					<button class="btn-list btn btn-outline-primary" type="button" id="cancel" onclick="cancelBtn()">전체취소</button>
				</div>
			</div>
			<div class="col-6 mt-2">
				<div class="row">
					<div class="col-3 mt-2" >
						<label class="col-form-label"><h4>총금액</h4></label>
					</div>
					<div class="col-9 mt-2">
						<label type="text" class="total-label form-control" id="totalLabel" readonly> 0</label>
					</div>
				</div>
				<div class="row">
					<div class="col-3 mt-2" >
						<label" class="col-form-label"><h4>받은금액</h4></label>
					</div>
					<div class="col-9 mt-2">
						<input type="text" class="total-label form-control" id="getCash" > 
					</div>
				</div>
				<div class="row">
					<div class="col-3 mt-2" >
						<label class="col-form-label"><h4>거스름돈</h4></label>
					</div>
					<div class="col-9 mt-2">
						<label type="text" class="total-label form-control" id="exchange" readonly> 0</label>
					</div>
				</div>
			</div>
		</div>
		</div>
	</div>
	
	<script>
	$('#getCash').keydown(function() {
	    if (event.keyCode === 13) {
	        event.preventDefault();
	        let exchangeText = document.getElementById('exchange');
			let totalPrice = document.getElementById('totalLabel');  // 총 금액
			let getCash = document.getElementById('getCash').value; // 받은 금액
			
			console.log(getCash);
			
			let exchange = getCash - totalPrice.innerHTML;
			console.log(exchange);
			exchangeText.innerText = exchange;
	    }
	});
		
	</script> 
	
	<!-- cash -->
	<script>
	$(function(){
		$("#cash").click(function() {
			let type="현금결제";
			let table = document.getElementById('table-body');
			let stockName = []
			let amount = []
			let price = []
			
			for(let i=0; i < table.rows.length; i++) {
				stockName.push(table.rows[i].cells[0].innerHTML)
				amount.push(table.rows[i].cells[1].innerHTML) 
				price.push(table.rows[i].cells[2].innerHTML) 
			} 
		
	 		console.log(stockName);
	 		console.log(amount);
	 		console.log(price);
	 		
			$.ajax({
				type: "POST",
				data: { stockName : stockName, amount : amount, price : price, type : type },
				url: "/sales/pay",
				success: function(data) {
					window.location.reload();
				},
					error: function(jqXHR, textStatus, errorThrown) {
					console.log("error");
				}
			});
		});
	});
	</script>
	<!-- ajax로 테이블값들 controller로 보내기 -->
	<script>
	$(function(){
		$("#credit").click(function() {
			let type="카드결제";
			let table = document.getElementById('table-body');
			let stockName = []
			let amount = []
			let price = []
			
			for(let i=0; i < table.rows.length; i++) {
				stockName.push(table.rows[i].cells[0].innerHTML)
				amount.push(table.rows[i].cells[1].innerHTML) 
				price.push(table.rows[i].cells[2].innerHTML) 
			} 
		
	 		console.log(stockName);
	 		console.log(amount);
	 		console.log(price);
	 		
	 		
			$.ajax({
				type: "POST",
				data: { stockName : stockName, amount : amount, price : price, type : type },
				url: "/sales/pay",
				success: function(data) {
					window.location.reload();
				},
					error: function(jqXHR, textStatus, errorThrown) {
					console.log("error");
				}
			});
		});
	});
	</script>

</body>
</html>