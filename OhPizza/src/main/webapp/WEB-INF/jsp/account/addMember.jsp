<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>addMember.jsp</title>
<link href="css/addMember.css" rel="stylesheet">
</head>
<body>
<section class="bg-white p-3 p-md-4 p-xl-5">
  <div class="container">
    <div class="row justify-content-center">
      <div class="col-12 col-md-9 col-lg-7 col-xl-6 col-xxl-5">
        <div class="card border-0 shadow-sm rounded-4">
          <div class="card-body p-3 p-md-4 p-xl-5">

	<form action="createMember.do" method="POST" class="joinForm"
		onsubmit="DoJoinForm__submit(this); return false;">

		<!-- 1. 로고 -->
		<a href="http://localhost/OhPizza/index.html"><img class="logo"
			src="./images/ohPizzaLoge.jpg"></a>

		<!--  필드 -->
		<div class="field">
			<b>아이디</b> <span class="placehold-text"><input type="text"
				id ="loginId" name="loginId" class="id" placeholder="10자리 이내로 아이디 입력"
				maxlength="10" required></span>
		</div>
		<div id="checkIdMsg"></div>
		<div class="field">
			<b>비밀번호</b> <input class="pw" type="password" name="loginPw"
				placeholder="10자리 이내로 비밀번호 입력" maxlength="10" required>
		<!-- </div> -->
		<!-- <div id="checkPwdMsg1"></div> -->
		<!-- <div class="strongPassword-message hide">8글자 이상, 영문, 숫자,
			특수문자(@$!%*#?&)를 사용하세요</div> -->

		<div class="field">
			<b>비밀번호 재확인</b> <input class="pw-confirm" type="password"
				name="pwConfirm" placeholder="비밀번호 확인" maxlength="10" required>
		</div>
		
		<div id="checkPwdMsg2"></div>
		<div class="mismatch-message hide">비밀번호가 일치하지 않습니다</div>

		<div class="textForm">
			<b>이름</b> <input type="text" name="name" class="name"
				placeholder="이름" required>
		</div>

		<!-- 이메일_전화번호 -->
		<div class="textForm">
			<b>본인 확인 이메일</b> <input type="text" name="email" class="email"
				placeholder="you@example.com" required>
		</div>

		<div class="textForm">
			<b>전화번호</b> <input name="cellphoneNo" type="text" class="cellphoneNo"
				oninput="oninputPhone(this)" maxlength="14" placeholder="전화번호" required>
		</div>
		<div class="textForm">
			<b>주소</b> <input name="address" type="text" id="address"
				placeholder="주소입력" readonly>

		</div>
		<div class="textForm">
			<b>상세주소</b> <input name="address_detail" type="text" id="address"
				placeholder="상세주소 입력">

		</div>
		<!-- 6. 가입하기 버튼 -->
		<input type="submit" value="가입하기" class="btn">

	</form>
	</div>
	</div>
	</div>
	</div>
	</div>
	</section>
</body>
<!-- <link href="WEB-INF/layout/footer.jsp"  rel="stylesheet"> 
<tiles:insertAttribute name="footer" /> -->

<script src="js/addMemberTest.js"></script>
<script src="js/passCheck.js"></script>
<script	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="js/address.js"></script>
<script>
	function oninputPhone(target) {
		target.value = target.value.replace(/[^0-9]/g, '').replace(
			/(^02.{0}|^01.{1}|[0-9]{3,4})([0-9]{3,4})([0-9]{4})/g, "$1-$2-$3");
	}
</script>
</html>