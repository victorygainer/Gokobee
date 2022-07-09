<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="./img/logo.png" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/list.css"/>

<style type="text/css">
	.jumbotron {
		text-align: center;
	}

</style>
<title>MY TRIP</title>
</head>
<body>

	<!-- nav -->
	<div class="container">
		<nav id="nav">
			<div id="nav_box">
				<%@ include file="../include/nav.jsp"%>
			</div>
		</nav>
		<h1 class="jumbotron" id="search-content-name">${contentName}</h1>
		<hr>
		<div class="content">
			<c:forEach items="${searchList}" var="list">
				<a href="${pageContext.request.contextPath}/shop/view?n=${list.contentNum}">
					<div class="card">
					<input type="checkbox" name="chBox" class="chBox">
						<img class="card-img-top"					 							
							src="${pageContext.request.contextPath}${list.contentThumbImg}"
							alt="Card image cap">
						<div class="card-body">
							<p class="content-cateCode">${list.cateCode} · ${list.cityCode}</p>
							<h6 class="card-title">[${list.cityCode}]&nbsp;${list.contentName}</h6>
							<br/>
							<p class="contentPrice">
							<span>가격:&nbsp;</span>
							<fmt:formatNumber pattern="###,###,###"
											  value="${list.contentPrice}" 
						    />원 / 1인</p>
						</div>
					</div>
				</a>
			</c:forEach>
		</div>

		<!-- footer -->
		<footer id="footer">
			<div id="footer_box">
				<%@ include file="../include/footer.jsp"%>
			</div>
	</div>

	</footer>

</body>
</html>


