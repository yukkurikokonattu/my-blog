# Fixing Text Encoding & Automating Blog Updates

文字化け問題の修正に加えて、手動で追加した記事ファイルも自動的にサイトのエデックスに反映させる自動化スクリプトを作成しました。

## Changes

### 1. [create-post.ps1](file:///C:/Users/maiku/.gemini/antigravity/create-post.ps1) (Fixed)
- UTF-8エンコーディングを明示的に指定するように修正し、文字化けを防止しました。

### 2. [NEW] [update-blog-index.ps1](file:///C:/Users/maiku/.gemini/antigravity/update-blog-index.ps1) (Utility)
- **機能**: フォルダ内の全ての `post*.html` をスキャンし、`blog-posts.js` を再生成します。
- **使い方**: 記事を手動で追加・削除した後、このスクリプトを実行するだけで一覧が更新されます。
- **特徴**:
  - 既存の日付データを保持します（リセットされません）。
  - 新規ファイルはファイル作成日時を自動設定します。
  - 記事タイトルの「ブログ記事 - 」などの接頭辞を自動除去します。

### 3. [blog-posts.js](file:///C:/Users/maiku/.gemini/antigravity/blog-posts.js) (Updated)
- `post6.html` を含む全ての記事情報が正しく登録されました。
- タイトルから不要な接頭辞が削除され、クリーンになりました。

## Verification
- `update-blog-index.ps1` を実行し、`post6` が `blog-posts.js` に追加されることを確認しました。
- 各記事のタイトルが適切に整形されていることを確認しました。
