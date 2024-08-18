/**
 * 
 */
// 증거버튼에 이벤트 등록.
document.querySelectorAll('.plus_btn').forEach(btn => {
	// 이벤트 등록.
	btn.addEventListener('click', function(e) {
		// ajax. 호출.
		let listNo = this.parentElement.children[1].value;
		let count = this.parentElement.children[2].value;
		console.log(listNo, count);
		fetch('UpPcnt.do?listNo=' + listNo + '&count=' + count)
			.then(result => result.json())
			.then(result => {
				console.log(result);
				this.parentElement.children[2].value = parseInt(count) + 1;
				this.parentElement.parentElement.children[4].innerHTML = this.parentElement.parentElement.children[2].children[0].innerHTML * (parseInt(count) + 1);
				checkCart();
			})
			.catch(err => console.log(err))

	})
});



document.querySelectorAll('.minus_btn').forEach(btn => {
	btn.addEventListener('click', function(e) {

		let listNo = this.parentElement.children[1].value;
		let count = this.parentElement.children[2].value;
		console.log(listNo, count);
		
		if (parseInt(count) > 1) {

		fetch('downPcnt.do?listNo=' + listNo + '&count=' + count)
			.then(result => result.json())
			.then(result => {
				console.log(result);
				this.parentElement.children[2].value = parseInt(count) - 1;
				this.parentElement.parentElement.children[4].innerHTML = this.parentElement.parentElement.children[2].children[0].innerHTML * (parseInt(count) - 1);
				checkCart();
				
			})
			.catch(err => console.log(err))
		}

	})
});




function priceCart() {

	const query = 'input[name="clist"]:checked';
	let id = document.querySelector('[name="id"]').value;

	// productNo 2,3,4
	let cartA = [];

	// 총가격.
	let lastPrice = document.getElementById('aPrice').innerHTML;

	document.querySelectorAll(query).forEach((sCart) => {
		console.log(sCart.parentElement.children[1].value);
		cartA.push(sCart.parentElement.children[1].value);
	})
	console.log(cartA);
	cartA.value = cartA.join(",");
	console.log(cartA);
	console.log(lastPrice);
	console.log(id);

	location.href = 'pay.do?cartList=' + cartA.value + '&lastPrice=' + lastPrice + '&id=' + id;

}





function checkCart() {


	const query = 'input[name="clist"]:checked';

	let allPrice = 0;


	document.querySelectorAll(query).forEach((sCart) => {
		console.log(sCart.parentElement.parentElement.children[4].innerHTML);
		let price = Number(sCart.parentElement.parentElement.children[4].innerHTML);
		allPrice += price;
	})

	document.getElementById('aPrice').innerHTML = allPrice;
	
	chCheck();

}

function allCheck(e) {
	const query = 'input[name="clist"]';
	document.querySelectorAll(query).forEach((c) => {
		c.checked = e.checked;
	})
	checkCart();
}

function chCheck() {
	  const aCheck = document.getElementById('aCheck');
		const query = 'input[name="clist"]';
	document.querySelectorAll(query).forEach((c) => {
		if(c.checked === false){
		 	aCheck.checked = false;
		}	
	})
}
