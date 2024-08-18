<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<table class="table table-light table-striped table-hover">
<thead>
    <tr>
	  <th scope="col">#</th>
	  <th scope="col">매장이름</th>
	  <th scope="col">전화번호</th>
	  <th scope="col">주소</th>
	  <th scope="col">지점명</th>
	  <c:if test="${logId eq 'admin'}">
	  	<th scope="col">지점삭제</th>
	  </c:if>
	</tr>
  </thead>  
  <tbody>
	 <c:forEach var="store" items="${stores }" varStatus="stat">
	   <tr>
	     <th scope="row">${stat.count }</th>
	     <td>${store.storeName }</td>
	     <td>${store.phone }</td>
	     <td>${store.address }</td>
	     <td>${store.locName }</td>
	     <c:if test="${logId eq 'admin'}">
	       <td><a href="deleteStore.do?name=${store.storeName }">삭제</a></td>
	     </c:if>
	   </tr>
	</c:forEach>
  </tbody>
</table>