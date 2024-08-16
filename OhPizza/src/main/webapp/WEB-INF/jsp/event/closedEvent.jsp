<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Sidebar -->
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

<span class="img">
<img src="images/endevent.jpg" alt="6월다 june day, '히든 굿즈 팩 2종'출시!"><br>
<strong>마감된 이벤트입니다.</strong>
</span>