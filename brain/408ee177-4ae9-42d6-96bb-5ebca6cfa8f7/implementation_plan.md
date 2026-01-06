# Fix Missing Blog Titles

The user reported that blog posts created using the `.bat` file (PowerShell script) are missing titles in the page body. This is because the `post_template.html` has an empty `<h1>` tag, while the PowerShell script expects to replace the literal text "記事タイトル" or "タイトル".

## Proposed Changes

### Templates

#### [MODIFY] [post_template.html](file:///c:/Users/maiku/.gemini/antigravity/post_template.html)
- Add "記事タイトル" inside the `<h1 id="post-title">` tag.
- Add `class="text-outline"` to the `<h1>` tag to match the style of news posts.

#### [MODIFY] [news_template.html](file:///c:/Users/maiku/.gemini/antigravity/news_template.html)
- Ensure consistency by using `<h1 id="post-title" class="text-outline">記事タイトル</h1>`. Currently it uses `<h1 class="text-outline">記事タイトル</h1>` without the ID.

### Existing Posts

#### [MODIFY] Update existing posts
- Manually insert the correct title into the `<h1>` tag for:
    - `post_20260106_1323.html`
    - `post_20260106_1317.html`
    - `post_20260106_0925.html`

## Verification Plan

### Automated Tests
- Run `create_post.bat` (or manually run the PS1 script) to generate a new post and verify that the title is correctly inserted into the HTML.

### Manual Verification
- Open the newly generated HTML file in the browser (if possible) or inspect its content to confirm the `<h1>` tag is correctly populated.
