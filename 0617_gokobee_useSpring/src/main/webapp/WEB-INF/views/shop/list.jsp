<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<link rel="icon" href="./img/logo.png" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/list.css"/>
<style type="text/css">
	.popup {
		display: grid;
		grid-template-columns: repeat(4, 1fr);
		gap: 10px;
		margin: 10px;
		padding: 20px;
	}
	
	.popup card {
		position: relative;
		width: 290px;
		height: 375px;
		z-index: 1;
	}
	
	.popup img {
		position: absolute;
		top: 0;
	    left: 0;
	    transform: translate(50, 50);
	    width: 100%;
	    height: 100%;
	    object-fit: cover;
	    margin: auto;
	}
	
	.popup-card-body {
		position: relative;
		color: white;
		top: 30px;
		left: 20px;
		z-index: 2;
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
		<h2>설렘가득한 여행을 떠나봐요!</h2>
		<div class="popup">
			<div class="card">
				<a href="${pageContext.request.contextPath}/contentSearch?contentName=서울">
				<img class="popup-card-img-top"					 							
					src="${pageContext.request.contextPath}/resources/popupContent/seoul_popup.jpg"
					alt="Card image cap">
				<div class="popup-card-body">
					<h3 class="popup-cityCode">서울</h3>
					<h6 class="popup-contentCount">${seoulCount}개의 여행상품</h6>
				</div>	
				</a>	
			</div>
			<div class="card">
				<a href="${pageContext.request.contextPath}/contentSearch?contentName=경주">
				<img class="popup-card-img-top"					 							
					src="${pageContext.request.contextPath}/resources/popupContent/gyeongju_popup.jpg"
					alt="Card image cap">
				<div class="popup-card-body">
					<h3 class="popup-cityCode">경주</h3>
					<h6 class="popup-contentCount">${gyeongjuCount}개의 여행상품</h6>
				</div>	
				</a>	
			</div>
			<div class="card">
				<a href="${pageContext.request.contextPath}/contentSearch?contentName=제주">
				<img class="popup-card-img-top"					 							
					src="${pageContext.request.contextPath}/resources/popupContent/jeju_popup.jpg"
					alt="Card image cap">
				<div class="popup-card-body">
					<h3 class="popup-cityCode">제주</h3>
					<h6 class="popup-contentCount">${jejuCount}개의 여행상품</h6>
				</div>	
				</a>	
			</div>
			<div class="card">
				<a href="${pageContext.request.contextPath}/contentSearch?contentName=부산">
				<img class="popup-card-img-top"					 							
					src="${pageContext.request.contextPath}/resources/popupContent/busan_popup.jpg"
					alt="Card image cap">
				<div class="popup-card-body">
					<h3 class="popup-cityCode">부산</h3>
					<h6 class="popup-contentCount">${busanCount}개의 여행상품</h6>
				</div>	
				</a>	
			</div>
			
		</div>
				<h3>가장 많이 조회한 상품을 만나보세요</h3>
		<div class="content">
			<c:forEach items="${hitList}" var="hitList">
				<a href="${pageContext.request.contextPath}/shop/view?n=${hitList.contentNum}">
					<div class="card">
					<input type="checkbox" name="chBox" class="chBox" data-wlNum="${hitList.contentNum}">
						<img class="card-img-top"					 							
							src="${pageContext.request.contextPath}${hitList.contentThumbImg}"
							alt="Card image cap">
						<div class="card-body">
							<p class="content-cateCode">${hitList.cateCode} · ${hitList.cityCode}</p>
							<h6 class="card-title">[${hitList.cityCode}]&nbsp;${hitList.contentName}</h6>
							<br/>
							<p class="contentPrice">
							<span>가격:&nbsp;</span>
							<fmt:formatNumber pattern="###,###,###"
											  value="${hitList.contentPrice}" 
						    />원 / 1인</p>
						</div>
					</div>
				</a>
			</c:forEach>
		</div>
				<h3>실시간 베스트셀러</h3>
		<div class="content">
			<c:forEach items="${resHitList}" var="resHitList">
				<a href="${pageContext.request.contextPath}/shop/view?n=${resHitList.contentNum}">
					<div class="card">
					<input type="checkbox" name="chBox" class="chBox" data-wlNum="${resHitList.contentNum}">
						<img class="card-img-top"					 							
							src="${pageContext.request.contextPath}${resHitList.contentThumbImg}"
							alt="Card image cap">
						<div class="card-body">
							<p class="content-cateCode">${resHitList.cateCode} · ${resHitList.cityCode}</p>
							<h6 class="card-title">[${resHitList.cityCode}]&nbsp;${resHitList.contentName}</h6>
							<br/>
							<p class="contentPrice">
							<span>가격:&nbsp;</span>
							<fmt:formatNumber pattern="###,###,###"
											  value="${resHitList.contentPrice}" 
						    />원 / 1인</p>
						</div>
					</div>
				</a>
			</c:forEach>
		</div>
		
			<h3>새로운 상품을 만나보세요</h3>
		<div class="content">
			<c:forEach items="${list}" var="list">
				<a href="${pageContext.request.contextPath}/shop/view?n=${list.contentNum}">
					<div class="card">
					<input type="checkbox" name="chBox"  onclick="addWishList()"
					class="chBox" data-wlNum="${list.contentNum}">
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

<script type="text/javascript">
var contextPath = "${pageContext.request.contextPath}";

{
	function addWishList(){
		var checkArr = new Array();
		if (userID != null) {
		var userID = "${userInfo.userID}"
		console.log(userID);
		$('input:checkbox[class="chBox"]').is(":checked").each(function(){
			checkArr.push($(this).attr("data-wlNum"))
		});
		console.log(checkArr);
		} else { 
			function goLogin() {
				location.href= contextPath + "/login"
			}
		}

		
	};
}

	
</script>

</html>


