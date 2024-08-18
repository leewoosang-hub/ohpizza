<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>오! 피자 홈페이지</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/styles.css" rel="stylesheet" />
<link href="css/indexSidebar.css" rel="stylesheet" />
</head>
<body class="d-flex flex-column h-100">
	<main class="flex-shrink-0">
		<!-- 상단바 -->
		<!-- Navigation-->
		
		<!--ohpizza로고-->
		<nav class="navbar navbar-expand-lg navbar-dark bg-white">
			<div class="container px-5">
				<a class="navbar-brand" href="index.jsp">
					<nav class="navbar navbar-light bg-white">
						<div class="container-fluid">
							<a class="navbar-brand" href="index.jsp"> <img
							src="images/ohPizzaLoge.jpg" alt="" width="180" height="80"
							class="d-inline-block align-text-top">
							</a>
						</div>
					</nav>
				</a>
				<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
				</button>

				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
	  					<!--바로주문-->
						<!-- <li class="nav-item"><a class="nav-link" href="index.jsp"> -->
							<!-- <nav class="navbar navbar-light bg-white"> -->
								<!-- <div class="container-fluid"> -->
									<!-- <a class="navbar-brand" href="index.jsp"> <img -->
									<!-- src="images/menu1.jpg" alt="" width="150" height="60" -->
									<!-- class="d-inline-block align-text-top"> -->
									<!-- </a> -->
								<!-- </div> -->
							<!-- </nav> -->
						<!-- </a></li> -->
						<!--바로주문-->
						<!--메뉴-->
						<li class="nav-item"><a class="nav-link" href="productList.do">
							<nav class="navbar navbar-light bg-white">
								<div class="container-fluid">
									<a class="navbar-brand" href="productList.do"> <img
									src="images/menu2.jpg" alt="" width="125" height="50"
									class="d-inline-block align-text-top">
									</a>
								</div>
							</nav>
						</a></li>
						<!--메뉴-->
						<!--매장-->
						<li class="nav-item"><a class="nav-link" href="#">
							<nav class="navbar navbar-light bg-white">
								<div class="container-fluid">
									<a class="navbar-brand" href="storeList.do"> <img
									src="images/menu3.jpg" alt="" width="125" height="50"
									class="d-inline-block align-text-top">
									</a>
								</div>
							</nav>
						</a></li>
						<!--매장-->
						<!--이벤트-->
						<li class="nav-item"><a class="nav-link" href="event.do">
							<nav class="navbar navbar-light bg-white">
								<div class="container-fluid">
									<a class="navbar-brand" href="event.do"> <img
									src="images/menu4.jpg" alt="" width="125" height="50"
									class="d-inline-block align-text-top">
									</a>
								</div>
							</nav>
						</a></li>
						<!--이벤트-->
						<!--게시판-->
						<li class="nav-item"><a class="nav-link" href="boardList.do">
							<nav class="navbar navbar-light bg-white">
								<div class="container-fluid">
									<a class="navbar-brand" href="boardList.do"> <img
									src="images/board.jpg" alt="" width="125" height="45"
									class="d-inline-block align-text-top">
									</a>
								</div>
							</nav>
						</a></li>
						<!--게시판-->
						<!--마이오피-->
						<li class="nav-item"><a class="nav-link" href="myPage.do">
							<nav class="navbar navbar-light bg-white">
								<div class="container-fluid">
									<a class="navbar-brand" href="myPage.do"> <img
									src="images/menu5.jpg" alt="" width="125" height="50"
									class="d-inline-block align-text-top">
									</a>
								</div>
							</nav>
						</a></li>
						<!--마이오피-->
						<!--장바구니-->
						<li class="nav-item">
						  <c:choose>
						    <c:when test="${NULL != logId }">
						      <a class="nav-link" href="cart.do?id=${logId }">
							    <nav class="navbar navbar-light bg-white">
								  <div class="container-fluid">
									<a class="navbar-brand" href="cart.do?id=${logId }"> <img
									src="images/basket.jpg" alt="" width="125" height="45"
									class="d-inline-block align-text-top">
									</a>
								  </div>
							    </nav>
							  </a>
							</c:when>
						    <c:otherwise>
						      <a class="nav-link" href="#">
							    <nav class="navbar navbar-light bg-white">
								  <div class="container-fluid">
									<a class="navbar-brand" href="#"> <img
									src="images/basket.jpg" alt="" width="125" height="45"
									class="d-inline-block align-text-top"
									onclick="alert('로그인이 필요합니다.');">
									</a>
								  </div>
							    </nav>
							  </a>
							</c:otherwise>
						  </c:choose> 
						</li>
						<!--장바구니-->
					</ul>
				</div>
			</div>
		</nav>
            <!-- 이미지 슬라이드 -->
		<div id="carouselExampleControls" class="carousel slide"
			data-bs-ride="carousel">
			<div class="carousel-inner">
				<div class="carousel-item active">
					<a
						href="productInfo.do?type=pizza&prodNo=10000002">
						<img src="images/mainEvent3.jpg" class="d-block w-100" alt="...">
					</a>
				</div>
				<div class="carousel-item">
					<img src="images/mainEvent2.jpg" class="d-block w-100" alt="...">
				</div>
				<div class="carousel-item">
					<img src="images/mainEvent1.jpg" class="d-block w-100" alt="...">
				</div>
			</div>
			<button class="carousel-control-prev" type="button"
				data-bs-target="#carouselExampleControls" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button"
				data-bs-target="#carouselExampleControls" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
			</button>
		</div>
		<!-- quickMenu -->
		<nav>
			<ul id="quickmenu">
				<c:choose>
                  <c:when test="${empty logId }">
                    <li><a href="login.do">로그인</a></li>
                  </c:when>
                  <c:otherwise>
                    <li><a href="logout.do">로그아웃</a></li>
                  </c:otherwise>
                </c:choose>
				<li><a href="addMember.do">회원가입</a></li>
				<c:choose>
                  <c:when test="${empty logId }">
                    <li><a href="#"><span onclick="alert('로그인이 필요합니다.');">장바구니</span></a></li>
                  </c:when>
                  <c:otherwise>
                    <li><a href="cart.do?id=${logId }">장바구니</a></li>
                  </c:otherwise>
                </c:choose>
			</ul>
		</nav>
		<!-- quickMenu -->
		
		<!-- 추천메뉴-->
			<section class="py-5">
			<div class="container px-5 my-5">
				<div class="row gx-5 justify-content-center">
					<div class="col-lg-8 col-xl-6">
						<div class="text-center">
							<h2 class="fw-bolder" >추천메뉴</h2>
							
						</div>
					</div>
				</div>
				<div class="row gx-5">
					<div class="col-lg-4 mb-5">
						<div class="card h-100 shadow border-0">
							<img class="card-img-top" src="images/secret.jpg" alt="..." />
							<div class="card-body p-4">
								<div class="badge bg-primary bg-danger rounded-pill mb-2">HOT!</div>
								<a class="text-decoration-none link-dark stretched-link"
									href="productInfo.do?type=pizza&prodNo=10000001"><h5 class="card-title mb-3">시크릿가든</h5></a>
								<p class="card-text mb-0">S케이준치킨과 시금치로 더 라이트하고 담백하게 즐길 수 있는
									웰빙 피자! ‘시크릿가든’</p>
							</div>
							<div class="card-footer p-4 pt-0 bg-transparent border-top-0">
								<div class="d-flex align-items-end justify-content-between">
									<div class="d-flex align-items-center">
									
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-4 mb-5">
						<div class="card h-100 shadow border-0">
							<img class="card-img-top" src="https://cdn.mrpizza.co.kr/2011/uploadV1/product_new/20243792316094.jpg" alt="..." />
							<div class="card-body p-4">
								<div class="badge bg-primary bg-danger rounded-pill mb-2">HOT!</div>
								<a class="text-decoration-none link-dark stretched-link"
									href="productInfo.do?type=pizza&prodNo=10000002"><h5 class="card-title mb-3">더 히든 시크릿</h5></a>
								<p class="card-text mb-0">한 판에 즐기는 2가지 히든 메뉴의 환상의 콜라보! 프레시한
									마르게리따에 숨겨진 비밀 레시피! 씬도우의 바삭함과 색다른 조합으로 부담없는 담백함이 매력인 피자! 바질소스의
									후토핑으로 풍미는 UP! 도우와 도우사이 토핑과 치즈가 들어간 샌드 피자!</p>
							</div>
							<div class="card-footer p-4 pt-0 bg-transparent border-top-0">
								<div class="d-flex align-items-end justify-content-between">
									<div class="d-flex align-items-center">
										
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-4 mb-5">
						<div class="card h-100 shadow border-0">
							<img class="card-img-top" src="images/shrimp.jpg" alt="..." />
							<div class="card-body p-4">
								<div class="badge bg-primary bg-danger rounded-pill mb-2">HOT!</div>
								<a class="text-decoration-none link-dark stretched-link"
									href="productInfo.do?type=pizza&prodNo=10000003"><h5 class="card-title mb-3">햄벅한새우</h5></a>
								<p class="card-text mb-0">치즈 햄버거와 마요 콘새우의 행복한 맛남! 히코리BBQ소스의
									치즈 햄버거 토핑과 치즈시즈닝이 뿌려진 탱글탱글한 마요 콘새우 토핑의 사이좋은 반반 조화 풍미가득한 비프와
									프레쉬한 씨푸드가 드리는 완벽한 만족감을 직접 느껴보세요!</p>
							</div>
							<div class="card-footer p-4 pt-0 bg-transparent border-top-0">
								<div class="d-flex align-items-end justify-content-between">
									<div class="d-flex align-items-center">
									
            						<!--<img class="rounded-circle me-3"
											src="https://dummyimage.com/40x40/ced4da/6c757d" alt="..." />
										<div class="small">
											<div class="fw-bold">Evelyn Martinez</div>
											<div class="text-muted">April 2, 2023 &middot; 10 min
												read</div>
										</div> -->
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
			
	</main>
    <!-- Footer-->
	<footer class="bg-info py-4 mt-auto fixed-bottom">
		<div class="container px-5">
			<div
				class="row align-items-center justify-content-between flex-column flex-sm-row">
				<div class="col-auto">
					<div class="small m-0 text-dark">대구 중구 중앙대로 403 5층
						예담직업전묵학교 대표이사:@@@ 개인정보 관리책임자:@@@ &copy; Your Website 2024</div>
				</div>
				<div class="col-auto">
					<a class="link-light small" href="#!">Privacy</a> <span
						class="text-dark mx-1">&middot;</span> <a
						class="link-light small" href="#!">Terms</a> <span
						class="text-dark mx-1">&middot;</span> <a
						class="link-light small" href="#!">Contact</a>
				</div>
			</div>
		</div>
	</footer>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>
</body>
</html>
