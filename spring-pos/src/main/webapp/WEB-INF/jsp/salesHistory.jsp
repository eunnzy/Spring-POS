<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</head>
<body>
	<table class="table table-priamry">
		<thead>
			<tr>
				<td>제품이름</td>
				<td>판매수량</td>
				<td>금액</td>
				<td>판매날짜</td>
				<td>결제수단</td>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="list" items="${salesList}">
				<tr>
					<td>${list.stockName}</td>
					<td>${list.amount}</td>
					<td>${list.price}</td>
					<td>${list.soldDate}</td>
					<td>${list.type}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>