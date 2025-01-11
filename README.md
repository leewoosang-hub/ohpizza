<img src="https://capsule-render.vercel.app/api?type=waving&color=f08080&height=200&section=header&text=Oh!%pizza%&fontSize=40&animation=fadeIn&fontAlign=84&fontAlignY=36" />

# 🍕 Oh! pizza

  이미 완성한 프로젝트의 CSS와 JS를 수정하였습니다.

## ⌨ 掲示板  
  
### 1. 페이징 기능

```
package co.ohpizza.common;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class PageDTO {
    // フィールド
    private int page; // 現在のページ
    private int startPage, endPage; // 開始ページ、終了ページ
    private boolean preview, next; // 前のページ、次のページ

    // コンストラクタ
    public PageDTO(int page, int total, int count) {
        this.page = page;

        // ページ計算
        this.endPage = (int) (Math.ceil(page / 10.0) * 10);
        this.startPage = this.endPage - 9;

        // 実際の最終ページを計算
        int realEnd = (int) Math.ceil(total / (double) count);
        if (realEnd == 0) {
            this.endPage = 1; // 投稿がない場合、endPageを1に設定
        } else {
            this.endPage = Math.min(this.endPage, realEnd); // endPageとrealEndの小さい方を設定
        }

        // 前後ボタンの有無を設定
        this.preview = this.startPage > 1;
        this.next = this.endPage < realEnd;
    }
}
```
- ページングのロジックのdto

##
     
### 2. 게시물 리스트
  
<img src="https://github.com/leewoosang-hub/ohpizza/blob/main/image/boardList_before.PNG">
  
- BEFORE
     
<img src="https://github.com/leewoosang-hub/ohpizza/blob/main/image/boardList_after.PNG">

 - AFTER

1. CSS 개선 - 참고 모델과 유사하게 CSS를 구현하였습니다.
2. 마우스 호버링 추가 - 마우스 호버링 CSS를 추가하여 직관성을 높혔습니다.
3. 상세 페이지 이동 방식 개선 - 제목에 직접 링크를 걸지 않고, TR 전체에 클릭 이벤트를 추가하였습니다.

```
 const boardTr = document.querySelectorAll("tbody > tr"); // trを指定
boardTr.forEach((tr) => {
  // trを繰り返し処理し、全ての要素にイベントを追加
  tr.addEventListener("click", function (event) {
    const thisBoardNo = this.getAttribute("data-board-no").trim();
    const thisMemId = this.children[1].innerHTML.trim();
    const url = "boardDetail.do?bno=" + thisBoardNo + "&id=" + thisMemId;
    location.href = url;
  });
});
```
   
4. ログイン中のセッションの投稿 - 비동기 처리로 로그인 중인 세션의 글만 출력하는 이벤트를 추가했습니다.


##


###  3. 게시물 상세

  7. 수정폼


## ❓ 問い合わせ

  1. 게시판과 문의는 같은 테이블을 사용했습니다.
  
##

### 参考サイト

- 参考モデル: https://cyphers.nexon.com/article/balance
- github リモート　参考: https://hanke-r.tistory.com/entry/eclipse-%EC%83%88%EB%A1%9C-%EC%83%9D%EC%84%B1%EB%90%9C-Git-branch-%EA%B0%80%EC%A0%B8%EC%98%A4%EA%B8%B0
- ボタン css 参考: https://pjh3749.tistory.com/144
- table css : https://hianna.tistory.com/498
- マウスカーソル CSS: https://ming-jee.tistory.com/65
- TEXTAREA css: https://velog.io/@leemember/CSS-textarea-%ED%81%AC%EA%B8%B0-%EA%B3%A0%EC%A0%95%ED%95%98%EA%B8%B0
- footer css: https://velog.io/@gomiseki/footer-%ED%95%98%EB%8B%A8-%EA%B3%A0%EC%A0%95
- ajax 参考1:　https://yejip.com/web/2020-12-19-%EA%B2%8C%EC%8B%9C%ED%8C%90ajax3/
- ajax 参考2:　https://padac-padac.tistory.com/149
- JSでDOM操作:　https://velog.io/@ssumniee/JS-%ED%81%B4%EB%9E%98%EC%8A%A4%EB%AA%85-%EC%B6%94%EA%B0%80-%EC%82%AD%EC%A0%9C
- jackson 依存性の注入 : https://interconnection.tistory.com/137
<img src="https://capsule-render.vercel.app/api?type=waving&color=f08080&height=200&section=footer&20render&fontSize=90" />
