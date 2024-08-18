<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link href="css/allMarginPadding.css" rel="stylesheet">
<body>
  <section class="box bg-white p-3 p-md-4 p-xl-5">
  <div class="container">
    <div class="row justify-content-center">
      <div class="col-12 col-md-10 col-lg-8 col-xl-7 col-xxl-6">
        <div class="card border-0 shadow-sm rounded-4">
          <div class="card-body p-3 p-md-4 p-xl-5">
          
	        <form action="updateMemInfo.do" method="POST">
	          <div class="row g-3">
	            <div class="col-12">
	              <label for="name" class="form-label">이름</label>
	              <input type="text" class="form-control" id="name" name="name"
	              value=${member.memName } readonly>
	            </div>
	
	            <div class="col-12">
	              <label for="password" class="form-label">비밀번호</label>
	              <input type="password" class="form-control" id="password" name="password"
	              placeholder="변경할 비밀번호 입력" maxlength="10" required>
	            </div>
	            <div class="col-12">
	              <label for="pwConfirm" class="form-label">비밀번호 확인</label>
	              <input type="password" class="form-control" id="pwConfirm" name="pwConfirm"
	              placeholder="비밀번호 확인" maxlength="10" required>
	            </div>
	            
	            <div class="col-12">
	              <label for="phone" class="form-label">전화번호</label>
	              <input type="text" class="form-control" id="phone" name="phone" 
	              value=${member.phone } oninput="oninputPhone(this)" maxlength="14">
	            </div>
	
	            <div class="col-12">
	              <label for="email" class="form-label">Email</label>
	              <input type="email" class="form-control" id="email" name="email"
	              value=${member.email }>
	            </div>
	
	            <div class="col-12">
	              <label for="address" class="form-label">주소</label>
	              <input type="text" class="form-control" id="address" name="address"
	              value=${member.address }>
	            </div>
	            <div class="col-12">
	              <label for="address_detail" class="form-label">상세 주소</label>
	              <input type="text" class="form-control" id="address_detail"
	              name="address_detail" placeholder="">
	            </div>
	          </div><br>
	          <div class="row">
	  			<div class="col text-center">
	          	  <button class="btn btn-primary" type="submit">정보수정</button>
	          	  <button class="btn btn-secondary" type="reset">취소</button><br><br>
	          	</div>
	          </div>
	        </form>
          </div>
        </div>
      </div>
    </div>
  </div>
  </section>
</body>
<script src="js/passCheck.js"></script>
<script	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="js/address.js"></script>
<script>
	function oninputPhone(target) {
		target.value = target.value.replace(/[^0-9]/g, '').replace(
			/(^02.{0}|^01.{1}|[0-9]{3,4})([0-9]{3,4})([0-9]{4})/g, "$1-$2-$3");
	}
</script>
