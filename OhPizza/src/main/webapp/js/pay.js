/**
 * 
 */

function buy(){
	
	
	let listNoL = [];
	
	let lastPrice = document.querySelector('input[name="aPrice"]').value;
	
	let id = document.querySelector('input[name="id"]').value;
	
	document.querySelectorAll('input[name="listNo"]').forEach((listNo)=>{
		console.log(listNo.value);
		
		listNoL.push(listNo.value);
	})
	
	console.log(listNoL);
	console.log(lastPrice);
	listNoL.value = listNoL.join(",");
	
	console.log(listNoL);
	
	location.href = 'finalBuy.do?listNoL=' + listNoL.value + '&price='+ lastPrice + '&id=' + id;
	
}