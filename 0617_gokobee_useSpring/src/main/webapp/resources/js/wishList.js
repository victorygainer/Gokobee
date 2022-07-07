		function addWishList() {
	//console.log('addWishList()');
	let contentNum = document.getElementById('contentNum').value
	let userID = document.getElementById('userID').value;
	//console.log(contentNum);
	//console.log(userID);
	let data = {
			userID : userID,
			contentNum : contentNum
	};
	console.log(data);
	$.ajax({
		url : contextPath + "/shop/view/addWishList",
		type : "post",
		data : data,
		success : function() {
			alert("위시리스트에 추가 되었습니다.");
		},
		error : function() {
			location.href= contextPath + "/login"
		}	
	});
}
		
		