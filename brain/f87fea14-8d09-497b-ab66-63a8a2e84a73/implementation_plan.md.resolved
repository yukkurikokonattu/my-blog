# アカウントシステム（認証機能）の導入計画

このサイトに専用のアカウントシステムを導入し、ログインしたユーザーのみがアクセスできるページや機能を作成します。
バックエンドサーバーを必要としない **Firebase Authentication** を採用します。

## ユーザーレビューが必要な項目

> [!IMPORTANT]
> Firebaseを使用するため、ココナッツさんに **Firebaseプロジェクトの作成と設定ファイルの取得** をお願いする必要があります。手順は後述します。

> [!WARNING]
> 静的なサイト（GitHub Pagesなど）の性質上、JavaScriptによるアクセス制限は「簡易的」なものになります。ブラウザのソース表示などでコンテンツが見えてしまう可能性があります。
> 本当に秘密の情報を守る場合は、Firestoreなどのデータベースと連携して「ログインしたユーザーのみがデータを取得できる」仕組みにする必要があります。今回はまず基本の認証システムを構築します。

## 変更内容

### 認証基盤の構築

#### [NEW] [firebase-config.js](file:///c:/Users/maiku/.gemini/antigravity/firebase-config.js)
Firebaseの設定値を保持するファイルです。

#### [NEW] [auth.js](file:///c:/Users/maiku/.gemini/antigravity/auth.js)
Firebase SDKの初期化、ログイン・ログアウト・ユーザー状態監視のロジックをまとめます。

### UI・ページ追加

#### [NEW] [login.html](file:///c:/Users/maiku/.gemini/antigravity/login.html)
メールアドレスとパスワードによるログインフォーム。

#### [NEW] [signup.html](file:///c:/Users/maiku/.gemini/antigravity/signup.html)
新しくアカウントを作成するためのフォーム。

#### [NEW] [member-only.html](file:///c:/Users/maiku/.gemini/antigravity/member-only.html)
ログインしているユーザーだけが見られる秘密のページ（デモ）。

### 既存ページの更新

#### [MODIFY] [index.html](file:///c:/Users/maiku/.gemini/antigravity/index.html) 他、各HTML
ナビゲーションバーに「ログイン」または「アカウント」リンクを追加し、ログイン状態に応じて表示を切り替えるスクリプトを読み込みます。

---

## 検証プラン

### 自動テスト
- 現状、自動テスト環境がないため、ブラウザ操作による手動およびスクリプト検証を行います。

### 手動検証
1. **会員登録**: `signup.html` からアカウントを作成できるか。
2. **ログイン**: 作成したアカウントで `login.html` からログインできるか。
3. **アクセス制限**: ログアウト状態で `member-only.html` にアクセスした際、ログインページにリダイレクトされるか。
4. **ナビゲーション表示**: ログイン前後でナビゲーションの表示（「ログイン」→「ユーザー名/ログアウト」）が正しく変わるか。
5. **ログアウト**: ログアウト処理が正しく行われ、制限ページに入れなくなるか。
