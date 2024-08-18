<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- 상품목록  -->
<head>
<style>
a {
	text-decoration-line: none;
	color: black;
}
</style>
</head>

<!-- Navigation bar -->
<nav class="nav nav-pills nav-fill">
	<!-- <nav class="navbar navbar-dark bg-dark"> -->
	<div class="container px-5">
		<ul class="nav nav-pills nav-justifie">
			<li class="nav-item"><a class="nav-link"
				href="productList.do?type=pizza">피자</a></li>
			<li class="nav-item"><a class="nav-link"
				href="productList.do?type=spizza">1인용피자</a></li>
			<li class="nav-item"><a class="nav-link"
				href="productList.do?type=set">특가세트</a></li>
			<li class="nav-item"><a class="nav-link"
				href="productList.do?type=side">샐러드&사이드</a></li>
		</ul>
	</div>
</nav>
<!-- Sidebar -->
<div class="d-flex" id="wrapper">
	<!-- Sidebar-->
	<div class="border-end bg-white" id="sidebar-wrapper">
		<div class="sidebar-heading border-bottom bg-light"></div>
		<div class="list-group list-group-flush">
			<!-- c:choose를 사용해서 메뉴탭 나누기  made by 조수호 -->
			<c:choose>
				<c:when test="${'pizza' == type}">
					<a
						class="list-group-item list-group-item-action list-group-item-light p-3"
						href="productList.do?type=pizza&grade=P">프리미엄 피자</a>
					<a
						class="list-group-item list-group-item-action list-group-item-light p-3"
						href="productList.do?type=pizza&grade=C">클래식 피자</a>
					<a
						class="list-group-item list-group-item-action list-group-item-light p-3"
						href="productList.do?type=pizza">모두 보기</a>
				</c:when>
				<c:when test="${'spizza' == type}">
					<a
						class="list-group-item list-group-item-action list-group-item-light p-3"
						href="#!">1인 피자</a>
				</c:when>
				<c:when test="${'set' == type}">
					<a
						class="list-group-item list-group-item-action list-group-item-light p-3"
						href="#!">특가 세트</a>
				</c:when>
				<c:when test="${'side' == type}">
					<a
						class="list-group-item list-group-item-action list-group-item-light p-3"
						href="productList.do?type=side&grade=salad">샐러드&사이드</a>
					<a
						class="list-group-item list-group-item-action list-group-item-light p-3"
						href="productList.do?type=side&grade=pasta">파스타&사이드</a>
					<a
						class="list-group-item list-group-item-action list-group-item-light p-3"
						href="productList.do?type=side&grade=bever">음료</a>
					<a
						class="list-group-item list-group-item-action list-group-item-light p-3"
						href="productList.do?type=side">모두 보기</a>
				</c:when>
			</c:choose>
		</div>
	</div>
	
	<!-- Page content wrapper-->
	<div id="page-content-wrapper">
		<section class="py-5">
			<div class="container px-4 px-lg-5 mt-5">
				<div
					class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">

					<c:choose>
						<c:when test="${'pizza' == type}">
							<c:choose>
								<c:when test="${'P' == grade}">
									<c:forEach var="product" items="${productGList }">
										<!-- 아이템 -->
										<div class="col mb-5">
											<div class="card h-100">
												<!-- Sale badge-->
												<div class="badge bg-dark text-white position-absolute"
													style="top: 0.5rem; right: 0.5rem">Sale</div>
												<!-- Product image-->
												<img class="card-img-top" src="images/${product.image }"
													alt="..." />
												<!-- Product details-->
												<div class="card-body p-4">
													<div class="text-center">
														<!-- Product name-->
														<h5 class="fw-bolder">
															<a
																href="productInfo.do?type=${type }&prodNo=${product.prodNo }">${product.prodName}</a>
														</h5>
														<!-- Product reviews-->
														<div
															class="d-flex justify-content-center small text-warning mb-2">
															<c:forEach begin="1" end="${product.starPoint }">
																<div class="bi-star-fill"></div>
															</c:forEach>
														</div>
														<!-- Product price-->
														<form action="addOrder.do">
															<input type=hidden name=prodName
																value='${product.prodName }'> <input type=hidden
																name=memId value='${logId }'> <input type=hidden
																name=type value='${type }'> <input type=hidden
																name=grade value='${grade }'> <input type=hidden
																name=cnt value="1"> <input type=hidden
																name=prodNo value='${product.prodNo }'> <input
																type=radio name=price value='${product.priceM }' checked>
															M ${product.priceM } <input type=radio name=price
																value='${product.priceL }'> L ${product.priceL }
															<p></p>
															<button type=submit>Add to cart</button>
														</form>
													</div>
												</div>
												<!-- Product actions-->

											</div>
										</div>
									</c:forEach>
								</c:when>
								<c:when test="${'C' == grade}">
									<c:forEach var="product" items="${productGList }">
										<!-- 아이템 -->
										<div class="col mb-5">
											<div class="card h-100">
												<!-- Sale badge-->
												<div class="badge bg-dark text-white position-absolute"
													style="top: 0.5rem; right: 0.5rem">Sale</div>
												<!-- Product image-->
												<img class="card-img-top" src="images/${product.image }"
													alt="..." />
												<!-- Product details-->
												<div class="card-body p-4">
													<div class="text-center">
														<!-- Product name-->
														<h5 class="fw-bolder">
															<a
																href="productInfo.do?type=${type }&prodNo=${product.prodNo }">${product.prodName}</a>
														</h5>
														<!-- Product reviews-->
														<div
															class="d-flex justify-content-center small text-warning mb-2">
															<c:forEach begin="1" end="${product.starPoint }">
																<div class="bi-star-fill"></div>
															</c:forEach>
														</div>
														<!-- Product price-->
														<form action="addOrder.do">
															<input type=hidden name=prodName
																value='${product.prodName }'> <input type=hidden
																name=memId value='${logId }'> <input type=hidden
																name=type value='${type }'> <input type=hidden
																name=grade value='${grade }'> <input type=hidden
																name=cnt value="1"> <input type=hidden
																name=prodNo value='${product.prodNo }'> <input
																type=radio name=price value='${product.priceM }' checked>
															M ${product.priceM } <input type=radio name=price
																value='${product.priceL }'> L ${product.priceL }
															<p></p>
															<button type=submit>Add to cart</button>
														</form>
													</div>
												</div>
												<!-- Product actions-->

											</div>
										</div>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<c:forEach var="product" items="${productList }">
										<!-- 아이템 -->
										<div class="col mb-5">
											<div class="card h-100">
												<!-- Sale badge-->
												<div class="badge bg-dark text-white position-absolute"
													style="top: 0.5rem; right: 0.5rem">Sale</div>
												<!-- Product image-->
												<img class="card-img-top" src="images/${product.image }"
													alt="..." />
												<!-- Product details-->
												<div class="card-body p-4">
													<div class="text-center">
														<!-- Product name-->
														<h5 class="fw-bolder">
															<a
																href="productInfo.do?type=${type }&prodNo=${product.prodNo }">${product.prodName}</a>
														</h5>
														<!-- Product reviews-->
														<div
															class="d-flex justify-content-center small text-warning mb-2">
															<c:forEach begin="1" end="${product.starPoint }">
																<div class="bi-star-fill"></div>
															</c:forEach>
														</div>
														<!-- Product price-->
														<form action="addOrder.do">
															<input type=hidden name=prodName
																value='${product.prodName }'> <input type=hidden
																name=memId value='${logId }'> <input type=hidden
																name=type value='${type }'> <input type=hidden
																name=grade value='${grade }'> <input type=hidden
																name=cnt value="1"> <input type=hidden
																name=prodNo value='${product.prodNo }'> <input
																type=radio name=price value='${product.priceM }' checked>
															M ${product.priceM } <input type=radio name=price
																value='${product.priceL }'> L ${product.priceL }
															<p></p>
															<button type=submit>Add to cart</button>
														</form>
													</div>
												</div>
												<!-- Product actions-->
											</div>
										</div>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</c:when>
					</c:choose>

					<!-- 싱글 피자라인!!!!!!!!!!!!!!!!!!!!!!! -->
					<c:choose>
						<c:when test="${'spizza' == type}">
							<c:forEach var="product" items="${productList }">
								<!-- 아이템 -->
								<div class="col mb-5">
									<div class="card h-100">
										<!-- Sale badge-->
										<div class="badge bg-dark text-white position-absolute"
											style="top: 0.5rem; right: 0.5rem">Sale</div>
										<!-- Product image-->
										<img class="card-img-top" src="images/${product.image }"
											alt="..." />
										<!-- Product details-->
										<div class="card-body p-4">
											<div class="text-center">
												<!-- Product name-->
												<h5 class="fw-bolder">
													<a
														href="productInfo.do?type=${type }&prodNo=${product.prodNo }">${product.prodName}</a>
												</h5>
												<!-- Product reviews-->
												<div
													class="d-flex justify-content-center small text-warning mb-2">
													<c:forEach begin="1" end="${product.starPoint }">
														<div class="bi-star-fill"></div>
													</c:forEach>
												</div>
												<!-- Product price-->
												<form action="addOrder.do">
													<input type=hidden name=prodName
														value='${product.prodName }'> <input type=hidden
														name=memId value='${logId }'> <input type=hidden
														name=type value='${type }'> <input type=hidden
														name=grade value='${grade }'> <input type=hidden
														name=cnt value="1"> <input type=hidden name=prodNo
														value='${product.prodNo }'> <input type=radio
														name=price value='${product.priceM }' checked> M
													${product.priceM }
													<p></p>
													<button type=submit>Add to cart</button>
												</form>
											</div>
										</div>
										<!-- Product actions-->
									</div>
								</div>
							</c:forEach>
						</c:when>
					</c:choose>

					<!-- 세트라인!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
					<c:choose>
						<c:when test="${'set' == type}">
							<c:forEach var="product" items="${productList }">
								<!-- 아이템 -->
								<div class="col mb-5">
									<div class="card h-100">
										<!-- Sale badge-->
										<div class="badge bg-dark text-white position-absolute"
											style="top: 0.5rem; right: 0.5rem">Sale</div>
										<!-- Product image-->
										<img class="card-img-top" src="images/${product.image }"
											alt="..." />
										<!-- Product details-->
										<div class="card-body p-4">
											<div class="text-center">
												<!-- Product name-->
												<h5 class="fw-bolder">
													<a
														href="productInfo.do?type=${type }&prodNo=${product.prodNo }">${product.prodName}</a>
												</h5>
												<!-- Product reviews-->
												<div
													class="d-flex justify-content-center small text-warning mb-2">
													<c:forEach begin="1" end="${product.starPoint }">
														<div class="bi-star-fill"></div>
													</c:forEach>
												</div>
												<!-- Product price-->
												<form action="addOrder.do">
													<input type=hidden name=prodName
														value='${product.prodName }'> <input type=hidden
														name=memId value='${logId }'> <input type=hidden
														name=type value='${type }'> <input type=hidden
														name=grade value='${grade }'> <input type=hidden
														name=cnt value="1"> <input type=hidden name=prodNo
														value='${product.prodNo }'> <input type=radio
														name=price value='${product.priceM }' checked> M
													${product.priceM } <input type=radio name=price
														value='${product.priceL }'> L ${product.priceL }
													<p></p>
													<button type=submit>Add to cart</button>
												</form>
											</div>
										</div>
										<!-- Product actions-->
									</div>
								</div>
							</c:forEach>
						</c:when>
					</c:choose>


					<!-- 사이드 !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
					<c:choose>
						<c:when test="${'side' == type}">
							<c:choose>
								<c:when test="${'salad' == grade}">
									<c:forEach var="product" items="${productGList }">
										<!-- 아이템 -->
										<div class="col mb-5">
											<div class="card h-100">
												<!-- Sale badge-->
												<div class="badge bg-dark text-white position-absolute"
													style="top: 0.5rem; right: 0.5rem">Sale</div>
												<!-- Product image-->
												<img class="card-img-top" src="images/${product.image }"
													alt="..." />
												<!-- Product details-->
												<div class="card-body p-4">
													<div class="text-center">
														<!-- Product name-->
														<h5 class="fw-bolder">
															<a
																href="productInfo.do?type=${type }&prodNo=${product.prodNo }">${product.prodName}</a>
														</h5>
														<!-- Product reviews-->
														<div
															class="d-flex justify-content-center small text-warning mb-2">
															<c:forEach begin="1" end="${product.starPoint }">
																<div class="bi-star-fill"></div>
															</c:forEach>
														</div>
														<!-- Product price-->
														<form action="addOrder.do">
															<input type=hidden name=prodName
																value='${product.prodName }'> <input type=hidden
																name=memId value='${logId }'> <input type=hidden
																name=type value='${type }'> <input type=hidden
																name=grade value='${grade }'> <input type=hidden
																name=cnt value="1"> <input type=hidden
																name=prodNo value='${product.prodNo }'> <input
																type=radio name=price value='${product.priceM }' checked>
															M ${product.priceM }
															<p></p>
															<button type=submit>Add to cart</button>
														</form>
													</div>
												</div>
												<!-- Product actions-->

											</div>
										</div>
									</c:forEach>
								</c:when>
								<c:when test="${'pasta' == grade}">
									<c:forEach var="product" items="${productGList }">
										<!-- 아이템 -->
										<div class="col mb-5">
											<div class="card h-100">
												<!-- Sale badge-->
												<div class="badge bg-dark text-white position-absolute"
													style="top: 0.5rem; right: 0.5rem">Sale</div>
												<!-- Product image-->
												<img class="card-img-top" src="images/${product.image }"
													alt="..." />
												<!-- Product details-->
												<div class="card-body p-4">
													<div class="text-center">
														<!-- Product name-->
														<h5 class="fw-bolder">
															<a
																href="productInfo.do?type=${type }&prodNo=${product.prodNo }">${product.prodName}</a>
														</h5>
														<!-- Product reviews-->
														<div
															class="d-flex justify-content-center small text-warning mb-2">
															<c:forEach begin="1" end="${product.starPoint }">
																<div class="bi-star-fill"></div>
															</c:forEach>
														</div>
														<!-- Product price-->
														<form action="addOrder.do">
															<input type=hidden name=prodName
																value='${product.prodName }'> <input type=hidden
																name=memId value='${logId }'> <input type=hidden
																name=type value='${type }'> <input type=hidden
																name=grade value='${grade }'> <input type=hidden
																name=cnt value="1"> <input type=hidden
																name=prodNo value='${product.prodNo }'> <input
																type=radio name=price value='${product.priceM }' checked>
															M ${product.priceM }
															<p></p>
															<button type=submit>Add to cart</button>
														</form>
													</div>
												</div>
												<!-- Product actions-->

											</div>
										</div>
									</c:forEach>
								</c:when>
								<c:when test="${'bever' == grade}">
									<c:forEach var="product" items="${productGList }">
										<!-- 아이템 -->
										<div class="col mb-5">
											<div class="card h-100">
												<!-- Sale badge-->
												<div class="badge bg-dark text-white position-absolute"
													style="top: 0.5rem; right: 0.5rem">Hot</div>
												<!-- Product image-->
												<img class="card-img-top" src="images/${product.image }"
													alt="..." />
												<!-- Product details-->
												<div class="card-body p-4">
													<div class="text-center">
														<!-- Product name-->
														<h5 class="fw-bolder">
															<a
																href="productInfo.do?type=${type }&prodNo=${product.prodNo }">${product.prodName}</a>
														</h5>
														<!-- Product reviews-->
														<!-- Product price-->
														<form action="addOrder.do">
															<input type=hidden name=prodName
																value='${product.prodName }'> <input type=hidden
																name=memId value='${logId }'> <input type=hidden
																name=type value='${type }'> <input type=hidden
																name=grade value='${grade }'> <input type=hidden
																name=cnt value="1"> <input type=hidden
																name=prodNo value='${product.prodNo }'> <input
																type=radio name=price value='${product.priceM }' checked>
															M ${product.priceM } <input type=radio name=price
																value='${product.priceL }'> L ${product.priceL }
															<p></p>
															<button type=submit>Add to cart</button>
														</form>
													</div>
												</div>
												<!-- Product actions-->

											</div>
										</div>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<c:forEach var="product" items="${productList }">
										<!-- 아이템 -->
										<div class="col mb-5">
											<div class="card h-100">
												<!-- Sale badge-->
												<div class="badge bg-dark text-white position-absolute"
													style="top: 0.5rem; right: 0.5rem">Sale</div>
												<!-- Product image-->
												<img class="card-img-top" src="images/${product.image }"
													alt="..." />
												<!-- Product details-->
												<div class="card-body p-4">
													<div class="text-center">
														<!-- Product name-->
														<h5 class="fw-bolder">
															<a
																href="productInfo.do?type=${type }&prodNo=${product.prodNo }">${product.prodName}</a>
														</h5>
														<!-- Product reviews-->
														<div
															class="d-flex justify-content-center small text-warning mb-2">
															<c:forEach begin="1" end="${product.starPoint }">
																<div class="bi-star-fill"></div>
															</c:forEach>
														</div>
														<!-- Product price-->
														<c:choose>
															<c:when test="${0 != product.priceL }">
																<form action="addOrder.do">
																	<input type=hidden name=prodName
																		value='${product.prodName }'> <input
																		type=hidden name=memId value='${logId }'> <input
																		type=hidden name=type value='${type }'> <input
																		type=hidden name=grade value='${grade }'> <input
																		type=hidden name=cnt value="1"> <input
																		type=hidden name=prodNo value='${product.prodNo }'>
																	<input type=radio name=price value='${product.priceM }'
																		checked> M ${product.priceM } <input
																		type=radio name=price value='${product.priceL }'>
																	L ${product.priceL }
																	<p></p>
																	<button type=submit>Add to cart</button>
																</form>
															</c:when>
															<c:otherwise>
																<form action="addOrder.do">
																	<input type=hidden name=prodName
																		value='${product.prodName }'> <input
																		type=hidden name=memId value='${logId }'> <input
																		type=hidden name=type value='${type }'> <input
																		type=hidden name=grade value='${grade }'> <input
																		type=hidden name=cnt value="1"> <input
																		type=hidden name=prodNo value='${product.prodNo }'>
																	<input type=radio name=price value='${product.priceM }'
																		checked> M ${product.priceM }
																	<p></p>
																	<button type=submit>Add to cart</button>
																</form>
															</c:otherwise>
														</c:choose>
													</div>
												</div>
												<!-- Product actions-->

											</div>
										</div>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</c:when>
					</c:choose>

				</div>
			</div>
		</section>
	</div>
</div>