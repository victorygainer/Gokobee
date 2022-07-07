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
		html, body {
		    margin: 0;
		    padding: 0;
		    height: 100%;
		}
		nav{
			margin-bottom: 50px;
		}btn btn-outline-dark
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
		
	 section#content ul li { display:inline-block; margin:10px; }
	 section#content div.contentThumb img { width:200px; height:200px; }
	 section#content div.contentName { padding:10px 0; text-align:center; }
	 section#content div.contentName a { color:#000; }

    </style>
	<title>MY TRIP</title>

</head>
<body> 
<!-- nav -->
<nav id="nav">
	<div id="nav_box">
		<%@ include file = "../include/nav.jsp" %>
	</div>
</nav>

<!-- Main -->
<div class="container">
	<div class="row">
		<section id ="content">
			<ul>
				 <c:forEach items="${wishList}" var="wishList">
					 <li>
					  	 <div class="checkBox">
					  	 	  <input type="hidden" name="userID" class="userID">
   							  <input type="checkbox" name="chBox" class="chBox" checked="checked"
   							   data-wlNum="${wishList.contentNum}" onclick="deleteWishList()"/>
  						  </div>
						  <div class="contentThumb">
							   <img src="${pageContext.request.contextPath}${wishList.contentThumbImg}">
						  </div> 
						  <div class="contentName">
							   <a href="${pageContext.request.contextPath}/shop/view?n=${wishList.contentNum}">${wishList.contentSum}</a>
						  </div>
					 </li>
				 </c:forEach>
			</ul>
		</section>
	</div>
</div>
<!-- footer -->
<footer id="footer">
	<div id="footer_box">
		<%@ include file = "../include/footer.jsp" %>
	</div>
	
</footer>

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