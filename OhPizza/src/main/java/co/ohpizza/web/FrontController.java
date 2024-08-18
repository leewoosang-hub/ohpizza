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
import co.ohpizza.control.MemberListControl;
import co.ohpizza.control.ProductControl;
import co.ohpizza.control.ProductListControl;
import co.ohpizza.control.ShowMemInfoControl;
import co.ohpizza.control.UpdateMemInfoControl;

import co.ohpizza.control.AddBoardControl;

import co.ohpizza.control.AddMemCouponControl;

import co.ohpizza.control.addCouponControl;
import co.ohpizza.control.createCouponControl;
import co.ohpizza.control.deleteMemberControl;

import co.ohpizza.control.AddMemberControl;
import co.ohpizza.control.AddOrderControl;
import co.ohpizza.control.BoardDetailControl;
import co.ohpizza.control.BoardFormControl;
import co.ohpizza.control.BoardListControl;
import co.ohpizza.control.CartControl;
import co.ohpizza.control.CartDeleteControl;
import co.ohpizza.control.CartNoControl;
import co.ohpizza.control.ClosedEventControl;

import co.ohpizza.control.CouponListControl;

import co.ohpizza.control.CreateMemberControl;
import co.ohpizza.control.DiscountCouponControl;
import co.ohpizza.control.EventControl;

import co.ohpizza.control.IdCheckControl;

import co.ohpizza.control.EventsProgress;

import co.ohpizza.control.FindPassControl;

import co.ohpizza.control.InquiryControl;

import co.ohpizza.control.MypageControl;
import co.ohpizza.control.NewmenuControl;

import co.ohpizza.control.OrderControl;

import co.ohpizza.control.OrderListControl;

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

		// 비밀번호 찾기 화면
		map.put("/findPass.do", new FindPassControl());
		
		// 회원가입 화면
		map.put("/addMember.do", new AddMemberControl());
		// 회원가입 (멤버 추가)
		map.put("/createMember.do", new CreateMemberControl());

		// 회원가입 (id중복체크)
		map.put("/idCheck.do", new IdCheckControl());

		// 이벤트
		map.put("/event.do", new EventControl());	
		// 이벤트 신메뉴
		map.put("/newmenu.do", new NewmenuControl());
		// 종료된 이벤트
		map.put("/closedEvent.do", new ClosedEventControl());	
		// 유저 쿠폰 발급
		map.put("/addMemCoupon.do", new AddMemCouponControl());
		
		// 진행중인 이벤트 (쿠폰 발행 이벤트)
		map.put("/eventsProgress.do", new EventsProgress());

		// 게시판 //
		// 게시판 리스트
		map.put("/boardList.do", new BoardListControl());
		//게시물 상세 페이지
		map.put("/boardDetail.do", new BoardDetailControl());
		//게시글 쓰기
		map.put("/addBoard.do", new AddBoardControl());
		//게시글 쓰는 폼
		map.put("/boardForm.do",new BoardFormControl());
		
		// 나의오피
		map.put("/myPage.do", new MypageControl());
		// 내주문내역
		map.put("/myOrder.do", new OrderListControl());
		// 쿠폰 리스트
		map.put("/myCoupon.do", new CouponListControl());

		// 정보수정 화면
		map.put("/showMemInfo.do", new ShowMemInfoControl());
		// 정보수정
		map.put("/updateMemInfo.do", new UpdateMemInfoControl());
		
		// Admin 기능들
		// 멤버 리스트
		map.put("/memberList.do", new MemberListControl());
		// 멤버 삭제
		map.put("/deleteMember.do", new deleteMemberControl());
		// 쿠폰 등록 화면
		map.put("/addCoupon.do", new addCouponControl());
		// 쿠폰 등록
		map.put("/createCoupon.do", new createCouponControl());

		// 장바구니 담기 누름.
		map.put("/addOrder.do", new AddOrderControl());

		// 내 문의 내역 확인하는 기능
		map.put("/inquiry.do", new InquiryControl());
		
		// 장바구니 숫자 추가
		map.put("/cartNo.do", new CartNoControl());
		
		// 장바구니 창
		map.put("/cart.do", new CartControl());
		
		// 장바구니 품목 삭제
		map.put("/cartDelete.do", new CartDeleteControl());

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
