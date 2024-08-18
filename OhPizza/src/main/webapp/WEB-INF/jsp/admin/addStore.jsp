<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="css/allMarginPadding.css" rel="stylesheet">
<body>
  <section class="box bg-white p-3 p-md-4 p-xl-5">
  <div class="container">
    <div class="row justify-content-center">
      <div class="col-12 col-md-10 col-lg-8 col-xl-7 col-xxl-6">
        <div class="card border-0 shadow-sm rounded-4">
          <div class="card-body p-3 p-md-4 p-xl-5">
			<form action="createStore.do" method="post">
			   <div class="row gy-3 overflow-hidden">
			     <div class="col-12">
			       <div class="form-floating mb-3">
			         <input type="text" class="form-control" name="name" id="name" placeholder="매장이름 입력" required>
			         <label for="매장이름" class="form-label">매장이름</label>
			       </div>
			     </div>
			     <div class="col-12">
			       <div class="form-floating mb-3">
			         <input type="text" class="form-control" name="phone" id="phone" placeholder="전화번호 입력"
			         oninput="oninputPhone(this)" maxlength="14" required>
			         <label for="전화번호" class="form-label">전화번호</label>
			       </div>
			     </div>
			     <div class="col-12">
			       <div class="form-floating mb-3">
			         <input type="text" class="form-control" name="address" id="address" placeholder="주소 입력" required>
			         <label for="주소" class="form-label">주소</label>
			       </div>
			     </div>
			     <div class="col-12">
			     	<div class="form-floating mb-3">
					  <input type="text" class="form-control" name="address_detail" id="address_detail"
					  placeholder="상세주소 입력">
					  <label for="상세 주소" class="form-label">상세 주소</label>
					</div>
				 </div>	
			     <div class="col-12">
			       <div class="form-floating mb-3">
			         <input type="text" class="form-control" name="lat" id="lat" placeholder="위도 입력" required>
			         <label for="위도" class="form-label">위도</label>
			       </div>
			     </div>
			     <div class="col-12">
			       <div class="form-floating mb-3">
			         <input type="text" class="form-control" name="long" id="long" placeholder="경도 입력" required>
			         <label for="경도" class="form-label">경도</label>
			       </div>
			     </div>
			     <div class="col-12">
			       <div class="form-floating mb-3">
			         <input type="text" class="form-control" name="locName" id="locName" placeholder="지점명 입력" required>
			         <label for="지점명" class="form-label">지점명</label>
			       </div>
			     </div>
			     <div class="row">
	  			   <div class="col text-center">
			         <button class="btn bsb-btn-2xl btn-primary" type="submit">매장등록</button>
			         <button class="btn bsb-btn-2xl btn-secondary" type="submit">등록취소</button>
			       </div>
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

<script	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="js/address.js"></script>
<script>
	function oninputPhone(target) {
		target.value = target.value.replace(/[^0-9]/g, '').replace(
			/(^02.{0}|^01.{1}|[0-9]{3,4})([0-9]{3,4})([0-9]{4})/g, "$1-$2-$3");
	}
</script>