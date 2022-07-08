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
	<script src="https://code.jquery.com/jquery-latest.min.js"></script>
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
    </style>
<title>Insert title here</title>
</head>
<body>
<!-- Navigation-->
<c:if test="${userInfo != null}">
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="container px-4 px-lg-5">
			<a class="navbar-brand" href="${pageContext.request.contextPath}/shop/list" style="margin-right:30px;">MY TRIP</a>
			<form action="${pageContext.request.contextPath}/contentSearch" class="d-flex" style="margin-right: 20px;">
				<input id="search-item-text" class="form-control me-2" type="text" style="width:300px"
					placeholder="도시나 상품을 검색해보세요" name="contentName" autocomplete="off">
				<button class="btn btn-dark" id="content-search-btn" type="submit">Search</button>
			</form>
			<!-- 글쓰기 버튼 -->
			<ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4" style="text-align:center;">
				<li class="btn btn-light">
				<a class="nav-link" href="${pageContext.request.contextPath}/contentRegister">여행 등록하기</a></li>
			</ul>
			
			<ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
				<li class="btn btn-light">
				<a class="nav-link" href="${pageContext.request.contextPath}/view/wishList?userID=${userInfo.userID}">위시리스트</a></li>
			</ul>
			
		<c:if test="${userInfo.verify == 9}">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
				<li class="btn btn-light">
				<a class="nav-link" href="${pageContext.request.contextPath}/admin/index">마이페이지</a></li>
			</ul>
		</c:if>
				<button class="btn btn-outline-dark" type="submit"
					style="margin: 10px">
					<a href="${pageContext.request.contextPath}/logout" style="text-decoration: none; color: black;">로그아웃</a>
				</button>
		</div>
	</nav>
</c:if>
<c:if test="${userInfo == null}">
       <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container px-4 px-lg-5">
            	<a class="navbar-brand" href="${pageContext.request.contextPath}/shop/list" style="margin-right:30px;">MY TRIP</a>
                	<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
               			 <div class="collapse navbar-collapse" id="navbarSupportedContent">
							<form action="${pageContext.request.contextPath}/contentSearch" class="d-flex" style="margin-right: 20px;">
								<input id="search-item-text" class="form-control me-2" type="text" style="width:300px"
									placeholder="도시나 상품을 검색해보세요" name="contentName" autocomplete="off">
								<button class="btn btn-dark" id="content-search-btn" type="submit">Search</button>
							</form>
               			   <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4" style="float: right">
                    			<li class="btn btn-light"></li>
                   				 </ul>
                    
              
                    <form class="d-flex">
                        <button class="btn btn-outline-dark" type="button" style="margin: 10px">
                           <a href="${pageContext.request.contextPath}/login" style="text-decoration:none; color:black;">로그인</a>
                        </button>
                       <button class="btn btn-outline-dark" type="button" style="margin: 10px">
                            <a href="${pageContext.request.contextPath}/userRegister" style="text-decoration:none; color:black;">회원가입</a>
                        </button>
                    </form>
                </div>
            </div>
        </nav>
</c:if>  
</body>
<script type="text/javascript">
/*{
		var contextPath = "${pageContext.request.contextPath}";
		const contentSearchBtn = document.querySelector("#content-search-btn");
		contentSearchBtn.addEventListener('click', () => {
		//console.log('검색버튼 클릭');
		let searchItem = document.querySelector('#search-item-text').value;
		//console.log(searchItem);		
		let data = {
				contentName : searchItem,
		};
		$.ajax({
			url : contextPath + "/contentSearch",
			type : "POST",
			data : data,
			success: function(list) {
				alert('정상작동')
				let searchResult = list.datalist
				console.log(${searchResult})
				},
			error: function() {
				alert('에러발생')
			}

		});	
		//return location.href= contextPath + "/shop/view/contentSearchOk"
	});
}*/
	
	
	
</script>
</html>
