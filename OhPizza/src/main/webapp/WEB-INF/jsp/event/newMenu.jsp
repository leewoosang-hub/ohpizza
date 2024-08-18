<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link href="css/allMarginPadding.css" rel="stylesheet">
<body>
  <section class="box">
	<div class="d-flex" id="wrapper">
		<!-- Sidebar-->
		<div class="border-end bg-white" id="sidebar-wrapper">
			<div class="sidebar-heading border-bottom bg-light" align="center">이벤트</div>
			<div class="list-group list-group-flush">
				<a
				class="list-group-item list-group-item-action list-group-item-light p-3"
				href="event.do">신제품 소개</a> <a
				class="list-group-item list-group-item-action list-group-item-light p-3"
				href="showCurrEvent.do">진행중 이벤트</a> <a
				class="list-group-item list-group-item-action list-group-item-light p-3"
				href="closedEvent.do">종료된 이벤트</a> 				
			</div>
		</div>
	</div>
	<div class="border-end bg-white" align="center" id="sidebar-wrapper">
		<h3>신제품 소개</h3>	
		<a href='productInfo.do?type=pizza&prodNo=10000002'><img src="images/thehiden.jpg" alt="img" width="40%"></a>
	</div>
  </section>
</body>