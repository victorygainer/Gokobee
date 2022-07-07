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

html, body {
	margin: 0;
	padding: 0;
	height: 100%;
}

nav {
	margin-bottom: 50px;
}

btn btn-outline-dark
		#wrap {
	position: relative;
	padding-bottom: 50px;
	margin: auto;
	text-align: center;
}

a {
	text-decoration: none;
	color: black;
	content-align: center;
}

a:hover {
	font-weight: 900;
}

footer {
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

@
keyframes scaleImage { 100% {
	transform: scale(1);
}

}
@
keyframes fadeInText { 100% {
	opacity: 1;
}

}
section#content ul li {
	display: inline-block;
	margin: 10px;
}

section#content div.contentThumb img {
	width: 200px;
	height: 200px;
}

section#content div.contentName {
	padding: 10px 0;
	text-align: center;
}

section#content div.contentName a {
	color: #000;
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

		<div class="content">
			<c:forEach items="${list}" var="list">
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


