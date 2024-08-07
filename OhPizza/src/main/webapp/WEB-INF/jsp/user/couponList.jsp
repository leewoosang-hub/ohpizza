<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<h3>회원 주문 리스트</h3>
<table class="table table-light table-striped table-hover">
  <thead>
    <tr>
      <th scope="col">#</th>
	  <th scope="col">쿠폰이름</th>
	  <th scope="col">할인율</th>
	</tr>
  </thead>  
  <tbody>
	 <c:forEach var="coupon" items="${coupons }" varStatus="stat">
	   <tr>
	     <th scope="row">${stat.count }</th>
	     <td>${coupon.key }</td>
	     <td>${coupon.value }</td>
	   </tr>
	</c:forEach>
  </tbody>
</table>