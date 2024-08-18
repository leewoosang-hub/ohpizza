package co.ohpizza.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.ohpizza.common.DataSource;
import co.ohpizza.mapper.BoardMapper;
import co.ohpizza.vo.BoardVO;

public class BoardServiceImpl implements BoardService {
	SqlSession sqlSession = DataSource.getInstance().openSession(true);
	BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);

	@Override
	public List<BoardVO> boardList(String page) {
		return mapper.boardList(page);
	}

	@Override
	public int totalPage() {
		return mapper.totalPage();
	}
	@Override
	public int inquirypage(String memId) {
		return mapper.inquirypage(memId);
	}

	@Override
	public BoardVO boardDetail(int bno) {
		return mapper.boardDetail(bno);
	}

	@Override
	public boolean insertViewBoard(BoardVO boardInfo) {
		return mapper.insertViewBoard(boardInfo) == 1;
	}

	@Override
	public boolean removeBoard(int boardNo) {
		return mapper.removeBoard(boardNo) == 1;
	}
  
	@Override
	public boolean viewIncrease(int boardNo) {
		return mapper.viewIncrease(boardNo)==1;
	}

	@Override
	public List<BoardVO> inquiryList(String page, String MemId) {
		return mapper.inquiryList(page, MemId);
	}
	
	@Override
	public boolean addInquiry(BoardVO bvo) {
		return mapper.insertInquiry(bvo) == 1;
	}
	@Override
	public List<BoardVO> adminAnswerList(String page) {
		return mapper.adminAnswerList(page);
	}
	@Override
	public int totalCntTypeC() {
		return mapper.totalCntTypeC();
	}
	@Override
	public boolean adminAnswer(BoardVO boardvo) {
		return mapper.adminAnswer(boardvo) == 1;
	}

	@Override
	public BoardVO getQuestion(int bno) {
		return mapper.selectQuestion(bno);
	}
	
}
