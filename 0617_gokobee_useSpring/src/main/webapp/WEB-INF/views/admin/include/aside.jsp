<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
<style>
 body { font-family:'맑은 고딕', verdana; padding:0; margin:0; }
 ul { padding:0; margin:0; list-style:none;  }

 div#root { width:90%; margin:0 auto; }
 
 header#header { font-size:60px; padding:20px 0; }
 header#header h1 a { color:#000; font-weight:bold; }
 
 nav#nav { padding:10px; text-align:right; }
 nav#nav ul li { display:inline-block; margin-left:10px; }

   section#container { padding:20px 0; border-top:2px solid #eee; border-bottom:2px solid #eee; }
 section#container::after { content:""; display:block; clear:both; }
 aside { float:left; width:200px; }
 div#container_box { float:right; width:calc(100% - 200px - 20px); }
 
 aside ul li { text-align:center; margin-bottom:10px; }
 
 footer#footer { background:#f9f9f9; padding:20px; }
 footer#footer ul li { display:inline-block; margin-right:10px; }
</style>
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="col-sm-12" >
   <ul class="nav-left">
		  <h6 style="padding-top:15px;">${userInfo.userID}</h6>
		  <li><a href="${pageContext.request.contextPath}/logout">로그아웃</a></li><br/>
		  <hr/>
	      <h5>My Account</h5>
	      <li><a href="index">회원정보수정</a></li>
	      <hr/>
	      <h5>My Content</h5>
	      <li>
		      	<a href="${pageContext.request.contextPath}/admin/contentList?userID=${userInfo.userID}">여행상품수정</a>
	     		<!-- http://localhost:9090/contentCRUD/admin/contentList?userID=jsg%40jsg.com -->
	     </li>
	      <li>
		      	<a href="${pageContext.request.contextPath}/admin/myContentResList?userID=${userInfo.userID}">여행상품 주문 현황</a>
	     </li>
	     <hr/>
	      <h5>My Order</h5>
	      <li>
		  		<a href="${pageContext.request.contextPath}/admin/myOrderList?userID=${userInfo.userID}">내 주문</a>
	     </li>
	      <li><a href="#">상품 리뷰</a></li><br/>
	      <hr/>
	      <h5>Customer Service</h5>
	      <li><a href="#">상품 문의</a></li>
	</ul>
</div>
</body>
</html>