<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%> 
<!DOCTYPE html>
<html>
<head>
<title>콘텐츠 조회</title>
<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
<link rel="icon" href="/favicon.ico" type="image/x-icon">
<meta charset="UTF-8">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
 	<script src="https://code.jquery.com/jquery-latest.min.js"></script>
	
	<style type="text/css">
	
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
		
		.oriImg{ width: 500px, height:auto;}
		.thumbImg{}
    </style>
</head>
<body>
	<!-- nav -->
	<!-- Navigation-->
	<nav id="nav">
		<div id="nav_box">
			<%@ include file = "../include/nav.jsp" %>
		</div>
	</nav>

	<!-- aside -->
<section id = "container">
		<aside style="display: inline-block">
			<%@ include file = "../include/aside.jsp" %>
		</aside>
<!-- main -->
	<article>
		<form action = "modify" enctype="multipart/form-data">
			<div class="col-sm-8" id="container_box" style="display: inline-block" role="main">
			<h1> 여행상품수정</h1>
			<hr/>		
				<label style="width: 50px; font-size: 20px">도시</label>&nbsp;&nbsp;&nbsp;
					<br/>
						<br/>
						 	<input type="text" style="width: 200px; padding: 8px" value="${content.cityCode}" readonly="readonly">
						<br/>
					<br/>
			 	<label style="width: 100px; font-size: 20px">카테고리</label>&nbsp;&nbsp;&nbsp;
					<br/>
						<br/>
							<input type="text" style="width: 200px; padding: 8px" value="${content.cateCode}" readonly="readonly">		
						<br/>	
					<br/>
			 	<label style="width: 1000px; font-size: 20px">상품태그</label>&nbsp;&nbsp;&nbsp;
					<br/>
						<br/>
							<input type="text" style="width: 200px; padding: 8px" value="${content.contentTag}" readonly="readonly">					
						<br/>					
					<br/>
			<div class="mb-3">
			 	<label style="width: 100px; font-size: 20px">여행제목</label>&nbsp;&nbsp;&nbsp;
					<br/>
						<br/>
							<input type="text" style="width: 200px; padding: 8px" value="${content.contentName}" readonly="readonly">					
			</div>					
			<div class="mb-3">
			 	<label style="width: 100px; font-size: 20px" >여행가격</label>&nbsp;&nbsp;&nbsp;
					<br/>
						<br/>
							<input type="text" style="width: 200px; padding: 8px" pattern="###,###,###" value="${content.contentPrice}" readonly="readonly">					
			</div>				
			<div class="mb-3">
				<label style="width: 100px; font-size: 20px">한줄요약</label>&nbsp;&nbsp;&nbsp;
					<br/>
						<br/>
							<textarea class="form-control" rows="1" readonly="readonly">${content.contentSum}</textarea>
				</div>
			<div class="mb-3">
				<label style="width: 100px; font-size: 20px">여행소개</label>&nbsp;&nbsp;&nbsp;
					 <br/>
					 	<br/>
							<textarea class="form-control" rows="15" readonly="readonly"><c:out value="${content.contentDes}"/></textarea>
				</div>
			<div class="mb-3">
				<label style="width: 100px; font-size: 20px">이미지</label>&nbsp;&nbsp;&nbsp;
					 <br/>
					 	<br/>
					 		<p>원본 이미지</p>
					 		<img src="${pageContext.request.contextPath}${content.contentImg}" class="oriImg">
							
					 	<br/>
					 	<br/>
					 		<p>썸네일 이미지</p>
					 		 <img src="${pageContext.request.contextPath}${content.contentThumbImg}" class="thumbImg">
					</div>
				
				

					<div class="inputArea">
						<input type="hidden" name="n" value="${content.contentNum}" />
						<input type="hidden" name="contentImg" value="${content.contentImg}">
					 	<input type="hidden" name="contentThumbImg" value="${content.contentThumbImg}">
						<button type="submit" id="update_Btn" class="btn btn-outline-warning">수정하기</button>
						<button type="button" id="delete_Btn" class="btn btn-outline-danger" 
							onclick="del()">삭제하기</button>
						<input type="button" value="돌아가기" class="btn btn-outline-dark" onclick="history.back()"/>
					</div>
				</div>
			</form>
	</article>	
</section>
	<!-- footer -->
	<footer id="footer">
		<div id="footer_box">
			<%@ include file = "../include/footer.jsp" %>
		</div>
	</footer>
</body>

<script type="text/javascript">
function del() {
	if (confirm("정말 삭제하시겠습니까?") == true){
		location.href='delete?n=${content.contentNum}';	
	} else {
		return;
	}
}
</script>

</html>
