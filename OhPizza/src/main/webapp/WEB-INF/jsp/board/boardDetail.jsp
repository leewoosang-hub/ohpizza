<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
/* 카드 스타일 */


html, body {
  height: 100%; /* 전체 화면 높이 */
  margin: 0;
}

#wrapper{
  height : auto;
  min-height: 100%;
}

.card {
	max-width: 800px; /* 카드 너비 */
	margin: 30px auto; /* 화면 중앙 정렬 */
	padding: 20px; /* 내부 여백 */
	background-color: #ffffff; /* 카드 배경색 */
	border-radius: 10px; /* 모서리 둥글게 처리 */
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); /* 그림자 */
	border: 1px solid #ddd; /* 카드 테두리 */
	box-sizing: border-box; /* 박스 크기 조정 */
}

/* 테이블 스타일 */
.table {
	width: 100%; /* 테이블 너비 */
	border-collapse: collapse; /* 테이블 경계선 접기 */
	margin-bottom: 20px; /* 하단 여백 */
	border: 1px solid gray;
}

.table th, .table td {
	padding: 10px; /* 셀 내부 여백 */
	text-align: left; /* 텍스트 정렬 */
	vertical-align: middle; /* 세로 정렬 */
	border-bottom: 1px solid gray; /* 셀 아래쪽 테두리 */
	border: 1px solid gray;
}

.table th {
	background-color: #f8f9fa; /* 헤더 배경색 */
	font-weight: bold; /* 글씨 굵게 */
	text-align: center; /* 헤더 왼쪽 정렬 */
	border: 1px solid gray;
}

.table td {
	background-color: #ffffff; /* 데이터 셀 배경색 */
	border: 1px solid gray;
}

/* 버튼 스타일 */
.btn {
	padding: 10px 20px; /* 버튼 여백 */
	border: none; /* 테두리 제거 */
	border-radius: 5px; /* 모서리 둥글게 */
	cursor: pointer; /* 포인터 변경 */
	font-size: 14px; /* 폰트 크기 */
	justify-content: center;
}

.btn-warning {
	background-color: #ffc107; /* 경고 버튼 배경색 */
	color: #ffffff; /* 버튼 글자색 */
	justify-content: center;
}

.btn-warning:hover {
	background-color: #e0a800; /* 호버 배경색 */
	justify-content: center;
}

.btn-warning:disabled {
	background-color: #f0f0f0; /* 비활성화 상태 배경색 */
	color: #a0a0a0; /* 비활성화 상태 글자색 */
	cursor: not-allowed; /* 비활성화 상태 커서 */
	justify-content: center;
}

.content {
	height: 500px;
}

body {
	display: flex;
	flex-direction: column;
	min-height: 100vh; /* 전체 화면 높이 */
	margin: 0; /* 기본 margin 제거 */
}

main {
	flex: 1; /* 메인 콘텐츠가 화면의 나머지 공간을 차지 */
	overflow-y: auto; /* 스크롤 활성화 */
	padding: 20px; /* 내부 여백 */
}

footer {
 	position : relative;
 }

.title>td {
	font-size: 2 rem;
	font-weight: bold;
}
</style>
<body>
	<div id="wrapper">
		<section class="card">
			<a href="boardList.do">
				<p style="text-align: left;">이전 화면으로 돌아가기</p>
			</a>
			<form action="">
				<input type="hidden" name="bno" value="${boardDetail.boardNo }">
				<div class="scroll">
					<table class="table">
						<thead>
							<tr class="title">
								<th>제목</th>
								<td colspan="5">${boardDetail.boardTitle }</td>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th class="col-sm-2 writer">작성자</th>
								<td>${boardDetail.memId }</td>
								<th class="col-sm-2 view">조회수</th>
								<td>${boardDetail.boardView }</td>
							</tr>
							<tr>
								<th class="content">내용</th>
								<td colspan="5">${boardDetail.review }</td>
							</tr>
						</tbody>
						<tfoot>
							<tr>
								<td colspan="6" align="center"><c:choose>
										<c:when test="${logId == boardDetail.memId }">
											<button class="btn btn-warning" type="button">수정하기</button>
										</c:when>
										<c:otherwise>
											<button class="btn btn-warning" disabled type="button">수정하기</button>
										</c:otherwise>
									</c:choose></td>
							</tr>
						</tfoot>
					</table>
				</div>
			</form>
		</section>
	</div>
</body>
