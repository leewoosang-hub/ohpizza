<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<h1>게시판 페이지</h1>
<p>${pageOut }</p>
<!-- body -->
<!-- Sidebar -->
	<a href="boardForm.do"><button class="btn btn-warning" type="submit">글쓰기</button></a>
<div class="boardList">
	<table class="table table-striped">
		<thead>
			<tr>
				<th scope="col">게시판 번호</th>
				<th scope="col">제목</th>
				<th scope="col">작성자</th>
				<th scope="col">작성일</th>
				<th scope="col">조회수</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="board" items="${boardList }" varStatus="stat">
				<tr>
					<th scope="row">${board.boardNo }</th>
					<td><a href="boardDetail.do?bno=${board.boardNo }&id=${board.memId }">${board.boardTitle }</a></td>
					<td>${board.memId }</td>
					<td>${board.boardDate }</td>
					<td>${board.boardView }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
<!-- end body -->
<!-- Sidebar -->


<!-- end Sidebar -->
<!-- pageNumbering -->
<!-- <p>${pageOut }</p> -->
<!-- 페이징 -->
<nav aria-label="Page navigation example">
   <ul class="pagination justify-content-center">
   <!-- prev 페이지 -->
  <c:if test="${pageOut.preview }">
    <li class="page-item">
      <a class="page-link" href="boardList.do?pageNum=${pageOut.page - 1 }" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
      </a>
    </li>
  </c:if>
     <!-- 페이지 갯수만큼 링크생성 -->
    <c:forEach var="p" begin="${pageOut.startPage }" end="${pageOut.endPage }">
      <c:choose>
    	<c:when test="${pageOut.page == p }">
    	  <li class="page-item active" aria-current="page">
    	    <span class="page-link">${p }</span>
    	   </li>
    	</c:when>
    	<c:otherwise>
		  <li class="page-item"><a class="page-link" href="boardList.do?pageNum=${p }">${p }</a></li>
					<!--paging.getPage속성 = p 같으면..  -->
		</c:otherwise>
      </c:choose>
    </c:forEach>    
     <!-- next 페이지 -->
    <c:if test="${pageOut.isNext()}">
    <li class="page-item">
      <a class="page-link" href="boardList.do?pageNum=${pageOut.page + 1 }" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
      </a>
    </li>
    </c:if>
  </ul>
</nav>
<!-- 페이지부분 -->
<!-- end pageNumbering -->