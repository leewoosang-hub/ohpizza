<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<link href="css/cartList.css" rel="stylesheet">

		<body>
			<section class="cart">

				<div class="cartinformation">
					<ul>
						<li>장바구니 상품은 최대 30일간 저장됩니다.</li>
						<li>가격, 옵션 등 정보가 변경된 경우 주문이 불가할 수 있습니다.</li>
						<li>오늘출발 상품은 판매자 설정 시점에 따라 오늘출발 여부가 변경될 수 있으니 주문 시 꼭 다시 확인해 주시기
							바랍니다.</li>
					</ul>
				</div>
				<table class="cartlist">
					<thead>
					</thead>

					<tbody>
						<tr>
							<th><input type="checkbox" id="aCheck" onclick='allCheck(this)'></th>
							<th>제품명</th>
							<th>가격</th>
							<th>개수</th>
							<th>총가격</th>
						</tr>
						<c:forEach var="cart" items="${cartList }">
							<tr class="cartlistdetail">
								<td><input type="checkbox" value="${cart }" name="clist" onclick='checkCart()'><input type="hidden" value=${cart.listNo }></td>
								<td><!--<img src="image/${cart.prodName }.jpg" alt="pizza">-->
									<a href="productInfo.do?prodNo=${cart.prodNo }">${cart.prodName }</a>
								</td>
								<td><span class="price">${cart.prodPrice }</span></td>

								<td>
									<input type=hidden name=id value='${logId }'>
									<input type=hidden name=listNo value=${cart.listNo }>
									<input type=text name=count value=${cart.count } readonly size=1>
									<button class="quantity_btn plus_btn">+</button>
									<button class="quantity_btn minus_btn">-</button>
								</td>

								<td>${cart.count*cart.prodPrice }</td>

								<td>
									<form action="cartDelete.do">
										<input type=hidden name=id value='${logId }'>
										<input type=hidden name=listNo value='${cart.listNo }'>
										<button type="submit">삭제</button>
									</form>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>

				<div>
					<input type=hidden name=id value='${logId }'>
					<input type=hidden name=cart value='${cartList }'>
					<input type=hidden name=price value='${aPrice }'>
					<h1>총 가격: </h1><h1 id=aPrice>0</h1>
					<button type=button onclick='priceCart()'>결제하기</button>
				</div>
			</section>

		</body>

		<script src="js/checkCart.js"></script>

