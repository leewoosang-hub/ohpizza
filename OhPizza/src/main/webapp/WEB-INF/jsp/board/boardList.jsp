<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link href="css/allMarginPadding.css" rel="stylesheet" />

<script src="https://code.jquery.com/jquery-3.7.1.js"
	integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
	crossorigin="anonymous"></script>

<style>
.board:hover {
	background: silver;
	cursor: pointer;
}

.title {
	text-align: center;
}

.btnMyBoard {
	position: relative;
	left: 6 rem;
	top: 0px;
}
</style>

<body>
	<section class="box">
		<!-- Sidebar -->
		<!-- <input type="hidden" id="logId" value="${logId }"> 중복 송신 -->
		<c:choose>
			<c:when test="${logId != null }">
				<a href="boardForm.do"><button class="btn btn-warning"
						type="submit">글쓰기</button></a>
			</c:when>
			<c:otherwise>
				<button class="btn btn-warning" type="button" disabled
					onclick="alert('로그인 후 이용 가능한 기능입니다.')">글쓰기</button>
			</c:otherwise>
		</c:choose>
		<c:choose>
			<c:when test="${logId != null }">
				<button class="btn btn-warning btnMyBoard" type="button">내가
					쓴 글</button>
			</c:when>
			<c:otherwise>
				<button class="btn btn-warning btnMyBoard" type="button" disabled
					onclick="alert('로그인 후 이용 가능한 기능입니다.')">내가 쓴 글</button>
			</c:otherwise>
		</c:choose>
		<div class="boardList">
			<table class="table table-striped">
				<thead>
					<tr>
						<th class="col-sm-4" scope="col">제목</th>
						<th scope="col">작성자</th>
						<th scope="col">조회수</th>
						<th scope="col">작성일</th>
						<c:choose>
							<c:when test="${logId != null}">
								<th scope="col">삭제</th>
							</c:when>
							<c:otherwise>
								<th scope="col">-</th>
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
										<a href="removeBoard.do?boardNo=${board.boardNo }"><button
												type="button">삭제</button></a>
									</c:when>
									<c:otherwise> - </c:otherwise>
								</c:choose></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<!-- 페이징 -->
		<nav aria-label="Page navigation example">
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
						href="boardList.do?pageNum=${pageOut.page + 1 }" aria-label="Next">
							<span aria-hidden="true">&raquo;</span>
					</a></li>
				</c:if>
			</ul>
		</nav>
		<!-- 페이지부분 -->
		<!-- end pageNumbering -->
	</section>
</body>
<script>
  // tr이벤트 설정
  const boardTr = document.querySelectorAll("tbody > tr"); // tr 지정
  boardTr.forEach((tr) => {
    // tr을 반복문을 돌림 모든 요소에 이벤트 발생
    tr.addEventListener("click", function (event) {
      const thisBoardNo = this.getAttribute("data-board-no").trim();
      const thisMemId = this.children[1].innerHTML.trim();
      const url = "boardDetail.do?bno=" + thisBoardNo + "&id=" + thisMemId;
      location.href = url;
    });
  });
  const myBoardList = document.querySelectorAll(".btnMyBoard");
  myBoardList.forEach((btn) => {
	    btn.addEventListener("click", function (event) {
	      $.ajax({
	        url: "/OhPizza/myBoardList.do",
	        method: "GET",
	        data: "json",
	        success: function (response) {
	          updateBoardList(response.myBoardList);
	        },
	        error: function (xhr, status, error) {
	          alert("데이터를 가져오는 중 문제가 발생했습니다.");
	        }
	      })
	    });
	  });
  function updateBoardList(boardList) {
	    const tbody = document.querySelector("tbody"); // tbody 선택
	    tbody.innerHTML = ""; // 기존 내용을 모두 비움
	    	
	    // boardList 데이터를 반복 처리
	    boardList.forEach((board) => {
	      // tr 요소 생성
	      const tr = document.createElement("tr");
	      tr.classList.add("board"); // 클래스 추가
	      tr.setAttribute("data-board-no", board.boardNo); // data-board-no 속성 추가

	      // 제목 (td)
	      const titleTd = document.createElement("td");
	      titleTd.classList.add("col-sm-6", "title");
	      titleTd.textContent = board.boardTitle;
	      tr.appendChild(titleTd);

	      // 작성자 (td)
	      const memIdTd = document.createElement("td");
	      memIdTd.textContent = board.memId;
	      tr.appendChild(memIdTd);

	      // 조회수 (td)
	      const viewTd = document.createElement("td");
	      viewTd.textContent = board.boardView;
	      tr.appendChild(viewTd);

	      // 작성일 (td)
	      const dateTd = document.createElement("td");
	      dateTd.textContent = board.boardDate;
	      tr.appendChild(dateTd);

	      // 삭제 버튼 또는 "-" (td)
	      const deleteTd = document.createElement("td");
	      const deleteButton = document.createElement("button");
	      deleteButton.type = "button";
	      deleteButton.textContent = "삭제";
	      deleteTd.appendChild(deleteButton);

	      tr.appendChild(deleteTd);

	      // 완성된 tr을 tbody에 추가
	      tbody.appendChild(tr);

	      deleteButton.addEventListener("click", function (event) {
	        const thisBoardNo = tr.getAttribute("data-board-no");
	        console.log(thisBoardNo);
	        const url = "/OhPizza/removeBoard.do?boardNo=" + thisBoardNo;
	        location.href = url;
	      });
	    });
	  }
</script>
