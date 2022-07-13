function ReservationOK() {
	//console.log('reservationOK()');
	let contentNum = document.getElementById('contentNum').value;
	let userID = document.getElementById('userID').value;
	let contentOwner = document.getElementById('contentOwner').value;
	let dateChoose =  document.getElementById('dateChoose').value;
	let memberChoose = document.getElementById('memberChoose').value;
	let contentPrice = document.getElementById('contentPrice').value;
	let totalPrice = memberChoose * contentPrice;
	//console.log(dateChoose);
	console.log('contentNum: ' + contentNum + ', userID: ' + userID + ',contentOwner: ' 
			+ contentOwner + ', dateChoose: ' + dateChoose + ', memberChoose: ' + memberChoose);
	//console.log(totalPrice);
	let data = {
			userID : userID,
			contentNum : contentNum,
			contentOwner : contentOwner,
			dateChoose : dateChoose,
			memberChoose : memberChoose,
			totalPrice : totalPrice
	};
	$.ajax({
		url : contextPath + "/shop/view/reservationOK",
		type : "POST",
		data : data,
		success : function() {
			alert("예약이 완료 되었습니다.");
		},
		error : function() {
			location.href= contextPath + "/login"		
		}		
	});
}