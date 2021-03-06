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
		
		.select_img img { width: 500px; margin: 20px 0;}
		
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
		<form action="contentUpdate" method="post" enctype="multipart/form-data">
			<div class="container" role="main">		
				 <label style="width: 50px; font-size: 20px">??????</label>&nbsp;&nbsp;&nbsp;
					 <select style="width: 200px; padding: 8px" id="cityCode" name="cityCode">
					 	 <option value="??????">??????</option>
					 	 <option value="??????">??????</option>
					 	 <option value="??????">??????</option>
					 	 <option value="??????">??????</option>
					 </select>
				<br/>
					<br/>
					 	<label style="width: 100px; font-size: 20px">????????????</label>&nbsp;&nbsp;&nbsp;
					<br/>
				<br/>
						<input type="radio" id="cateCode" name="cateCode" value="????????? ??????"> ????????? ??????
						&nbsp;&nbsp;&nbsp;
						<input type="radio" id="cateCode" name="cateCode" value="????????????"> ????????????
						&nbsp;&nbsp;&nbsp;
						<input type="radio" id="cateCode" name="cateCode" value="????????????"> ????????????
						&nbsp;&nbsp;&nbsp;
						<input type="radio" id="cateCode" name="cateCode" value="????????????"> ????????????
				<br/>	
					<br/>
					 	<label style="width: 100px; font-size: 20px">????????????</label>&nbsp;&nbsp;&nbsp;
					<br/>
				<br/>
						&nbsp;&nbsp;&nbsp;
						<input type="checkbox"  name="contentTag" value="?????????/?????????"> ?????????/?????????
						&nbsp;&nbsp;&nbsp;
						<input type="checkbox"  name="contentTag" value="????????????"> ????????????
						&nbsp;&nbsp;&nbsp;
						<input type="checkbox"  name="contentTag" value="??????"> ??????
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="checkbox"  name="contentTag" value="?????????/?????????"> ?????????/????????? <br/>
						&nbsp;&nbsp;&nbsp;
						<input type="checkbox"  name="contentTag" value="????????????"> ????????????
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="checkbox"  name="contentTag" value="????????????"> ????????????
						&nbsp;&nbsp;&nbsp;
						<input type="checkbox"  name="contentTag" value="??????/??????"> ??????/??????
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="checkbox"  name="contentTag" value="??????"> ?????? <br/>
						&nbsp;&nbsp;&nbsp;
						<input type="checkbox"  name="contentTag" value="??????/?????????"> ??????/?????????
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="checkbox"  name="contentTag" value="??????"> ??????
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="checkbox"  name="contentTag" value="????????????"> ????????????
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="checkbox"  name="contentTag" value="??????/??????"> ??????/?????? <br/>
						&nbsp;&nbsp;&nbsp;
						<input type="checkbox"  name="contentTag" value="?????????/??????"> ?????????/??????
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="checkbox"  name="contentTag" value="?????????"> ?????????
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="checkbox"  name="contentTag" value="??????/????????????"> ??????/????????????
						<input type="checkbox"  name="contentTag" value="?????????"> ????????? <br/>
						&nbsp;&nbsp;&nbsp;
						<input type="checkbox"  name="contentTag" value="??????"> ??????
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="checkbox"  name="contentTag" value="????????????"> ????????????
						&nbsp;&nbsp;&nbsp;
						<input type="checkbox"  name="contentTag" value="???/?????????"> ???/?????????
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="checkbox"  name="contentTag" value="?????????"> ?????????
				<br/>					
				<br/>
					<div class="mb-3">
					 	<label style="width: 100px; font-size: 20px">????????????</label>&nbsp;&nbsp;&nbsp;
					<br/><br/>
						<input type="text" class="form-control" name="contentName" id="contentName" value="${content.contentName}">
					</div>
										
					<div class="mb-3">
					 	<label style="width: 100px; font-size: 20px">????????????</label>&nbsp;&nbsp;&nbsp;
					<br/><br/>
						<input type="text" class="form-control" name="contentPrice" id="contentPrice" value="${content.contentPrice}">
					</div>
					
				<div class="mb-3">
					 	<label style="width: 100px; font-size: 20px">????????????</label>&nbsp;&nbsp;&nbsp;
					 	<br/><br/>
					<textarea class="form-control" rows="1" name="contentSum" id="contentSum">${content.contentSum}</textarea>
				</div>
				
				<div class="mb-3">
					 	<label style="width: 100px; font-size: 20px">????????????</label>&nbsp;&nbsp;&nbsp;
					 	<br/><br/>
					<textarea class="form-control" rows="15" name="contentDes" id="contentDes">${content.contentDes}</textarea>
				</div>
				<div class="mb-3">
				<label style="width: 100px; font-size: 20px">?????????</label>&nbsp;&nbsp;&nbsp;
					 <br/>
					 	<br/>
					 		<input type="file" class="form-control" name="file" id="contentImg"/>
						    <div class="select_img">
						 		<img src="${pageContext.request.contextPath}${content.contentImg}"/>
						 		<input type="hidden" name="contentImg" value="${content.contentImg}">
						 		<input type="hidden" name="contentThumbImg" value="${content.contentThumbImg}">
					 		</div>	
					</div>
				</div>
				<div>
					<input type="hidden" name="contentNum" id="contentNum" value="${content.contentNum}" />
					<input type="hidden" class="form-control" name="contentOwner" id="contentOwner" value="${userInfo.userID}">
					<button type="submit" id="update_Btn" class="btn btn-outline-warning">????????????</button>
					<button type="button" class="btn btn-outline-dark" onclick="history.back()">????????????</button>
					<input type="reset" value="????????????" class="btn btn-outline-dark"/>
				</div>
		</form>
	</article>	
	<!-- footer -->
	<footer id="footer">
		<div id="footer_box">
			<%@ include file = "../include/footer.jsp" %>
		</div>
	</footer>
</body>
<script type="text/javascript">
$(document).ready(function() {
	 let primaryCateValue = "${content.cateCode}"
	 for (let i = 0; i < 4; i++){
	 if (primaryCateValue == document.getElementsByName('cateCode')[i].value) {
		 document.getElementsByName('cateCode')[i].setAttribute("checked","checked");
		 }
	 } 
});

$(document).ready(function() {
	 const primaryContentTag = "${content.contentTag}";
	 const arrPrimaryContentTag = primaryContentTag.split(",");
	 console.log(arrPrimaryContentTag[0]);
	 for (let i = 0; i < 21; i++) {
		 for (let j = 0; j < arrPrimaryContentTag.length; j++){
			 if (arrPrimaryContentTag[j] == document.getElementsByName('contentTag')[i].value) {
			 document.getElementsByName('contentTag')[i].setAttribute("checked","checked");
		 	}
		 }   
	}
});

$("#contentImg").change(function(){
	   if(this.files && this.files[0]) {
	    let reader = new FileReader;
	    reader.onload = function(data) {
	     $(".select_img img").attr("src", data.target.result).width(500);        
	    }
	    reader.readAsDataURL(this.files[0]);
	   }
	  });

var regExp = /[^0-9]/gi;
$("#contentPrice").keyup(function(){ numCheck($(this)); });
function numCheck(selector) {
 let tempVal = selector.val();
 selector.val(tempVal.replace(regExp, ""));
}

var myEditor;
ClassicEditor
	.create( document.querySelector( '#contentDes' ), {
		ckfinder: {
	        uploadUrl: '${pageContext.request.contextPath}/ckImgUpload' // ?????? ????????? ????????? url (post??? ?????????)
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
</script>
</html>
