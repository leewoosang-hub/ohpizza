<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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