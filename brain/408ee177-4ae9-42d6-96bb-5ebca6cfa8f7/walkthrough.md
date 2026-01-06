# ブログ記事タイトルの不具合修正完了

バットファイル（PowerShellスクリプト）で記事を作成した際に、タイトルの書き換えが行われていなかった不具合を修正しました。

## 修正内容

### 1. テンプレートの修正
`post_template.html` の `<h1>` タグが空だったため、スクリプトが置換対象を見つけられなくなっていました。
置換用のプレースホルダー（`記事タイトル`）を追加し、同時にお知らせ（News）と同じ縁取りスタイル（`text-outline`）を適用しました。

```diff
- <h1 id="post-title"></h1>
+ <h1 id="post-title" class="text-outline">記事タイトル</h1>
```

### 2. スクリプトの改善
`create-post.ps1` および `create-announcement.ps1` の置換ロジックをより正確にしました。
- `<h1>` 内のタイトルの置換が確実に行われるようにしました。
- `<title>` タグ（ブラウザのタブに表示される名前）も正しく置換されるように修正しました。

### 3. 既存の記事の修正
タイトルが空になっていた以下のファイルを修正し、タイトルが表示されるようにしました。
- [post_20260106_1323.html](file:///c:/Users/maiku/.gemini/antigravity/post_20260106_1323.html)
- [post_20260106_1317.html](file:///c:/Users/maiku/.gemini/antigravity/post_20260106_1317.html)

## 動作確認結果
新しく記事を作成し、タイトルが本文とタブの両方に正しく反映されることを確認しました。
![image](/c:/Users/maiku/.gemini/antigravity/brain/408ee177-4ae9-42d6-96bb-5ebca6cfa8f7/uploaded_image_1767673547094.png)
*(修正前の状態：タイトルが消えてしまっていました)*

現在は、新しく作成する記事でも正しくタイトルが表示されるようになっています！
