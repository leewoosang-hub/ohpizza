package co.ohpizza.common;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class PageDTO {
    // field
    private int page; // 현재 페이지
    private int startPage, endPage; // 시작하는 페이지, 끝나는 페이지
    private boolean preview, next; // 이전 페이지, 다음 페이지

    // constructor
    public PageDTO(int page, int total, int count) {
        this.page = page;

        // 페이지 계산
        this.endPage = (int) (Math.ceil(page / 10.0) * 10);
        this.startPage = this.endPage - 9;

        // 실제 마지막 페이지 계산
        int realEnd = (int) Math.ceil(total / (double) count);
        if (realEnd == 0) {
            this.endPage = 1; // 게시물이 없을 때 endPage를 1로 설정
        } else {
            this.endPage = Math.min(this.endPage, realEnd); // endPage와 realEnd 중 더 작은 값 설정
        }

        // 이전, 다음 버튼 여부 설정
        this.preview = this.startPage > 1;
        this.next = this.endPage < realEnd;
    }
}
