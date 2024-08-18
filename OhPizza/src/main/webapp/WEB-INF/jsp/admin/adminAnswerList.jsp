<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    

<table class="table table-light table-striped table-hover">
	<thead>
		<tr>
			<th scope="col">작성일</th>
			<th scope="col">제목</th>
			<th scope="col">작성자</th>
			<th scope="col">답변</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="adminList" items="${adminAnswerList }" varStatus="stat">
			<tr>
				<td>${adminList.boardDate() }</td>
				<td><a href="adminAnswerList.do?pageNum=${adminList.boardNo }" style="text-decoration-line: none; color:black">${adminList.boardTitle }</a></td>
				<td>${adminList.memId }</td>
				<c:choose>
				<c:when test="${adminList.answer == null }">
				<td><button onclick="location.href='adminAnswerForm.do?bno=${adminList.boardNo }'">답변하기</button></td>
				</c:when>
				<c:otherwise>
				<td>${adminList.answer }</td>
				</c:otherwise>
				</c:choose>
			</tr>
		</c:forEach>
	</tbody>
</table>
<!-- 페이징 -->
<nav aria-label="Page navigation example">
	<ul class="pagination justify-content-center">
		<!-- prev 페이지 -->
		<c:if test="${paging.preview }">
			<li class="page-item"><a class="page-link"
				href="adminAnswerList.do?pageNum=${paging.page - 1 }"
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
						href="adminAnswerList.do?pageNum=${p }">${p }</a></li>
					<!--paging.getPage속성 = p 같으면..  -->
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<!-- next 페이지 -->
		<c:if test="${paging.isNext()}">
			<li class="page-item"><a class="page-link"
				href="adminAnswerList.do?pageNum=${paging.page + 1 }" aria-label="Next">
					<span aria-hidden="true">&raquo;</span>
			</a></li>
		</c:if>
	</ul>
</nav>
<!-- 페이지부분 -->