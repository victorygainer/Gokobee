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
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.js"
			integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
			crossorigin="anonymous"></script>
	<style type="text/css">
.container {
	width: 500px;
}

.content {
	display: grid;
	grid-template-columns: repeat(4, 1fr);
	gap: 10px;
	margin: 10px;
}

.content a {
	width: 290px;
	height: 350px;
	text-decoration: none;
	color: black;
	font-size: 13px;
	margin: 0px;
	padding: 0px;
	z-index: 1;
}

.content img {
	height: 200px;
	display: block;
	margin: 0px;
}

.content p {
	margin: 0px;
}

.card-body {
	cell-padding: 0px;
	margin: 0px;
}

.chBox {
	position: relative;
	z-index: 3;
	text-align:center;
	top: 5px;
	left: 58px;
	zoom: 2.0;

}

.card{
	position: relative;
	width: 290px;
	height: 350px;
}

.card-img-top {
	position: relative; 
	z-index: 2;
	top: -27px;
}

.card-body {
	position: relative; 
	z-index: 4;
	bottom: 25px;
}
</style>
<title>위시리스트</title>
</head>
<body> 
<div class="container">
	<nav id="nav">
		<div id="nav_box">
			<%@ include file = "../include/nav.jsp" %>
		</div>
	</nav>

<!-- Main -->
	<div class="content">
		<c:forEach items="${wishList}" var="wishList">
			<a href="${pageContext.request.contextPath}/shop/view?n=${wishList.contentNum}">
				<div class="card">
				<input type="checkbox" name="chBox" class="chBox" checked="checked"
				data-wlNum="${wishList.contentNum}" onclick="deleteWishList()"/>
					<img class="card-img-top"					 							
						src="${pageContext.request.contextPath}${wishList.contentThumbImg}"
						alt="Card image cap">
					<div class="card-body">
						<p class="content-cateCode">${wishList.cateCode} · ${wishList.cityCode}</p>
						<h6 class="card-title">[${wishList.cityCode}]&nbsp;${wishList.contentName}</h6>
						<br/>
						<p class="contentPrice">
						<span>가격:&nbsp;</span>
						<fmt:formatNumber pattern="###,###,###"
										  value="${wishList.contentPrice}" 
					    />원 / 1인</p>
					</div>
				</div>
			</a>
		</c:forEach>
	</div>
	<!-- footer -->
	<footer id="footer">
		<div id="footer_box">
			<%@ include file = "../include/footer.jsp" %>
		</div>
		
	</footer>
</div>
</body>

<script type="text/javascript">
function deleteWishList(){
	var checkArr = new Array();
	var userID = "${userInfo.userID}"
	console.log(userID);
	$("input[class='chBox']:not(:checked)").each(function(){
		checkArr.push($(this).attr("data-wlNum"))
	});
	console.log(checkArr);
	$.ajax({
		url:"${pageContext.request.contextPath}/shop/view/deleteWishList",
		type: "post",
		data: { chbox : checkArr,
				userID : userID
		},
		success: function(){	
			console.log('삭제완료')
		}
	});
}
</script>
</html>



<!-- https://whakscjs.tistory.com/entry/2012513-MVC%ED%8C%A8%ED%84%B4%EC%9D%84-%ED%99%9C%EC%9A%A9%ED%95%9C-%EC%9D%B4%EB%A6%84%EC%9C%BC%EB%A1%9C-%ED%9A%8C%EC%9B%90-%EC%A1%B0%ED%9A%8C%ED%95%98%EA%B8%B0like-%EC%82%AC%EC%9A%A9 -->