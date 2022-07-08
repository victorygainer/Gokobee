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
<style type="text/css">

.container {
	width: 1000px
}

.content {
	display: grid;
	grid-template-columns: repeat(4, 1fr);
	gap: 10px;
}

.content img {
	width: 270px;
	height: 225px;
	margin-right: 20px;
	margin-bottom: 20px;
	display: block;
	margin: auto;
}

.content a {
	height: 500px;
	text-decoration: none;
	text-align: center;
	color: black;
	font-size: 16px;
	padding: 5px
}

.content h5 {
	white-space: normal;
}


#search-content-name {
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
				<a
					href="${pageContext.request.contextPath}/shop/view?n=${list.contentNum}">
					<hr> <img
					src="${pageContext.request.contextPath}${list.contentThumbImg}">
					<hr>
					<h5>[${list.cityCode}]&nbsp;${list.contentName}</h5>
					<hr>
					<p class="contentPrice">
						<span>가격:&nbsp;</span>
						<fmt:formatNumber pattern="###,###,###"
							value="${list.contentPrice}" />
						원
					</p>
					<hr>
					<p>${list.contentSum}</p>
					<hr>
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


