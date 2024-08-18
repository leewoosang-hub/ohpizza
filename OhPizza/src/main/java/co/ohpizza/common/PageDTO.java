package co.ohpizza.common;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class PageDTO {
	//field
	private int page;//현재 페이지
	private int startPage, endPage;// 시작하는 페이지// 끝나는 페이지
	private boolean preview, next;// 이전 페이지 // 다음 페이지
	//constructor
	public PageDTO(int page, int total, int count) { 
		this.page = page;
		this.endPage = (int) (Math.ceil(page / 10.0)*10);
		this.startPage = this.endPage - 9;
		int realEnd = (int) Math.ceil(total / count); // 실제건수 계산한 마지막페이지
		
		//int realEnd =  (int) Math.ceil(total/10.0);
		this.endPage = this.endPage > realEnd ? realEnd : this.endPage;
		
		this.preview = this.startPage > 1;
		this.next = this.endPage < realEnd;
	}
	//method
}
