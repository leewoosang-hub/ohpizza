<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<h1>�ֹ� Ȯ�� â</h1>

<p>ȸ�� �̸�: ${member.memName }</p>
<p>�ּ�: ${member.address }</p>
<p>��ȭ��ȣ: ${member.phone }</p>

�ֹ���ǰ
<br>
<c:forEach var="cart" items="${cartList }">
	${cart.prodName } ${cart.count }��
	<br>
</c:forEach>
<p>
</p>
���� ����: ${aPrice } �� ����â ${a}

<script>
	let a = 1;
</script>

