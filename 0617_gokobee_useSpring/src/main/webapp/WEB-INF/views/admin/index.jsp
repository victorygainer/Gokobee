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
		<aside style="display: inline-block;" >
			<%@ include file = "include/aside.jsp" %>
		</aside>
<!-- Main info -->
	   <div  id="container_box" class="col-sm-8" style="display: inline-block">
	      <h4><small>My Account</small></h4>
	      <hr>
	      <h2>회원정보수정</h2>
	      <hr>
	      <div class="table-responsive">          
			  <table class="table">
			      <tr>
			        <th>이메일</th>
			         <td>${userInfo.userID}</td>
			         <td></td>
			      </tr>
			      <tr>
			        <th>비밀번호</th>
			        <td><a href="updatePassword.nhn" style="text-decoration:none; ">비밀번호 변경</a></td>
			      </tr>
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