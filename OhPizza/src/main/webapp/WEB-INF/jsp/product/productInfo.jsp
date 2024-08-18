<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- 상품상세. -->
<head>
<style>
a {
	text-decoration-line: none;
	color: black;
}
</style>
</head>
<!-- 단건 출력 -->
<section class="py-5">
	<div class="container px-4 px-lg-5 my-5">
		<div class="row gx-4 gx-lg-5 align-items-center">
			<div class="col-md-6">
				<!--  history.back()을 사용하면 이전페이지로 돌아감  -->
				<a href="productList.do?type=${prod.prodType }">목록으로</a>
				<p></p>
				<img class="card-img-top mb-5 mb-md-0" src="${prod.image}"
					alt="..." />
			</div>
			<div class="col-md-6">
				<c:choose>
					<c:when test="${NULL != logId }">
						<c:choose>
							<c:when test="${0 != prod.priceL }">
								<div class="small mb-1">제품번호: ${prod.prodNo}</div>
								<h1 class="display-5 fw-bolder">${prod.prodName}</h1>
								<form action="addOrder.do">
									<div class="fs-5 mb-5">
										<input type=hidden name=prodName value='${prod.prodName }'>
										<input type=hidden name=memId value='${logId }'> <input
											type=hidden name=type value='${type }'> <input
											type=hidden name=grade value='${grade }'> <input
											type=hidden name=prodNo value='${prod.prodNo }'> <input
											type=radio name=price value='${prod.priceM }' checked>
										M ${prod.priceM } <input type=radio name=price
											value='${prod.priceL }'> L ${prod.priceL }
									</div>
									<p class="lead">${prod.prodDesc}</p>
									<div class="d-flex">
										<input class="form-control text-center me-3" name=cnt value=1
											style="max-width: 3rem" />
										<button class="btn btn-outline-dark flex-shrink-0"
											type="submit">
											<i class="bi-cart-fill me-1"></i> Add to cart
										</button>
									</div>
								</form>
							</c:when>




							<c:otherwise>
								<div class="small mb-1">제품번호: ${prod.prodNo}</div>
								<h1 class="display-5 fw-bolder">${prod.prodName}</h1>
								<form action="addOrder.do">
								<div class="fs-5 mb-5">
										<input type=hidden name=prodName value='${prod.prodName }'>
										<input type=hidden name=memId value='${logId }'> <input
											type=hidden name=type value='${type }'> <input
											type=hidden name=grade value='${grade }'> <input
											type=hidden name=prodNo value='${prod.prodNo }'>
									
										<input type=radio name=price value='${prod.priceM }' checked>
										\ ${prod.priceM }
									
								</div>
								<p class="lead">${prod.prodDesc}</p>
								<div class="d-flex">
									<input class="form-control text-center me-3" name=cnt
										 value="1" style="max-width: 3rem" />
									<button class="btn btn-outline-dark flex-shrink-0"
										type="submit">
										<i class="bi-cart-fill me-1"></i> Add to cart
									</button>
								</div>
								<br>
								<br>
								<div>
									<h2>
										주문금액 : &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
										<h3>${prod.priceM }</h3>
								</div>
								</form>
							</c:otherwise>

						</c:choose>
					
					
					
					</c:when>


					<c:otherwise>
						<c:choose>
							<c:when test="${0 != prod.priceL }">
								<div class="small mb-1">제품번호: ${prod.prodNo}</div>
								<h1 class="display-5 fw-bolder">${prod.prodName}</h1>
								<form>
									<div class="fs-5 mb-5">
										<input
											type=radio name=price value='${prod.priceM }' checked>
										M ${prod.priceM } <input type=radio name=price
											value='${prod.priceL }'> L ${prod.priceL }
									</div>
									<p class="lead">${prod.prodDesc}</p>
									<div class="d-flex">
										<input class="form-control text-center me-3" name=cnt value=1
											style="max-width: 3rem" />
										<button class="btn btn-outline-dark flex-shrink-0"
											onclick="alert('로그인이 필요합니다.');" type="button">
											<i class="bi-cart-fill me-1"></i> Add to cart
										</button>
									</div>
								</form>
							</c:when>




							<c:otherwise>
								<div class="small mb-1">제품번호: ${prod.prodNo}</div>
								<h1 class="display-5 fw-bolder">${prod.prodName}</h1>
								<div class="fs-5 mb-5">
									<form>
										<input type=radio name=size value='M ${prod.priceM }' checked>
										\ ${prod.priceM }
									</form>
								</div>
								<p class="lead">${prod.prodDesc}</p>
								<div class="d-flex">
									<input class="form-control text-center me-3" id="inputQuantity"
										type="num" value="1" style="max-width: 3rem" />
									<button class="btn btn-outline-dark flex-shrink-0"
										onclick="alert('로그인이 필요합니다.');" type="button">
										<i class="bi-cart-fill me-1"></i> Add to cart
									</button>
								</div>
								<br>
								<br>
								<div>
									<h2>
										주문금액 : &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
										<h3>${prod.priceM }</h3>
								</div>
							</c:otherwise>

						</c:choose>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
</section>







<!-- 하단리스트 출력 -->
<section class="py-5 bg-light">
	<div class="container px-4 px-lg-5 mt-5">
		<h2 class="fw-bolder mb-4">Related products</h2>
		<div
			class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
			<c:forEach var="product" items="${productList}">
				<div class="col mb-5">
					<div class="card h-100">
						<!-- Sale badge-->
						<div class="badge bg-dark text-white position-absolute"
							style="top: 0.5rem; right: 0.5rem">Sale</div>
						<!-- Product image-->
						<img class="card-img-top" src="images/${product.image }" alt="..." />
						<!-- Product details-->
						<div class="card-body p-4">
							<div class="text-center">
								<!-- Product name-->
								<h5 class="fw-bolder">
									<a
										href="productInfo.do?type=${product.prodType }&prodNo=${product.prodNo }">${product.prodName}</a>
								</h5>
								<!-- Product reviews-->
								<div
									class="d-flex justify-content-center small text-warning mb-2">
									<c:forEach begin="1" end="${product.starPoint }">
										<div class="bi-star-fill"></div>
									</c:forEach>
								</div>
								<!-- Product price-->
								<span class="text-muted text-decoration-line-through">${product.priceL }
									원</span> ${product.priceM } 원
							</div>
						</div>
						<!-- Product actions-->
						<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
							<div class="text-center">
								<a class="btn btn-outline-dark mt-auto" href="#">Add to cart</a>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</section>


