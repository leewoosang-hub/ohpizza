<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="css/allMarginPadding.css" rel="stylesheet">
    
<head>
<style type="text/css">
/* 카드 스타일 */
.card {
    max-width: 800px; /* 카드 너비 */
    margin: 30px auto; /* 화면 중앙 정렬 */
    padding: 20px; /* 내부 여백 */
    background-color: #ffffff; /* 카드 배경색 */
    border-radius: 10px; /* 모서리 둥글게 */
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); /* 그림자 */
    border: 1px solid #ddd; /* 카드 테두리 */
    box-sizing: border-box; /* 박스 크기 조정 */
}

/* 테이블 스타일 */
.table {
    width: 100%; /* 테이블 너비 */
    border-collapse: collapse; /* 테이블 경계선 접기 */
    margin-bottom: 20px; /* 하단 여백 */
    border : 1px solid gray;
}

.table th, .table td {
    padding: 10px; /* 셀 내부 여백 */
    text-align: left; /* 텍스트 정렬 */
    vertical-align: middle; /* 세로 정렬 */
    border-bottom: 1px solid #ddd; /* 셀 아래쪽 테두리 */
    border : 1px solid gray; 
}

.table th {
    background-color: #f8f9fa; /* 헤더 배경색 */
    font-weight: bold; /* 글씨 굵게 */
}

.table td {
    background-color: #ffffff; /* 데이터 셀 배경색 */
}

/* 버튼 스타일 */
.btn {
    padding: 10px 20px; /* 버튼 여백 */
    border: none; /* 테두리 제거 */
    border-radius: 5px; /* 모서리 둥글게 */
    cursor: pointer; /* 포인터 변경 */
    font-size: 14px; /* 폰트 크기 */
}

.btn-primary {
    background-color: #007bff; /* 기본 버튼 배경색 */
    color: #ffffff; /* 기본 버튼 글자색 */
}

.btn-primary:hover {
    background-color: #0056b3; /* 호버 배경색 */
}

.btn-secondary {
    background-color: #6c757d; /* 리셋 버튼 배경색 */
    color: #ffffff; /* 리셋 버튼 글자색 */
}

.btn-secondary:hover {
    background-color: #5a6268; /* 호버 배경색 */
}
.content {
	width : 100%;
	height: 500px;
	border: none;
	resize: none;
}
.title{
	width : 100%;
	height: 10 em;
	border: none;
	resize: none;
}
.wirter{
	width : 100%;
	height: 10 em;
	border: none;
	resize: none;
}	
footer {
    position: fixed; /* footer를 화면 아래에 고정 */
    bottom: 0;
    left: 0;
    width: 100%; /* 화면 전체 너비 */
    background-color: #17a2b8; /* 기존 footer 색상 */
    color: #fff; /* 텍스트 색상 */
    text-align: center; /* 텍스트 가운데 정렬 */
    padding: 10px;
    z-index: 1000; /* 다른 요소 위에 표시 */
}

</style>
</head>    
<body>
  <!-- 카드 스타일 적용 -->
  <section class="card">
    <h2 style="text-align: center; margin-bottom: 20px;">게시글 작성</h2>
    <form action="addBoard.do" method="post">
      <table class="table">
        <tr>
          <th>제목</th>
          <td><input class="form-control title" type="text" name="title" placeholder="제목을 입력하세요"></td>
        </tr>
        <tr>
          <th>내용</th>
          <td><textarea class="form-control content" name="review" placeholder="내용을 입력하세요"></textarea></td>
        </tr>
        <tr>
          <th>작성자</th>
          <td><input class="form-control wirter" readonly type="text" name="memID" value="${logId }"></td>
        </tr>
        <tr>
          <td colspan="2" align="center">
            <input class="btn btn-primary" type="submit" value="등록">
            <input class="btn btn-secondary" type="reset" value="리셋">
          </td>
        </tr>
      </table>
    </form>
  </section>
</body>
