<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link href="css/allMarginPadding.css" rel="stylesheet">
<body>
  <section class="box">
	<form action="addBoard.do" method="post">
	<table class="table">
		<tr>
			<th>제목</th>
			<td><input class="form-control" type="text" name="title"></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea class="form-control" name="review"></textarea></td>
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
  </section>
</body>
