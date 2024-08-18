<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<table class="table table-light table-striped table-hover">
  <ul class="nav nav-pills">
    <c:choose>
      <c:when test="${auth eq 'User' }">
      <li class="nav-item">
        <a class="nav-link active" aria-current="page" href="memberList.do?auth=User">사용자</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" aria-disabled="true" href="memberList.do?auth=Admin">관리자</a>
      </li>
      </c:when>
      <c:otherwise>
      <li class="nav-item">
        <a class="nav-link" aria-disabled="true" href="memberList.do?auth=User">사용자</a>
      </li>
      <li class="nav-item">
        <a class="nav-link active" aria-current="page" href="memberList.do?auth=Admin">관리자</a>
      </li>
      </c:otherwise>
    </c:choose>
  </ul>
  <thead>
    <tr>
	  <th scope="col">#</th>
	  <th scope="col"><a href="memberList.do?auth=${auth }&order=mem_id">아이디</a></th>
	  <th scope="col">비밀번호</th>
	  <th scope="col"><a href="memberList.do?auth=${auth }&order=mem_name">이름</a></th>
	  <th scope="col">권한</th>
	  <th scope="col">계정삭제</th>
	</tr>
  </thead>  
  <tbody>
	 <c:forEach var="member" items="${members }" varStatus="stat">
	   <tr>
	     <th scope="row">${stat.count }</th>
	     <td>${member.memId }</td>
	     <td>${member.memPw }</td>
	     <td>${member.memName }</td>
	     <td>${member.authority }</td>
	     <td><a href="deleteMember.do?id=${member.memId }">삭제</a>
	   </tr>
	</c:forEach>
  </tbody>
</table>
