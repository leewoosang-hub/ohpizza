<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<h1>�ֹ� Ȯ�� â</h1>

<form action="finalBuy.do">
	<input type="hidden" name=id value="${logId }">
	<input type="hidden" name=member value="${member }"> <input
		type="hidden" name=olList value="${olList }"> <input
		type="hidden" name=aPrice value="${lastPrice }">
	<p>ȸ�� �̸�: ${member.memName }</p>
	<p>�����: ${member.address }</p>
	<p>��ȭ��ȣ: ${member.phone }</p>

	�ֹ���ǰ <br>
	<c:forEach var="ol" items="${olList }">
		<input type="hidden" name=listNo value="${ol.listNo }">
	${ol.prodName } ${ol.count }��
	<br>
	</c:forEach>

	<p></p>
	<p>����� :</p>
	��� ������ ����:
	<p></p>
	���� ����: ${lastPrice } ��
	<p></p>
	<button type="button" onclick='buy()'>����</button>
</form>



<script src="js/pay.js"></script>

