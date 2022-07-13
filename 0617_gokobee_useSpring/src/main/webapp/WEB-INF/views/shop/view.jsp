<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<!DOCTYPE html>
<html>
<head>
<title>콘텐츠 조회</title>
<meta name="viewport" content="width=device-width,initial-scale=1">
<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
<link rel="icon" href="/favicon.ico" type="image/x-icon">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/vanillajs-datepicker@1.2.0/dist/css/datepicker.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vanillajs-datepicker@1.2.0/dist/js/datepicker-full.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vanillajs-datepicker@1.2.0/dist/js/locales/ko.js"></script>


<style type="text/css">

hr {
	width: 800px
}

aside {
	width: 300px;
	position: fixed;
	background-color:white;
	text-align: center;
}

.container {
	width: 1200px;
}

.content-container {
	width: 1200px;
	display: grid;
	grid-template-columns: 2fr 1fr;
	margin: auto;
}

.content-info {
	margin: 0px;
}

.res-info hr{
	width: 270px;
}

.content-image img{
	width: 700px;
}

.content-desciption img{
	width: 400px;
	text-align: center;

}

.form-floating > .bi-calendar-date + .datepicker_input + label {
  padding-left: 3.5rem;
}

</style>
</head>
<body>

	

	<div class="container">
		<!-- nav -->
		<nav id="nav" style="width:1180px">
			<div id="nav_box">
				<%@ include file="../include/nav.jsp"%>
			</div>
		</nav>
		<!-- main -->
		<div class="content-container">
			<div class="content-info">
				<p class="contentName">
				<h3>[${content.cityCode}]&nbsp;${content.contentName}</h3>
				</p>
				<p class="cateName">
					<span>카테고리:&nbsp;</span>${content.cateCode}</p>
				<hr>
				<div class="mb-3">
					<div class="content-image" style="text-align: center">
						<img src="${pageContext.request.contextPath}${content.contentImg}">
					</div>
				</div>
				<hr>
				<div class="content-desciption">${content.contentDes}</div>
				<hr> 
			</div>
			
			<div class="res-info">
				<aside style="display: inline-block">
					<div class="card">
						<div class="card-body">
							<p class="contentPrice">
								<span>가격:&nbsp;</span>
								<fmt:formatNumber pattern="###,###,###"
									value="${content.contentPrice}" />
								원 / 1인</p> 
								<hr/>
							<div class="divaa"
								style="padding-right: 20px; border-right: 5px dotted #ecf0f1">
								<div class="input-group mb-4">
								<input type="text"
										class="datepicker_input form-control"
										id = "dateChoose" 
									    placeholder="날짜를 선택해 주세요" 
									    required aria-label="여행일을 선택해주세요"
									    style="background-color: lightgray;
									    	   text-align: center;">
								</div>
								<!--   <input type="button" onclick="count('minus')" value="-"></button>
								<div class="number-count" id="countElement" style="width: 50%; display: inline;">
								</div>
								<input type="button" onclick="count('plus')" value=" +"></button> -->
								<input type="number" id="memberChoose" style="text-align: center;" value="0">
								<br>
							</div>
									<hr/>
							<p class="addWishList">
							<button type="button" onclick="addWishList()">위시리스트에 추가</button>
							<button type="button" onclick="ReservationOK()">예약하기</button>
							<input type="hidden" id="userID" value="${userInfo.userID}">
							<input type="hidden" id="contentOwner" value="${content.contentOwner}">
							<input type="hidden" id="contentPrice" value="${content.contentPrice}">
							</p>
						</div>
					</div>
				</aside>
			</div>
		</div>
	</div>
	

	
	<!-- <div class="card mb-2">
	<div class="card-header bg-light">
	        <i class="fa fa-comment fa"></i> REPLY
	</div>
	<div class="card-body">
		<ul class="list-group list-group-flush">
		    <li class="list-group-item">
			<div class="form-inline mb-2">
				<label for="replyId"><i class="fa fa-user-circle-o fa-2x"></i></label>
				<input type="text" class="form-control ml-2" placeholder="Enter yourId" id="replyId">
				<label for="replyPassword" class="ml-4"><i class="fa fa-unlock-alt fa-2x"></i></label>
				<input type="password" class="form-control ml-2" placeholder="Enter password" id="replyPassword">
			</div>
			<textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
			<button type="button" class="btn btn-dark mt-3" onClick="javascript:addReply();">post reply</button>
		    </li>
		</ul>
	</div>
</div> -->



		<!-- 댓글 출력 양식 -->
		<div class="reply-container">
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
			
				<!-- 댓글 입력 양식 -->
		<div class="reply-container card mb-2" style="margin-top: 20px;">
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
	
	{
		const getDatePickerTitle = elem => {
			  // From the label or the aria-label
			  const label = elem.nextElementSibling;
			  let titleText = '';
			  if (label && label.tagName === 'LABEL') {
			    titleText = label.textContent;
			  } else {
			    titleText = elem.getAttribute('aria-label') || '';
			  }
			  return titleText;
			}

			const elems = document.querySelectorAll('.datepicker_input');
			for (const elem of elems) {
			  const datepicker = new Datepicker(elem, {
			    'format': 'yyyy.mm.dd',
			    'language' : 'ko',
			    title: getDatePickerTitle(elem)
			  });
			}
	}
	
	{
		function count(type) {
			const insertResult = document.getElementById('memberChoose');
			let number = insertResult.innerText;
			if(type === 'plus'){
				number = parseInt(number) + 1;
			} else if(type === 'minus'){
				number = parseInt(number) - 1;
			}
			insertResult.innerText = number;
		}
	}
	
</script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/comment.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/wishList.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/reservation.js"></script>	




</html>
