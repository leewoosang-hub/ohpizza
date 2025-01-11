<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link href="css/allMarginPadding.css" rel="stylesheet" />

<script src="https://code.jquery.com/jquery-3.7.1.js"
	integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
	crossorigin="anonymous">
	
</script>

<style>
html, body {
	height: 100%; /* 전체 화면 높이 */
	margin: 0;
}

#wrapper {
	height: auto;
	min-height: 100%;
}

.board:hover {
	cursor: pointer;
	background: silver !important;
}

.title {
	text-align: center;
}

.btnMyBoard {
	position: relative;
	left: 0 rem;
	top: 0px;
}

.table {
	margin-top: 1rem;
}

.table>thead {
	border-top: 1px solid gray;
	border-bottom: 1px solid gray;
}

.table>thead>tr>th {
	text-align: center;
	vertical-align: middle;
}

.table>tbody>tr>td {
	height: 4rem;
	text-align: center;
	vertical-align: middle;
	border-bottom: solid 1px gray;
}

.table>tbody>tr:nth-child(even) {
	background-color: #ffffff;
}

footer {
	position: relative;
	transform: translateY(0%);
}
</style>

<body>
	<div id="wrapper">
		<section class="box">
			<input type="hidden" id="logId" value="${logId }" />
			<div>
				<c:choose>
					<c:when test="${logId != null }">
						<a href="boardForm.do"><button class="btn btn-warning" type="submit">投稿</button></a>
					</c:when>
					<c:otherwise>
						<button class="btn btn-warning" type="button" disabled
							onclick="alert('ログイン後に利用可能な機能です。')">投稿</button>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${logId != null }">
						<button class="btn btn-warning btnMyBoard" type="button">自分の投稿</button>
					</c:when>
					<c:otherwise>
						<button class="btn btn-warning btnMyBoard" type="button" disabled
							onclick="alert('ログイン後に利用可能な機能です。')">自分の投稿</button>
					</c:otherwise>
				</c:choose>
			</div>
			<div class="boardList">
				<table class="table table-striped">
					<thead>
						<tr>
							<th class="col-sm-4" scope="col">タイトル</th>
							<th scope="col">投稿者</th>
							<th scope="col">閲覧数</th>
							<th scope="col">投稿日時</th>
							<c:choose>
								<c:when test="${logId != null}">
									<th scope="col">削除</th>
								</c:when>
								<c:otherwise>
									<th scope="col"></th>
								</c:otherwise>
							</c:choose>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="board" items="${boardList }" varStatus="stat">
							<tr class="board" data-board-no="${board.boardNo}">
								<td class="col-sm-6 title">${board.boardTitle }</td>
								<td>${board.memId }</td>
								<td>${board.boardView }</td>
								<td>${board.boardDate() }</td>
								<td><c:choose>
										<c:when test="${logId == board.memId }">
											<a href="removeBoard.do?boardNo=${board.boardNo }">
												<button type="button">削除する</button>
											</a>
										</c:when>
										<c:otherwise>-</c:otherwise>
									</c:choose></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<!-- 페이징 -->
			<nav aria-label="Page navigation example" class="page">
				<ul class="pagination justify-content-center">
					<!-- prev 페이지 -->
					<c:if test="${pageOut.preview }">
						<li class="page-item"><a class="page-link"
							href="boardList.do?pageNum=${pageOut.page - 1 }"
							aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
						</a></li>
					</c:if>
					<!-- 페이지 갯수만큼 링크생성 -->
					<c:forEach var="p" begin="${pageOut.startPage }"
						end="${pageOut.endPage }">
						<c:choose>
							<c:when test="${pageOut.page == p }">
								<li class="page-item active" aria-current="page"><span
									class="page-link">${p }</span></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link"
									href="boardList.do?pageNum=${p }">${p }</a></li>
								<!--paging.getPage속성 = p 같으면..  -->
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<!-- next 페이지 -->
					<c:if test="${pageOut.isNext()}">
						<li class="page-item"><a class="page-link"
							href="boardList.do?pageNum=${pageOut.page + 1 }"
							aria-label="Next"> <span aria-hidden="true">&raquo;</span>
						</a></li>
					</c:if>
				</ul>
			</nav>
			<!-- end pageNumbering -->
		</section>
	</div>
</body>

<script src="js/boadList.js"></script>