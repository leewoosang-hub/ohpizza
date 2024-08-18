<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
<link href="css/styles.css" rel="stylesheet" />
<link href="css/indexSidebar.css" rel="stylesheet" />
</head>
<!-- quickMenu -->
<nav>
	<ul id="quickmenu">
		<c:choose>
        	<c:when test="${empty logId }">
            	<li><a href="login.do">로그인</a></li>
            </c:when>
            <c:otherwise>
                <li><a href="logout.do">로그아웃</a></li>
            </c:otherwise>
        </c:choose>
	<li><a href="addMember.do">회원가입</a></li>
		<c:choose>
        	<c:when test="${empty logId }">
            	<li><a href="#"><span onclick="alert('로그인이 필요합니다.');">장바구니</span></a></li>
            </c:when>
            <c:otherwise>
                 <li><a href="cart.do?id=${logId }">장바구니</a></li>
            </c:otherwise>
        </c:choose>
	</ul>
</nav>