<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<form action="adminAnswer.do?bno=${board.boardNo }" method="post">
<input type="hidden" name="bno" value="${board.boardNo }">
<table class="table">
	<tr>
		<th>제목</th>
		<td><input class="form-control" type="text" readonly value="${board.boardTitle }"></td>
	</tr>
	<tr>
		<th>문의 내용</th>
		<td><input class="form-control" type="text" readonly value="${board.question }"></td>
	</tr>
	<tr>
		<th>답변</th>
		<td><textarea class="form-control" name="answer"></textarea></td>
	</tr>
	<tr>
		<th>작성자</th>
		<td><input class="form-control" readonly type="text" name="memID" value="${logId }"></td>
	</tr>
	<tr>
		<td colspan="2" align="center">
		<input class="btn btn-primary" type="submit">
		<input class="btn btn-secondary" type="reset">
		</td>
	</tr>
</table>
</form>