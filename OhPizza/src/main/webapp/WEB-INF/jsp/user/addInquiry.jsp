<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="css/allMarginPadding.css" rel="stylesheet">
<body>
  <section class="box">
	<section class="bg-white p-3 p-md-4 p-xl-5">
	  <div class="container">
	    <div class="row justify-content-center">
	      <div class="col-12 col-md-10 col-lg-8 col-xl-7 col-xxl-6">
	        <div class="card border-0 shadow-sm rounded-4">
	          <div class="card-body p-3 p-md-4 p-xl-5">
				<form action="addInquiry.do" method="post">
				  <div class="row gy-3 overflow-hidden">
				    <div class="col-12">
				      <div class="form-floating mb-3">
				        <input type="text" class="form-control" name="title" id="title" required>
				        <label for="제목" class="form-label">제목</label>
				      </div>
				    </div>
				    <div class="col-12">
				      <div class="form-floating mb-3">
				        <textarea class="form-control" name="question" id="question"
				        cols="100" rows="5" placeholder="문의내용 입력" required>
				        </textarea>
				        <label for="문의내용" class="form-label">문의내용</label>
				      </div>
				    </div>
				    <div class="row">
	  				  <div class="col text-center">
				        <button class="btn btn-primary" type="submit">등록</button>
				        <button class="btn btn-secondary" type="reset">취소</button>
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
  </section>
</body>