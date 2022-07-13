<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link rel="icon" href="./img/logo.png"/>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js">
	<script type="text/javascript" src="./contentSearch"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<style type="text/css">
		html, body {
		    margin: 0;
		    padding: 0;
		    height: 100%;
		}	
		nav{
			margin-bottom: 10px;
		}
		
		btn btn-outline-dark
		#wrap{
		    position: relative;
		    padding-bottom: 50px;
		    margin:auto;
		    text-align:center;
		}
		a{
			text-decoration: none;
			color: black;
		}
		a:hover{
			font-weight: 900;
		}
		footer{
			position: relative;
			bottom: 0;
		}
		.text {		
		    display: flex;
		    justify-content: center;
		    align-items: center;
		    height: 100%;
		    font-family: 'Roboto', Arial, sans-serif;
		    font-size: 40px;
		    font-weight: bold;
		    line-height: 1.2;
		    letter-spacing: 0.05em;
		    white-space: nowrap;
		    text-transform: uppercase;
		    color: #fff;
		    background-color: #000;
		    mix-blend-mode: multiply;
		    opacity: 0;
		    animation: fadeInText 3s 2s ease-out forwards;		
		}
		@keyframes scaleImage {
		    100% {
		        transform: scale(1);
		    }
		}
		@keyframes fadeInText {
		    100% {
		        opacity: 1;
		    }
		}
    </style>
<title>Insert title here</title>
</head>
<body>
<!-- Navigation-->
<c:if test="${userInfo != null}">
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<div class="container px-4 px-lg-5">
				<a class="navbar-brand" href="${pageContext.request.contextPath}/shop/list" style="margin-right:30px;">MY TRIP</a>
				<form action="contentSearch.nhn" class="d-flex"
					style="margin-right: 20px;">
					<input id="item" name="item" class="form-control me-2" type="text"
						placeholder="Search" autocomplete="off">
					<button class="btn btn-dark" name="item-submit" id="item-submit"
						type="submit">Search</button>
				</form>
				<!-- 글쓰기 버튼 -->
				<ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4" style="text-align:center;">
					<li class="btn btn-light"><a class="nav-link"
						href="${pageContext.request.contextPath}/contentRegister?userID=${userInfo.userID}">여행 등록하기</a></li>
				</ul>
				<ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
					<li class="btn btn-light">
						<a class="nav-link" href="${pageContext.request.contextPath}/admin/contentList?userID=${userInfo.userID}">여행지 관리</a></li>
				</ul>
				<ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
					<li class="btn btn-light">
						<a class="nav-link" href="${pageContext.request.contextPath}/admin/myContentResList?userID=${userInfo.userID}">여행상품 주문 현황</a></li>
				</ul>
				<form action="logout.nhn">
					<button class="btn btn-outline-dark" type="submit"
						style="margin: 10px">
						<a href="${pageContext.request.contextPath}/logout" style="text-decoration: none; color: black;">로그아웃</a>
					</button>
			</form>
		</div>
	</nav>
</c:if>  
</body>
</html>