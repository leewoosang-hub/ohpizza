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
		 	<form action="createCoupon.do" method="post">
			  <div class="row gy-3 overflow-hidden">
			     <div class="col-12">
			       <div class="form-floating mb-3">
			         <input type="text" class="form-control" name="name" id="name" placeholder="쿠폰이름 입력" required>
			         <label for="쿠폰이름" class="form-label">쿠폰이름</label>
			       </div>
			     </div>
			     <div class="col-12">
			       <div class="form-floating mb-3">
			         <input type="text" class="form-control" name="discount" id="discount" value="" placeholder="할인율 입력" required>
			         <label for="할인율" class="form-label">할인율</label>
			       </div>
			     </div>
			     <div class="row">
	  			   <div class="col text-center">
			         <button class="btn bsb-btn-2xl btn-primary" type="submit">쿠폰등록</button>
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