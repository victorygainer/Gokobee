<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<title>MY TRIP</title>
<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
<link rel="icon" href="/favicon.ico" type="image/x-icon">
<meta charset="UTF-8">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
 	<script src="https://code.jquery.com/jquery-latest.min.js"></script>
 	<script src="https://cdn.ckeditor.com/ckeditor5/34.1.0/classic/ckeditor.js"></script>
 	<script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/translations/ko.js"></script>
	
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
		
		.select_img img { margin:20px 0;}
		
		
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
		
		.ck-editor__editable { height: 400px; }
		.ck-content { font-size: 15px; }
		
		
    </style>
</head>
<body>
	<!-- nav -->
	<nav id="nav">
		<div id="nav_box">
			<%@ include file = "../include/nav.jsp" %>
		</div>
	</nav>	 

<!-- main -->
	<article>
		<div class="container" role="main">		
			<form action="contentRegisterOK" method="post" autocomplete="off" enctype="multipart/form-data">
				 <label style="width: 50px; font-size: 20px">도시</label>&nbsp;&nbsp;&nbsp;
					 <select style="width: 200px; padding: 8px" id="cityCode" name="cityCode">
					 	 <option value="서울">서울</option>
					 	 <option value="부산">부산</option>
					 	 <option value="제주">제주</option>
					 	 <option value="경주">경주</option>
					 </select>
				<br/>
					<br/>
					 	<label style="width: 100px; font-size: 20px">카테고리</label>&nbsp;&nbsp;&nbsp;
					<br/>
				<br/>
						<input type="radio" id="cateCode1" name="cateCode" value="가이드 투어"> 가이드 투어
						&nbsp;&nbsp;&nbsp;
						<input type="radio" id="cateCode2" name="cateCode" value="액티비티"> 액티비티
						&nbsp;&nbsp;&nbsp;
						<input type="radio" id="cateCode3" name="cateCode" value="즐길거리"> 즐길거리
						&nbsp;&nbsp;&nbsp;
						<input type="radio" id="cateCode4" name="cateCode" value="여행편의"> 여행편의
				<br/>	
					<br/>
					 	<label style="width: 100px; font-size: 20px">상품태그</label>&nbsp;&nbsp;&nbsp;
					<br/>
				<br/>
						&nbsp;&nbsp;&nbsp;
						<input type="checkbox" id="contentTag1" name="contentTag" value="박물관/미술관"> 박물관/미술관
						&nbsp;&nbsp;&nbsp;
						<input type="checkbox" id="contentTag2" name="contentTag" value="국립공원"> 국립공원
						&nbsp;&nbsp;&nbsp;
						<input type="checkbox" id="contentTag3" name="contentTag" value="쇼핑"> 쇼핑
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="checkbox" id="contentTag4" name="contentTag" value="캠퍼스/오피스"> 캠퍼스/오피스 <br/>
						&nbsp;&nbsp;&nbsp;
						<input type="checkbox" id="contentTag5" name="contentTag" value="테마파크"> 테마파크
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="checkbox" id="contentTag6" name="contentTag" value="시티투어"> 시티투어
						&nbsp;&nbsp;&nbsp;
						<input type="checkbox" id="contentTag7" name="contentTag" value="픽업/샌딩"> 픽업/샌딩
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="checkbox" id="contentTag8" name="contentTag" value="캠핑"> 캠핑 <br/>
						&nbsp;&nbsp;&nbsp;
						<input type="checkbox" id="contentTag9" name="contentTag" value="스파/마사지"> 스파/마사지
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="checkbox" id="contentTag10" name="contentTag" value="근교"> 근교
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="checkbox" id="contentTag11" name="contentTag" value="이색체험"> 이색체험
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="checkbox" id="contentTag12" name="contentTag" value="맛집/카페"> 맛집/카페 <br/>
						&nbsp;&nbsp;&nbsp;
						<input type="checkbox" id="contentTag13" name="contentTag" value="크루즈/요트"> 크루즈/요트
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="checkbox" id="contentTag14" name="contentTag" value="클래스"> 클래스
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="checkbox" id="contentTag15" name="contentTag" value="통역/비즈니스"> 통역/비즈니스
						<input type="checkbox" id="contentTag16" name="contentTag" value="스포츠"> 스포츠 <br/>
						&nbsp;&nbsp;&nbsp;
						<input type="checkbox" id="contentTag17" name="contentTag" value="야경"> 야경
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="checkbox" id="contentTag18" name="contentTag" value="로컬투어"> 로컬투어
						&nbsp;&nbsp;&nbsp;
						<input type="checkbox" id="contentTag19" name="contentTag" value="쇼/뮤지컬"> 쇼/뮤지컬
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="checkbox" id="contentTag20" name="contentTag" value="자전거"> 자전거
				<br/>					
				<br/>
					<div class="mb-3">
					 	<label style="width: 100px; font-size: 20px">여행제목</label>&nbsp;&nbsp;&nbsp;
					<br/><br/>
						<input type="text" class="form-control" name="contentName" id="contentName" placeholder="제목을 입력해 주세요">
					</div>
										
					<div class="mb-3">
					 	<label style="width: 100px; font-size: 20px">여행가격</label>&nbsp;&nbsp;&nbsp;
					<br/><br/>
						<input type="text" class="form-control" name="contentPrice" id="contentPrice" placeholder="가격을 입력해 주세요">
					</div>
					
				<div class="mb-3">
					 	<label style="width: 100px; font-size: 20px">한줄요약</label>&nbsp;&nbsp;&nbsp;
					 	<br/><br/>
					<textarea class="form-control" rows="1" name="contentSum" id="contentSum" placeholder="내용을 입력해 주세요" ></textarea>
				</div>
				
				<div class="mb-3">
					 	<label style="width: 100px; font-size: 20px">여행소개</label>&nbsp;&nbsp;&nbsp;
					 	<br/><br/>
					<textarea class="form-control" rows="15" name="contentDes" id="contentDes" placeholder="내용을 입력해 주세요" ></textarea>
				</div>
				
				<div class="mb-3">
					 	<label style="width: 100px; font-size: 20px">이미지</label>&nbsp;&nbsp;&nbsp;
					 	<br/>
					 		<br/>
								<input type="file" class="form-control" name="file" id="contentImg"/> 
								<div class="select_img"><img src=""/></div>	
				</div>
				<div>
					<%=request.getRealPath("/") %>
					<input type="hidden" class="form-control" name="contentOwner" id="contentOwner" value="${userInfo.userID}">
					<input type="submit" value="저장하기" class="btn btn-outline-dark"/>
					<input type="reset" value="다시쓰기" class="btn btn-outline-dark"/>
					<input type="button" value="돌아가기" class="btn btn-outline-dark" onclick="history.back()"/>
				</div>
		</form>
		</div>
	</article>	
	<!-- footer -->
	<footer id="footer">
		<div id="footer_box">
			<%@ include file = "../include/footer.jsp" %>
		</div>
	</footer>
</body>
<script type="text/javascript">
$("#contentImg").change(function(){
	   if(this.files && this.files[0]) {
	    let reader = new FileReader;
	    reader.onload = function(data) {
	     $(".select_img img").attr("src", data.target.result).width(500);        
	    }
	    reader.readAsDataURL(this.files[0]);
	   }
	  });

var myEditor;
ClassicEditor
	.create( document.querySelector( '#contentDes' ), {
		ckfinder: {
	        uploadUrl: 'ckImgUpload' // 내가 지정한 업로드 url (post로 요청감)
		},
		alignment: {
            options: [ 'left', 'center', 'right' ]
        }
	} )
	.then( editor => {
        console.log( 'Editor was initialized', editor );
        myEditor = editor;
    } )
	.catch( error => {
	    console.log(error);
	} )

var regExp = /[^0-9]/gi;

$("#contentPrice").keyup(function(){ numCheck($(this)); });

function numCheck(selector) {
 let tempVal = selector.val();
 selector.val(tempVal.replace(regExp, ""));
}


</script>
</html>
