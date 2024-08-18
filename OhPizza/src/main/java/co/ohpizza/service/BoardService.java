package co.ohpizza.service;

import java.util.List;

import co.ohpizza.vo.BoardVO;

public interface BoardService {
	//게시물 갯수를 5개 단위로 끊어 출력하는 기능
	List<BoardVO> boardList(String page);
	
	//총 게시물 갯수를 구하기 위한 기능
	int totalPage();
	
	//건의 사항용 총 게시물
	int inquirypage(String memId);
	
	//게시물 번호를 기준으로 게시물 상세 페이지로 이동하는 기능
	BoardVO boardDetail(int bno);
	
	//게시물 작성하는 기능
	boolean insertViewBoard(BoardVO boardInfo);

	//게시물 삭제하는 기능
	boolean removeBoard(int boardNo);
	
	//조회수를 증가시키는 기능
	boolean viewIncrease(int boardNo);
	
	//멤버 아이디를 기준으로 건의사항을 출력하기 위한 기능
	List<BoardVO> inquiryList(String page, String MemId);
	
	//멤버 아이디를 기준으로 건의사항 등록
	boolean addInquiry(BoardVO bvo);
	
	//관리자용 문의사항 답변 게시물 출력 기능
    List<BoardVO> adminAnswerList(String page);
    
    //C타입 게시물 총 건수
  	int totalCntTypeC();
  	  	
	//관리자용 답변 
	boolean adminAnswer(BoardVO boardvo);
	
	// 관리자용 질문에 대한 답변 화면용
	BoardVO getQuestion(int bno);
}

