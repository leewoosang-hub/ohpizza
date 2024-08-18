package co.ohpizza.web;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.ohpizza.common.Control;
import co.ohpizza.control.LoginCheckControl;
import co.ohpizza.control.LoginControl;
import co.ohpizza.control.LogoutControl;
import co.ohpizza.control.MemberListControl;

import co.ohpizza.control.UpPcntControl;

import co.ohpizza.control.ProductControl;
import co.ohpizza.control.ProductListControl;
import co.ohpizza.control.RemoveBoardControl;
import co.ohpizza.control.ShowMemInfoControl;

import co.ohpizza.control.StoreListControl;

import co.ohpizza.control.UpdateMemInfoControl;

import co.ohpizza.control.AddBoardControl;

import co.ohpizza.control.AddMemCouponControl;

import co.ohpizza.control.AddCouponControl;
import co.ohpizza.control.AddInquiryControl;
import co.ohpizza.control.AddInquiryShowControl;
import co.ohpizza.control.CreateCouponControl;
import co.ohpizza.control.DeleteMemberControl;
import co.ohpizza.control.DeleteStoreControl;
import co.ohpizza.control.AddMemberControl;
import co.ohpizza.control.AddOrderControl;

import co.ohpizza.control.AdminAnswerListControl;

import co.ohpizza.control.AddStoreControl;
import co.ohpizza.control.AdminAnswerControl;
import co.ohpizza.control.AdminAnswerForm;
import co.ohpizza.control.BoardDetailControl;
import co.ohpizza.control.BoardFormControl;
import co.ohpizza.control.BoardListControl;
import co.ohpizza.control.CartControl;
import co.ohpizza.control.CartDeleteControl;
import co.ohpizza.control.CartNoControl;
import co.ohpizza.control.ClosedEventControl;
import co.ohpizza.control.CouponListControl;
import co.ohpizza.control.MyCouponControl;

import co.ohpizza.control.CreateMemberControl;

import co.ohpizza.control.CreateStoreControl;
import co.ohpizza.control.CurrentEventControl;
import co.ohpizza.control.ShowCurrEventControl;
import co.ohpizza.control.DeleteCouponControl;

import co.ohpizza.control.DownPcntControl;

import co.ohpizza.control.DeleteMeControl;

import co.ohpizza.control.EventControl;

import co.ohpizza.control.IdCheckControl;

import co.ohpizza.control.FinalBuyControl;
import co.ohpizza.control.FindPassControl;
import co.ohpizza.control.GetPassControl;
import co.ohpizza.control.InquiryListControl;

import co.ohpizza.control.MypageControl;


import co.ohpizza.control.OrderListControl;
import co.ohpizza.control.PayControl;

public class FrontController extends HttpServlet {
	Map<String, Control> map;

	public FrontController() {
		map = new HashMap<>();
	}

	@Override
	public void init(ServletConfig config) throws ServletException {
		// 상품목록
		map.put("/productList.do", new ProductListControl());
		// 상품상세
		map.put("/productInfo.do", new ProductControl());

		// 로그인 화면
		map.put("/login.do", new LoginControl());
		// 로그인 체크
		map.put("/loginCheck.do", new LoginCheckControl());
		// 로그아웃
		map.put("/logout.do", new LogoutControl());

		// 비밀번호 찾기 화면
		map.put("/findPass.do", new FindPassControl());
		// 비밀번호 재발급(입력) 구현
		map.put("/getPass.do", new GetPassControl());
		
		
		// 회원가입 화면
		map.put("/addMember.do", new AddMemberControl());
		// 회원가입 (멤버 추가)
		map.put("/createMember.do", new CreateMemberControl());
		// 회원가입 (id중복체크)
		map.put("/idCheck.do", new IdCheckControl());

		// 이벤트 (신메뉴 페이지)
		map.put("/event.do", new EventControl());
		// 진행중인 이벤트 화면
		map.put("/showCurrEvent.do", new ShowCurrEventControl());
		// 진행중인 이벤트
		map.put("/currentEvent.do", new CurrentEventControl());
		// 유저 쿠폰 발급
		map.put("/addMemCoupon.do", new AddMemCouponControl());
		// 종료된 이벤트
		map.put("/closedEvent.do", new ClosedEventControl());
		
<<<<<<< HEAD
		// 진행중인 이벤트 (쿠폰 발행 이벤트)
		map.put("/eventsProgress.do", new EventsProgress());

		// 게시판 //
=======
		//게시판 기능
>>>>>>> branch 'main' of https://github.com/tisgold/ohpizza.git
		// 게시판 리스트
		map.put("/boardList.do", new BoardListControl());
		//게시물 상세 페이지
		map.put("/boardDetail.do", new BoardDetailControl());
		//게시글 쓰기
		map.put("/addBoard.do", new AddBoardControl());
<<<<<<< HEAD
		//게시글 쓰는 폼
		map.put("/boardForm.do",new BoardFormControl());
=======
		//게시글 삭제
		map.put("/removeBoard.do", new RemoveBoardControl());

>>>>>>> branch 'main' of https://github.com/tisgold/ohpizza.git
		
		// 나의오피
		map.put("/myPage.do", new MypageControl());
		// 내주문내역
		map.put("/myOrder.do", new OrderListControl());
		// 쿠폰 리스트
		map.put("/myCoupon.do", new MyCouponControl());
		// 내 문의 내역 확인하는 기능
		map.put("/inquiryList.do", new InquiryListControl());
		// 내 문의 등록 화면
		map.put("/addInquiryShow.do", new AddInquiryShowControl());
		// 내 문의 등록
		map.put("/addInquiry.do", new AddInquiryControl());
		// 정보수정 화면
		map.put("/showMemInfo.do", new ShowMemInfoControl());
		// 정보수정
		map.put("/updateMemInfo.do", new UpdateMemInfoControl());
		// 회원탈퇴
		map.put("/deleteMe.do", new DeleteMeControl());
		
		// Admin 기능들
		// 멤버 리스트
		map.put("/memberList.do", new MemberListControl());
		// 멤버 삭제
		map.put("/deleteMember.do", new DeleteMemberControl());
		// 쿠폰 리스트
		map.put("/couponList.do", new CouponListControl());
		// 쿠폰 삭제
		map.put("/deleteCoupon.do", new DeleteCouponControl());
		// 쿠폰 등록 화면
		map.put("/addCoupon.do", new AddCouponControl());
		// 쿠폰 등록
		map.put("/createCoupon.do", new CreateCouponControl());
		//관리자용 문의 게시판 출력 기능
		map.put("/adminAnswerList.do", new AdminAnswerListControl());
		//관리자용 답변 추가 기능
		map.put("/adminAnswer.do", new AdminAnswerControl());
		//관리자용 답변 추가 폼
		map.put("/adminAnswerForm.do", new AdminAnswerForm());
		
		// 매장 정보 확인
		map.put("/storeList.do", new StoreListControl());
		// 매장 삭제
		map.put("/deleteStore.do", new DeleteStoreControl());
		// 매장 등록 화면
		map.put("/addStore.do", new AddStoreControl());
		// 매장 등록
		map.put("/createStore.do", new CreateStoreControl());


		// 장바구니 담기 누름.
		map.put("/addOrder.do", new AddOrderControl());
		
		// 장바구니 숫자 추가
		map.put("/cartNo.do", new CartNoControl());
		
		// 장바구니 창
		map.put("/cart.do", new CartControl());
		
		// 장바구니 품목 삭제
		map.put("/cartDelete.do", new CartDeleteControl());
		
		// 결제창 이동
		map.put("/pay.do", new PayControl());
		
		// 장바구니 수량 변경
		map.put("/UpPcnt.do", new UpPcntControl());
		
		map.put("/downPcnt.do", new DownPcntControl());
		
		// 최종 결제 버튼 눌렀을 때
		map.put("/finalBuy.do", new FinalBuyControl());
		
  }

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uri = req.getRequestURI();
		String context = req.getContextPath();
		String path = uri.substring(context.length());

		System.out.println(path);

		Control sub = map.get(path);
		sub.exec(req, resp);
	}
}
