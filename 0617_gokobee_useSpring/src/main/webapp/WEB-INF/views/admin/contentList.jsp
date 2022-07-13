<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MY TRIP</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
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
 
 #container_box table td { width:150px; }
 
 #content-table {
 	margin: 10px 10px 10px 10px
 }
 
 #content-table img{
 	width: 150px;
 	height: 150px;
 }
  #content-table td{
 	text-align: center;
 }
   #content-table th{
 	text-align: center;
 }
</style>
</head>
<body>
	<!-- Navigation-->
	<nav id="nav">
		<div id="nav_box">
			<%@ include file = "include/nav.jsp" %>
		</div>
	</nav>

	<!-- aside -->
<section id = "container">
		<aside style="display: inline-block">
			<%@ include file = "include/aside.jsp" %>
		</aside>
<!-- Main info -->
	   <div  id="container_box" class="col-sm-8" style="display: inline-block">
	      <h4><small>My Content</small></h4>
	      <hr>
	      <h2>여행상품수정</h2>
	      <hr>
	      <div class="table-responsive">          
			  <table id="content-table">
					 <thead>
						  <tr>
						   <th>콘텐츠 번호</th>
						   <th>썸네일</th>
						   <th>이름</th>
						   <th>카테고리</th>
						   <th>가격</th>
						   <th>등록날짜</th>
						  </tr>
					 </thead>
					 <tbody>
						  <c:forEach items="${contentList}" var="contentList">
							  <tr>
								   <td>
								   ${contentList.contentNum}
								   </td>
								   <td>
								   <img src="${pageContext.request.contextPath}${contentList.contentThumbImg}" class="thumbImg">
								   </td>
								   <td>
								   <a href="${pageContext.request.contextPath}/admin/content/view?n=${contentList.contentNum}">${contentList.contentName}</a>
								   </td>
								   <td>${contentList.cateCode}</td>
								   <td>
							  		<fmt:formatNumber value="${contentList.contentPrice}" pattern="###,###,###"/>
								   </td>
								   <td>
								   	<fmt:formatDate value="${contentList.contentDate}" pattern="yyyy-MM-dd"/>
								   </td>
							  </tr>   
						  </c:forEach>
		 			</tbody>
			  </table>
		  </div>
		</div>
 </section>  
<!-- footer -->
<footer id="footer">
	<div id="footer_box">
		<%@ include file = "include/footer.jsp" %>
	</div>
</footer>
</body>
</html>