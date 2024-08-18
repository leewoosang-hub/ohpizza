<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
    <div class="sb-sidenav-menu">
        <div class="nav">
            <nav class="sb-sidenav-menu-nested nav">
                <a class="nav-link" href="memberList.do">회원목록</a>
                <a class="nav-link" href="couponList.do">쿠폰목록</a>
                <a class="nav-link" href="addCoupon.do">쿠폰등록</a>
                <a class="nav-link" href="storeList.do">매장목록</a>
                <a class="nav-link" href="addStore.do">매장등록</a>
                <a class="nav-link" href="adminAnswerList.do">고객 문의목록</a>
            </nav>
        </div>
    </div>
    <div class="sb-sidenav-footer">
        <div class="small">Logged in as: ${logId }</div>
    </div>
</nav>