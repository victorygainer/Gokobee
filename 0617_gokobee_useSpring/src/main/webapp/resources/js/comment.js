
//코멘트 입력
const insertRequest = new XMLHttpRequest(); // 입력용
const searchRequest = new XMLHttpRequest(); // 검색용

function insertComment() {
	//console.log('insertComment()');
	//console.log(document.getElementById('contentNum').value);
	// console.log(document.getElementById('userID').value);
	// console.log(document.getElementById('commentDes').value);

	let url = './insertComment?n=' + encodeURIComponent(document.getElementById('contentNum').value)
		+ '&userID=' + encodeURIComponent(document.getElementById('userID').value)
		+ '&commentDes=' + encodeURIComponent(document.getElementById('commentDes').value)
	//console.log(url);
	insertRequest.open('GET', url, true);
	insertRequest.send(null);
	insertRequest.onreadystatechange = insertProcess;
}
function insertProcess() {
	 //console.log('insertProcess()');
	 //console.log(insertRequest.readyState)
	 //console.log(insertRequest.status)

	if (insertRequest.readyState == 4 && insertRequest.status == 200) {
		let result = insertRequest.responseText;
		console.log('결과: ' + result)
		//	저장 여부와 관계없이 텍스트 상자의 내용을 지운다.
		if (result == 11) {
			alert('댓글 저장 성공');
			commentList();
			document.getElementById('commentDes').value = '';
		} else {
			document.getElementById('commentDes').value = '';
			alert('댓글 저장 실패')
		} 
	}
}

function commentList() {
	 encodeURIComponent();
	 //console.log('commentList()');
	 //console.log(document.getElementById('userID').value);
	 //console.log(document.getElementById('commentDes').value);
	let url = '../commentList?n=' + encodeURIComponent(document.getElementById('contentNum').value)
	+ '&userID=' + encodeURIComponent(document.getElementById('userID').value)
	+ '&commentDes=' + encodeURIComponent(document.getElementById('commentDes').value)
	//console.log(url);
	searchRequest.open('GET', url, true);
	searchRequest.send(null);
	searchRequest.onreadystatechange = searchProcess;
}

function searchProcess() {
	 if (searchRequest.readyState == 4 && searchRequest.status == 200) {
			//console.log('responseText: ', searchRequest.responseText);
			let object = eval('(' + searchRequest.responseText + ')');
			//console.log("object" + object);
			let result = object.result;
			//console.log("result" + result);

			let table = document.getElementById('commentTable');
			table.innerHTML = '';

			// 데이터의 개수만큼 반복하며 테이블에 행을 만들어 추가한다.
			for (let i = 0; i < result.length; i++) {
				let row = table.insertRow(i);
				for (let j = 0; j < result[i].length; j++) {
					let cell = row.insertCell(j);
					cell.innerHTML = result[i][j].value;
				}
			}
		}
}
	 	onload = function() {
		 encodeURIComponent();
		 //console.log('commentList()');
		 //console.log(document.getElementById('userID').value);
		 //console.log(document.getElementById('commentDes').value);
		let url = '../commentList?n=' + encodeURIComponent(document.getElementById('contentNum').value)
		//console.log(url);
		searchRequest.open('GET', url, true);
		searchRequest.send(null);
		searchRequest.onreadystatechange = searchProcess;
}