// 제품 버튼 클릭시 작동
function btnOnclick(stockName, price) {
		let table = document.getElementById('table-body');
		let name;
	
		if(table.rows.length == 0) {
			let amount = 1;
			let addRow = table.insertRow(table.rows.length);
			let cell1 = addRow.insertCell(0);
			let cell2 = addRow.insertCell(1);
			let cell3 = addRow.insertCell(2);
			cell1.innerHTML = stockName;
			cell2.innerHTML = amount;
			cell3.innerHTML = price;
			totalTable();
			return;
		}
		
		// 선택한 제품이 이미 테이블에 있는 경우 수량 합침
		for(var i=0; i < table.rows.length; i++) {
			name = table.rows[i].cells[0].innerHTML; 
			if(name == stockName) {
				let count = parseInt(table.rows[i].cells[1].innerHTML) + 1;
				table.rows[i].cells[1].innerHTML = count;
				table.rows[i].cells[2].innerHTML = price * count;
				totalTable();
				return;
			}
				
		}
		
		let amount = 1;
		let addRow = table.insertRow(table.rows.length);
		let cell1 = addRow.insertCell(0);
		let cell2 = addRow.insertCell(1);
		let cell3 = addRow.insertCell(2);
		cell1.innerHTML = stockName;
		cell2.innerHTML = amount;
		cell3.innerHTML = price;
		totalTable();
}
function totalTable(){
		let table = document.getElementById('table-body');
		let labelText = document.getElementById('totalLabel');
		let totalPrice = 0;
		
		if(table.rows.length == 0) {
			labelText.innerHTML = 0;
		}
		else {
			for(let i=0; i<table.rows.length; i++) {
				totalPrice += parseInt(table.rows[i].cells[2].innerHTML);
			}
			labelText.innerHTML = totalPrice;
		}
 }

function cancelBtn() {
	let table = document.getElementById('table-body');
	let length = table.rows.length;
	let labelText = document.getElementById('totalLabel');
	
	for(let i=0; i<=length; i++) {
		table.deleteRow(-1);
	}
	
	labelText.innerHTML = 0;
}

function salesHistory() {
	let salesHistoryUrl = "/sales/salesHistory";
	let option = "width = 600px, height=450px, top=100px, left=450px, scrollbars=yes";
	window.open(salesHistoryUrl, "판매 내역", option);
	
}
