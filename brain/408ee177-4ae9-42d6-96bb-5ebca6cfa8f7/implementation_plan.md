# Enhanced Blog Features Implementation Plan

ココナッツさん、3つの新機能を追加します！
1. **読了時間（自動計算）**: 記事の文字数から「約〇分で読めます」を自動表示。
4. **プログレスバー**: 画面の一番上にどれくらい読み進めたかを表示。
2. **おすすめ記事（最近の投稿）**: 記事の最後に他の投稿を表示。

## Proposed Changes

### Styles

#### [MODIFY] [style.css](file:///c:/Users/maiku/.gemini/antigravity/style.css)
- Add styles for `.progress-container` and `.progress-bar`.
- Add styles for the `.recent-posts-section` and `.recent-post-card` components.
- Style the `.reading-time` badge.

### Templates

#### [MODIFY] [post_template.html](file:///c:/Users/maiku/.gemini/antigravity/post_template.html) & [news_template.html](file:///c:/Users/maiku/.gemini/antigravity/news_template.html)
- Add `<div class="progress-container"><div id="scroll-progress" class="progress-bar"></div></div>` at the top of the body.
- Add `<span id="reading-time" class="post-date"></span>` near the date.
- Add a `<section id="recent-posts" class="recent-posts-section"></section>` before the footer/buttons.
- **JavaScript Logic**:
    - **Reading Time**: Count characters in `.post-content` (removing spaces) and divide by 500 (average Japanese reading speed).
    - **Progress Bar**: Calculate `(window.scrollY / (document.body.scrollHeight - window.innerHeight)) * 100` on scroll.
    - **Recent Posts**: Fetch data from `blog-posts.js` (or `announcements.js`) and render the latest 2-3 items excluding the current post.

### Existing Posts

#### [MODIFY] Update existing HTML files
- I will apply these changes to the existing blog and news files to ensure they all benefit from the new features.

## Verification Plan

### Manual Verification
- Open a blog post and scroll to see if the progress bar moves correctly.
- Check if the reading time is calculated and displayed (e.g., "約1分で読めます").
- Check if the "Recent Posts" section appears at the bottom withclickable links.
- Test both Light and Dark modes.
