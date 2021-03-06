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
		.container{
			margin: auto;
			width: 1000px;
			z-index: 1;
		}
		
		.content-container{
			width: 700px;
			margin: auto;
			padding: 20px 20px 20px 20px;
			  box-shadow: 0px 10px 9.9px 0.1px rgba(0, 0, 0, 0.1);
			  -moz-box-shadow: 0px 10px 9.9px 0.1px rgba(0, 0, 0, 0.1);
			  -webkit-box-shadow: 0px 10px 9.9px 0.1px rgba(0, 0, 0, 0.1);
			  -o-box-shadow: 0px 10px 9.9px 0.1px rgba(0, 0, 0, 0.1);
			  -ms-box-shadow: 0px 10px 9.9px 0.1px rgba(0, 0, 0, 0.1);
			  background-color: white;
			  z-index: 2;
		}
		.select_img img { margin:20px 0;}
		
		.content-buttons {
			text-align: center;
			margin-bottom: 40px;
		}
		
		#content-tag td {
			width: 200px;
		}
		
		#content-tag {
			margin-top:15px;
			margin-left: 30px;
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
		
		
		.ck-editor__editable { height: 400px; }
		
		.ck-content { font-size: 15px; }	
			
    </style>
</head>
<body style="background-color: skyblue;">


<!-- main -->
		<div class="container" role="main">	
			<!-- nav -->
			<nav id="nav">
				<div id="nav_box">
					<%@ include file = "../include/nav.jsp" %>
				</div>
			</nav>	
			
			<div class="content-container" style="margin-bottom: 40px;">
			<form action="contentRegisterOK" method="POST" autocomplete="off" enctype="multipart/form-data">
				 <br/>
				 <div class ="city-choice" style="margin-top: 20px;">
				 <label style="width: 50px; font-size: 20px">??????</label>
					 <select id="cityCode" name="cityCode" style="margin-left: 65px; width: 200px; padding: 8px; text-align: center">
					 	 <option value="??????">??????</option>
					 	 <option value="??????">??????</option>
					 	 <option value="??????">??????</option>
					 	 <option value="??????">??????</option>
					 </select>	
				</div>			
				<br/>
					 <hr>
				 <div class="cate-choice">
					 	<label style="width: 100px; font-size: 20px;">????????????</label>
						<input type="radio" id="cateCode1" name="cateCode" value="????????? ??????" style="margin-left: 15px;"> ????????? ??????
						<input type="radio" id="cateCode2" name="cateCode" value="????????????" style="margin-left: 30px;"> ????????????
						<input type="radio" id="cateCode3" name="cateCode" value="????????????" style="margin-left: 30px;"> ????????????
						<input type="radio" id="cateCode4" name="cateCode" value="????????????" style="margin-left: 30px;"> ????????????
				</div>
				<hr>
				<div class="content-tag">
					 	<label style="width: 100px; font-size: 20px;">????????????</label>
					<br/>
						<table id="content-tag">
							<tr>
								<td><input type="checkbox" id="contentTag1" name="contentTag" value="?????????/?????????"> ?????????/?????????</td>
								<td><input type="checkbox" id="contentTag2" name="contentTag" value="????????????"> ????????????</td>
								<td><input type="checkbox" id="contentTag3" name="contentTag" value="??????"> ??????</td>
								<td><input type="checkbox" id="contentTag4" name="contentTag" value="?????????/?????????"> ?????????/?????????</td>							
							</tr>
							<tr>
								<td><input type="checkbox" id="contentTag5" name="contentTag" value="????????????"> ????????????</td>
								<td><input type="checkbox" id="contentTag6" name="contentTag" value="????????????"> ????????????</td>
								<td><input type="checkbox" id="contentTag7" name="contentTag" value="??????/??????"> ??????/??????</td>
								<td><input type="checkbox" id="contentTag8" name="contentTag" value="??????"> ??????</td>
							</tr>
							<tr>
								<td><input type="checkbox" id="contentTag9" name="contentTag" value="??????/?????????"> ??????/?????????</td>
								<td><input type="checkbox" id="contentTag10" name="contentTag" value="??????"> ??????</td>
								<td><input type="checkbox" id="contentTag11" name="contentTag" value="????????????"> ????????????</td>
								<td><input type="checkbox" id="contentTag12" name="contentTag" value="??????/??????"> ??????/??????</td>
							</tr>
							<tr>
								<td><input type="checkbox" id="contentTag13" name="contentTag" value="?????????/??????"> ?????????/??????</td>
								<td><input type="checkbox" id="contentTag14" name="contentTag" value="?????????"> ?????????</td>
								<td><input type="checkbox" id="contentTag15" name="contentTag" value="??????/????????????"> ??????/????????????</td>
								<td><input type="checkbox" id="contentTag16" name="contentTag" value="?????????"> ?????????</td>
							</tr>
							<tr>
								<td><input type="checkbox" id="contentTag17" name="contentTag" value="??????"> ??????</td>
								<td><input type="checkbox" id="contentTag18" name="contentTag" value="????????????"> ????????????</td>
								<td><input type="checkbox" id="contentTag19" name="contentTag" value="???/?????????"> ???/?????????</td>
								<td><input type="checkbox" id="contentTag20" name="contentTag" value="?????????"> ?????????</td>
							</tr>					
						</table>
				</div>
				<hr>				
					<div class="content-name">
					 	<label style="width: 100px; font-size: 20px">????????????</label>
					 	<input type="text" id="contentName" class="form-control" name="contentName" style="width: 550px; display: inline;" placeholder="????????? ????????? ????????? (100??? ??????)">
					</div>
				<hr>			
					<div class="content-price">
					 	<label style="width: 100px; font-size: 20px">????????????</label>
						<input type="text" class="form-control" name="contentPrice" id="contentPrice" style="width: 100px; display: inline;">&nbsp;??? / 1???
					</div>
				<hr>
				<div class="content-summary">
				 	<label style="width: 100px; font-size: 20px">????????????</label>
					<textarea class="form-control" rows="1" name="contentSum" id="contentSum" placeholder="????????? ????????? ????????? (100??? ??????)" style="resize: none; margin-top: 10px; margin-bottom: 20px"></textarea>
					<hr/>
				</div>
				
				<div class="content-description">
					<label style="width: 100px; font-size: 20px; margin-bottom: 15px">????????????</label>
					<textarea class="form-control" rows="15" name="contentDes" id="contentDes" placeholder="????????? ????????? ?????????" style="resize: none;"></textarea>
				</div>
				<hr>
				<div class="content-image">
				 	<label style="width: 100px; font-size: 20px; margin-bottom: 10px">?????????</label>&nbsp;&nbsp;&nbsp;
					<input type="file" class="form-control" name="file" id="contentImg"/> 
					<div class="select_img" style="text-align: center;"><img src=""/></div>	
					<hr>
				</div>
				<div class="content-buttons">
					<input type="hidden" class="form-control" name="contentOwner" id="contentOwner" value="${userInfo.userID}">
					<input type="submit" value="????????????" class="btn btn-outline-dark"/>
					<input type="reset" value="????????????" class="btn btn-outline-dark"/>
					<input type="button" value="????????????" class="btn btn-outline-dark" onclick="history.back()"/>
				</div>
		</form>
		</div>
<!-- footer -->
		<footer id="footer">
			<div id="footer_box">
				<%@ include file = "../include/footer.jsp" %>
			</div>
		</footer>
	</div>
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
	        uploadUrl: 'ckImgUpload' // ?????? ????????? ????????? url (post??? ?????????)
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
