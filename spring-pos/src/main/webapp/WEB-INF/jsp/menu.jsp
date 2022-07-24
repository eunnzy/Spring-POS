<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<link rel="stylesheet" href="/css/menu.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Hahmlet:wght@300&display=swap" rel="stylesheet">
<div class="sidebar">

		<a href="/sales">판매하기</a>  	<!-- 판매 페이지 -->
		<c:if test="${user.userType == '관리자'}">
			<a href="/stocks">재고관리</a>  	<!-- 재고관리 페이지  -->
		</c:if>
		<a href="/statistics">매출관리</a>  <!-- 매출관리 페이지  -->
		
		<c:if test="${user != null}"> 		
			<div class="user-login">
			    ${user.userName}님 (${user.userType})
			  <a href="/logout.do" style="font-size:15px;">로그아웃</a>
			  <a href="/changePassword" style="font-size:15px;">비밀번호변경</a>
			</div>
		</c:if>
</div>