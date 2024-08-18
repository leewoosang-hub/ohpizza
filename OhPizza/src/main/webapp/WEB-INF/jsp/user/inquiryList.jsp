<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- <table class="table table-light table-striped table-hover"> -->
<link href="css/allMarginPadding.css" rel="stylesheet">
<body>
  <section class="box">
	<table class="table table-striped">
		<thead>
			<tr>
				<th scope="col">#</th>
				<th scope="col">등록일자</th>
				<!-- <th scope="col">건의사항</th> -->
				<th scope="col">제목</th>
				<th scope="col">문의내용</th>
				<th scope="col">답변</th>
				<!-- <th scope="col">등록 ID</th> -->
			</tr>
		</thead>
		<tbody>
			<c:forEach var="inquiry" items="${inquiryList }" varStatus="stat">
				<tr>
					<th scope="row">${stat.count }</th>
					<td scope="row">${inquiry.boardDate() }</td>
					<td scope="row">${inquiry.boardTitle }</td>
					<td scope="row">${inquiry.question }</td>
					<td scope="row">${inquiry.answer }</td>
	
					<!-- <td scope="row">${inquiry.memId }</td> -->
	
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
	<div class="fixed-bottom">
	<!-- 페이징 -->
	<nav aria-label="Page navigation example">
		<ul class="pagination justify-content-center">
			<!-- prev 페이지 -->
			<c:if test="${paging.preview }">
				<li class="page-item"><a class="page-link"
					href="inquiryList.do?page=${paging.page - 1 }"
					aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
				</a></li>
			</c:if>
			<!-- 페이지 갯수만큼 링크생성 -->
			<c:forEach var="p" begin="${paging.startPage }"
				end="${paging.endPage }">
				<c:choose>
					<c:when test="${paging.page == p }">
						<li class="page-item active" aria-current="page"><span
							class="page-link">${p }</span></li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="page-link"
							href="inquiryList.do?page=${p }">${p }</a></li>
						<!--paging.getPage속성 = p 같으면..  -->
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<!-- next 페이지 -->
			<c:if test="${paging.isNext()}">
				<li class="page-item"><a class="page-link"
					href="inquiryList.do?page=${paging.page + 1 }" aria-label="Next">
						<span aria-hidden="true">&raquo;</span>
				</a></li>
			</c:if>
		</ul>
	</nav>
	</div>
	<!-- 페이지부분 -->
  </section>
</body>

