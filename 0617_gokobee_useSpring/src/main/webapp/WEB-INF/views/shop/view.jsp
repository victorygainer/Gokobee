<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%
String userID = (String) session.getAttribute("userID");
%>
<!DOCTYPE html>
<html>
<head>
<title>콘텐츠 조회</title>
<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
<link rel="icon" href="/favicon.ico" type="image/x-icon">
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>

<style type="text/css">
hr {
	width: 600px
}

.contentInfo {
	width: 600px;
	margin: auto;
}

.resInfo {
   text-align: center;
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
.oriImg {
	width: 500px, height:auto;
}

.thumbImg {
	
}
</style>
</head>
<body>

	<div class="container">
		<!-- nav -->
		<nav id="nav">
			<div id="nav_box">
				<%@ include file="../include/nav.jsp"%>
			</div>
		</nav>
		<!-- main -->

		<div class="contentInfo">
			<p class="contentName">
			<h3>[${content.cityCode}]&nbsp;${content.contentName}</h3>
			</p>
			<p class="cateName">
				<span>카테고리:&nbsp;</span>${content.cateCode}</p>
			<hr>
			<div class="mb-3">
				<div class="contentImg">
					<img src="${pageContext.request.contextPath}${content.contentImg}">
				</div>
			</div>
			<hr>
			<div class="contentDes">${content.contentDes}</div>
			<hr>
			<div class="resInfo">
				<p class="contentPrice">
					<span>가격:&nbsp;</span>
					<fmt:formatNumber pattern="###,###,###"
						value="${content.contentPrice}" />
					원 <input type="hidden" id="contentPrice" name="contentPrice"
						value="${content.contentPrice}" />
				</p>

				<div class="contentOwner">
					<span>소유자정보:&nbsp;</span>${content.contentOwner}</div>
				<hr />
				<div class="divaa"
					style="padding-right: 20px; border-right: 5px dotted #ecf0f1">
					<label>예약날짜 </label> <input type="text" class="dateChoose"
						id="dateChoose" style="width: 30%" placeholder="예약 날짜 선택">
					<br> <br> <label>인원수 </label> <input type="text"
						class="memberChoose" id="memberChoose" style="width: 30%"
						placeholder="인원수 선택"> <br>
				</div>
				<hr />
				<input type="hidden" id="contentOwner" name="contentOwner"
					value="${content.contentOwner}" />
				<hr />
				<p class="addWishList">
					<button type="button" onclick="addWishList()">위시리스트에 추가</button>
					<button type="button" onclick="ReservationOK()">예약하기</button>
				</p>
			</div>
			<hr />
		</div>
	</div>
	<!-- 댓글 입력 양식 -->
	<div class="container" style="margin-top: 20px;">
		<table class="table table-striped"
			style="text-align: center; border: 1px solid #dddddd">
			<tr>
				<td><input type="hidden" id="contentNum" name="contentNum"
					value="${content.contentNum}" /> <input type="text"
					class="form-control" name="userID" id="userID"
					value="${userInfo.userID}" readonly="readonly"> <textarea
						class="form-control" rows="3" name="commentDes" id="commentDes"
						placeholder="내용을 입력해 주세요"></textarea> <input
					class="btn btn-sm btn-primary" type="submit" value="댓글입력"
					onclick="insertComment()" /></td>
			</tr>
		</table>


		<!-- 댓글 출력 양식 -->
		<div class="container">
			<div class="row">
				<table class="table table-striped"
					style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th style="background-color: #eeeeee; text-align: center;">아이디</th>
							<th style="background-color: #eeeeee; text-align: center;">댓글
								내용</th>
							<th style="background-color: #eeeeee; text-align: center;">작성일</th>
						</tr>
					</thead>
					<tbody id="commentTable">
						<tr></tr>
					</tbody>
				</table>
			</div>
		</div>
		<!-- footer -->
		<footer id="footer">
			<div id="footer_box">
				<%@ include file="../include/footer.jsp"%>
			</div>
		</footer>
	</div>
</body>


<script type="text/javascript">
	var contextPath = "${pageContext.request.contextPath}";
	function loginGo() {
		alert('로그인을 하신 후 이용해 주시기 바랍니다.')
		location.href = "/login"
	}
</script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/comment.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/wishList.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/reservation.js"></script>




</html>
