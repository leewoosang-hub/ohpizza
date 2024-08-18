<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<table class="table table-light table-striped table-hover">
  <thead>
    <tr>
	  <th scope="col">#</th>
	  <th scope="col">쿠폰이름</th>
	  <th scope="col">할인율(%)</th>
	  <th scope="col">쿠폰삭제</th>
	</tr>
  </thead>  
  <tbody>
	 <c:forEach var="coupon" items="${coupons }" varStatus="stat">
	   <tr>
	     <th scope="row">${stat.count }</th>
	     <td>${coupon.couponName }</td>
	     <td>${coupon.discount }</td>
	     <td><a href="deleteCoupon.do?name=${coupon.couponName }">삭제</a>
	   </tr>
	</c:forEach>
  </tbody>
</table>