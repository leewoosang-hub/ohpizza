<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link href="css/allMarginPadding.css" rel="stylesheet">
<body>
  <section class="box">
	<table class="table table-light table-striped table-hover">
	  <thead>
	    <tr>
	      <th scope="col">#</th>
	   <th scope="col">주문일자</th>
	   <th scope="col">주문번호</th>
	   <th scope="col">결제금액</th>
	   <th scope="col">할인금액</th>
	   <th scope="col">최종결제금액</th>
	   <th scope="col">주문매장</th>
	 </tr>
	  </thead>  
	  <tbody>
	  <c:forEach var="order" items="${orders }" varStatus="stat">
	    <tr>
	      <th scope="row">${stat.count }</th>
	      <td>${order.orderDate() }</td>
	      <td>${order.ordNo }</td>
	      <td>${order.price } 원</td>
	      <td>0 원</td>
	      <td>${order.price } 원</td>
	      <td>${order.locName }</td>
	    </tr>
	 </c:forEach>
	  </tbody>
	</table>
  </section>
</body>
