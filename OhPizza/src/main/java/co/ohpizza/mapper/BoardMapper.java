package co.ohpizza.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import co.ohpizza.vo.BoardVO;

public interface BoardMapper {
	//게시판 리스트 출력
	List<BoardVO> boardList(String page);
	
	//페이지를 뽑기 위한 게시물 갯수 출력
	int totalPage();
	
	//건의 사항용 총 게시물
    int inquirypage(String memId);
	
	//게시물 상세화면 출력
	BoardVO boardDetail(int bno);
	
	//게시물 작성하는 기능
	int insertViewBoard(BoardVO boardInfo);
	//게시물 삭제하는 기능
	int removeBoard(int boardNo);
	
	//조회수를 증가시키는 기능
	int viewIncrease(int boardNo);
	
	//문의 사항 리스트 출력
	List<BoardVO> inquiryList(@Param("page") String page, @Param ("memId") String memId);
	
	//문의 사항 등록
	int insertInquiry(BoardVO bvo);
	
	//관리자용 문의사항 답변 게시물 리스트 출력 기능
	List<BoardVO> adminAnswerList(String page);
	
	//C타입 게시물 총 건수
	int totalCntTypeC();
	
	//관리자용 답변 
	int adminAnswer(BoardVO boardvo);
	
	// 관리자 답변 화면에 가져오기
	BoardVO selectQuestion(int bno);
	
}
