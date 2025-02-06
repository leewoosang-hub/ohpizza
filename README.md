<img src="https://capsule-render.vercel.app/api?type=waving&color=f08080&height=200&section=header&text=Oh!%pizza%&fontSize=40&animation=fadeIn&fontAlign=84&fontAlignY=36" />

## ⌨ 掲示板 （商品-review） 
  
### 1. ページング

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
- ページングのロジックのdtoです。
- ロジック改善 -　投稿が5個未満の場合、ページが生成されなかった問題を解決しました。

##
     
### 2. 投稿リスト
  
<img src="https://github.com/leewoosang-hub/ohpizza/blob/main/image/boardList_before.PNG">
  
- BEFORE
     
<img src="https://github.com/leewoosang-hub/ohpizza/blob/main/image/boardList_after.PNG">

 - AFTER

1. CSS改善 - 参考モデルに近い形でCSSを実装しました。
2. マウスホバーを追加 - マウスホバーのCSSを追加し、直感性を向上させました。
3. 詳細ページへの移動方法の改善 - タイトルに直接リンクを設定せず、TR全体にクリックイベントを追加しました。

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
   
4. ログイン中のセッションの投稿 - 非同期処理でログイン中のセッションの投稿のみを出力するイベントを追加しました。
   
<img src="https://github.com/leewoosang-hub/ohpizza/blob/main/image/myBoardList_button.PNG">

- ボタンをクリックすると、非同期処理でログイン中のセッションの投稿が整列されます。
  
```
// ajaxでテーブル整列
const myBoardList = document.querySelectorAll(".btnMyBoard");
myBoardList.forEach((btn) => {
	btn.addEventListener("click", function(event) {
		$.ajax({
			url: "/OhPizza/myBoardList.do?id=" + logId,
			method: "GET",
			data: "json",
			success: function(response) {
				console.log(response)
				updateBoardList(response.myBoardList);
			},
			error: function(xhr, status, error) {
				alert("データの取得中、エラーが発生しました。");
			},
		});
	});
});
```

- 非同期処理コードです。

```
public class myBoardListControl implements Control {
	@Override
	@ResponseBody
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession(false);
		resp.setContentType("application/json;charset=UTF-8");
		
		String id = (String) session.getAttribute("logId");
		
		String page = req.getParameter("page");
		page = page == null ? "1" : page;
		
		BoardService myBoardList = new BoardServiceImpl();
		
		List<BoardVO> board = myBoardList.myBoardList(id);
		
		 Map<String, Object> responseMap = new HashMap<>();
		 responseMap.put("myBoardList", board);
		
		 ObjectMapper mapper = new ObjectMapper();
		 String jsonResponse = mapper.writeValueAsString(responseMap);
		 resp.getWriter().write(jsonResponse);
	}
	
}
```

- 非同期処理に合わせてコントローラを作成しました。

<img src="https://github.com/leewoosang-hub/ohpizza/blob/main/image/myBoardList.PNG">

```
// テーブルの変更
function updateBoardList(boardList) {
	const tbody = document.querySelector("tbody");
	tbody.innerHTML = "";

	const btnMyBoard = document.querySelector(".btnMyBoard");
	btnMyBoard.remove();

	const page = document.querySelector(".page");
	page.remove();

	// boardListデータをループ処理
	boardList.forEach((board) => {
		// tr要素を作成
		const tr = document.createElement("tr");
		tr.classList.add("board"); // クラスを追加
		tr.setAttribute("data-board-no", board.boardNo); // data-board-no属性を追加

		// タイトル (td)
		const titleTd = document.createElement("td");
		titleTd.classList.add("col-sm-6", "title");
		titleTd.textContent = board.boardTitle;
		tr.appendChild(titleTd);

		// 投稿者 (td)
		const memIdTd = document.createElement("td");
		memIdTd.textContent = board.memId;
		tr.appendChild(memIdTd);

		// 閲覧数 (td)
		const viewTd = document.createElement("td");
		viewTd.textContent = board.boardView;
		tr.appendChild(viewTd);

		// 投稿日時 (td)
		const dateTd = document.createElement("td");
		const date = new Date(board.boardDate);
		const formattedDate =
			date.getFullYear() + "-" +
			String(date.getMonth() + 1).padStart(2, "0") + "-" +
			String(date.getDate()).padStart(2, "0");

		dateTd.textContent = formattedDate;

		tr.appendChild(dateTd);

		// 削除ボタンまたは"-" (td)
		const deleteTd = document.createElement("td");
		const deleteButton = document.createElement("button");
		deleteButton.type = "button";
		deleteButton.textContent = "削除する";
		deleteTd.appendChild(deleteButton);

		tr.appendChild(deleteTd);

		// 完成したtrをtbodyに追加
		tbody.appendChild(tr);

		deleteButton.addEventListener("click", function(event) {
			const thisBoardNo = tr.getAttribute("data-board-no");
			console.log(thisBoardNo);
			const url = "/OhPizza/removeBoard.do?boardNo=" + thisBoardNo;
			location.href = url;
		});

		const boardTr = document.querySelectorAll("tbody > tr"); // tr指定
		boardTr.forEach((tr) => {
			// tr要素をループし、全ての要素にイベントを発生させる
			tr.addEventListener("click", function(event) {
				const thisBoardNo = this.getAttribute("data-board-no");
				const thisMemId = this.children[1].innerHTML.trim();
				const url = "boardDetail.do?bno=" + thisBoardNo + "&id=" + thisMemId;
				location.href = url;
			});
		});
	});
}

```

- JSで動的に要素を生成しました。

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
- dateFormat 参考1: https://kdyspring.tistory.com/31
- dateFormat 参考2: https://yesdohyun.tistory.com/85

***

### <a href="https://github.com/leewoosang-hub/LWS-portfolio">トップページに戻る</a>

<img src="https://capsule-render.vercel.app/api?type=waving&color=f08080&height=200&section=footer&20render&fontSize=90" />
