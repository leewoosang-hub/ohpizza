const logId = document.getElementById("logId").value;
// tr이벤트 설정
const boardTr = document.querySelectorAll("tbody > tr"); // tr 지정
boardTr.forEach((tr) => {
	// tr을 반복문을 돌림 모든 요소에 이벤트 발생
	tr.addEventListener("click", function(event) {
		const thisBoardNo = this.getAttribute("data-board-no").trim();
		const thisMemId = this.children[1].innerHTML.trim();
		const url = "boardDetail.do?bno=" + thisBoardNo + "&id=" + thisMemId;
		location.href = url;
	});
});
// ajax로 테이블 정렬
const myBoardList = document.querySelectorAll(".btnMyBoard");
myBoardList.forEach((btn) => {
	btn.addEventListener("click", function(event) {
		$.ajax({
			url: "/OhPizza/myBoardList.do?id=" + logId,
			method: "GET",
			data: "json",
			success: function(response) {
				console.log(response)
				updateBoardList(response.myBoardList);
			},
			error: function(xhr, status, error) {
				alert("데이터를 가져오는 중 문제가 발생했습니다.");
			},
		});
	});
});
//table 변경
function updateBoardList(boardList) {
	const tbody = document.querySelector("tbody");
	tbody.innerHTML = "";

	const btnMyBoard = document.querySelector(".btnMyBoard");
	btnMyBoard.remove();

	const page = document.querySelector(".page");
	page.remove();

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
		const date = new Date(board.boardDate);
		const formattedDate =
			date.getFullYear() + "-" +
			String(date.getMonth() + 1).padStart(2, "0") + "-" +
			String(date.getDate()).padStart(2, "0");

		dateTd.textContent = formattedDate;

		tr.appendChild(dateTd);

		// 삭제 버튼 또는 "-" (td)
		const deleteTd = document.createElement("td");
		const deleteButton = document.createElement("button");
		deleteButton.type = "button";
		deleteButton.textContent = "削除する";
		deleteTd.appendChild(deleteButton);

		tr.appendChild(deleteTd);

		// 완성된 tr을 tbody에 추가
		tbody.appendChild(tr);

		deleteButton.addEventListener("click", function(event) {
			const thisBoardNo = tr.getAttribute("data-board-no");
			console.log(thisBoardNo);
			const url = "/OhPizza/removeBoard.do?boardNo=" + thisBoardNo;
			location.href = url;
		});

		const boardTr = document.querySelectorAll("tbody > tr"); // tr 지정
		boardTr.forEach((tr) => {
			// tr을 반복문을 돌림 모든 요소에 이벤트 발생
			tr.addEventListener("click", function(event) {
				const thisBoardNo = this.getAttribute("data-board-no");
				const thisMemId = this.children[1].innerHTML.trim();
				const url = "boardDetail.do?bno=" + thisBoardNo + "&id=" + thisMemId;
				location.href = url;
			});
		});
	});
}
