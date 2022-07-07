<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<style type="text/css">
		html, body {
		    margin: 0;
		    padding: 0;
		    height: 100%;
		}
		nav{
			margin-bottom: 50px;
		}
		#wrap{
		    position: relative;
		    padding-bottom: 50px;
		    margin:auto;
		    text-align:center;
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
<title>MY TRIP</title>
</head>
<body>
	<!-- nav -->
	<nav id="nav">
		<div id="nav_box">
			<%@ include file = "../include/nav.jsp" %>
		</div>
	</nav>	    
	<!-- main -->
	<div class="container" id="wrap" >
		<div class="panel-body">
			<div class="row">
				<div class="col-lg-12">
					<form id="login-form" action="loginCheck" role="form" method="post" style="display: inline-block; ">
						<div class="nav nav-pills nav-justified mb-3" id="ex1"
							role="tablist">
							<div class="nav-item" role="presentation">
								<a href="./login" class="nav-link active" id="tab-login"
									data-mdb-toggle="pill"
									style="background-color: #173B0B; width: 500px;">로그인</a>
							</div>
						</div>
						
						<div class="form-outline mb-4">
							<label class="form-label" for="loginName" >이메일</label> 
							<input
								type="text" name="userID" id="userID" tabindex="1"
								class="form-control" placeholder="아이디(이메일)를 입력하세요" value=""
								style="width: 500px" />
						</div>
						<div class="form-outline mb-4">
							<label class="form-label" for="loginPassword">비밀번호</label> <input
								type="password" name="userPassword" id="userPassword"
								tabindex="2" class="form-control" placeholder="비밀번호를 입력하세요"
								style="width: 500px" />
						</div>
						<div>
							회원이 아니신가요? <a href="userRegister" id="userRegister-form-link"
								style="text-decoration: none; color: black; font-weight: bold">회원가입</a>
						</div>
						<br />
						<div class="form-group">
							<div class="row">
								<div class="col-sm-6 col-sm-offset-3">
									<input class="btn btn-outline-dark" type="submit" value="로그인"
										style="width: 500px; border-radius: 50px"/>
								</div>
							</div>
						</div>
					</form>
					
				</div>
			</div>
		</div>
	</div>
	<!-- footer -->
	<footer id="footer">
		<div id="footer_box">
			<%@ include file = "../include/footer.jsp" %>
		</div>
	</footer>
</body>
</html>









