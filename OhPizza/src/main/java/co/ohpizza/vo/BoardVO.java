package co.ohpizza.vo;

import lombok.Data;

@Data
public class BoardVO {
	private int boardNo; //board_no
	private String boardTitle; //board_title
	private int boardView; //board_view
	private String boardDate; //board_date
	private String review; //review
	private String question; //question
	private String answer; //answer
	private String memId; //mem_id
	private String boardType; // board type ('R', 'C')
	
	public String boardDate() {
		return boardDate.substring(0, 10);
	} 
}
