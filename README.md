# My Blog Project

AIと一緒に作った個人のブログサイトです。

## 使い方

### 1. 新しい記事を作る
`create-post.ps1` スクリプトを使います。

**PowerShellで実行:**
```powershell
.\create-post.ps1 -title "記事のタイトル"
```
実行すると、最新の番号でHTMLファイル（例: `post7.html`）が作られ、自動的にブログ一覧に追加されます。

### 2. 手動で記事を追加した場合の更新
もしHTMLファイルを手動でコピーして作った場合は、以下のファイルをダブルクリックしてください。

`update_blog.bat`

これだけで `blog-posts.js` が更新され、サイトに反映されます。

## GitHubへの公開手順

1. 記事を書く・更新する。
2. `update_blog.bat` を実行して一覧を最新にする。
3. すべての変更をコミットしてGitHubへプッシュする。

```bash
git add .
git commit -m "記事を追加"
git push origin main
```
