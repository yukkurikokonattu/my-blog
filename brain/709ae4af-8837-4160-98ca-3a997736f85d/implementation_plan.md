# Implementation Plan - Search, Tags & Transitions

Adding search and tag filtering to improve content discoverability, and smooth transitions for a premium feel.

## Proposed Changes

### [Component] Global Styles
#### [MODIFY] [style.css](file:///c:/Users/maiku/.gemini/antigravity/style.css)
- **Smooth Transitions**:
    - Define `@keyframes fadeIn` for smooth entry.
    - Create a `.fade-in` utility class for main content containers.
- **Eliminate White Flash**:
    - Add a tiny inline script in the `<head>` of all HTML files to apply the `data-theme` attribute immediately.
    - Set the default background color in `style.css` to match the dark theme, as it is now the standard for new users.
- **Layout Stability**:
    - Add `scrollbar-gutter: stable` to the `html` or `body` element.
    - This ensures that space for the scrollbar is always reserved, preventing the content from "jumping" or shifting horizontally when moving between short and long pages.
- **Search & Tag UI**:
    - Add styles for tag buttons (active/inactive states).
    - Add styles for the search input bar.

### [Component] Data & Scripting
#### [MODIFY] [blog.html](file:///c:/Users/maiku/.gemini/antigravity/blog.html) & [announcements.html](file:///c:/Users/maiku/.gemini/antigravity/announcements.html)
- **UI**: Add a `<div id="search-container">` with a search input bar.
- **Logic**: 
    - Implement real-time filtering of the `blogPosts` or `announcements` array based on the search input.
    - Re-render the list automatically as the user types.

### [Component] Templates
#### [MODIFY] [index.html](file:///c:/Users/maiku/.gemini/antigravity/index.html), [blog.html](file:///c:/Users/maiku/.gemini/antigravity/blog.html), [announcements.html](file:///c:/Users/maiku/.gemini/antigravity/announcements.html), [post_template.html](file:///c:/Users/maiku/.gemini/antigravity/post_template.html), [news_template.html](file:///c:/Users/maiku/.gemini/antigravity/news_template.html)
- Add the `fade-in` class to the `<main>` or container element.

## Verification Plan
### Manual Verification
1. Verify that clicking any navigation link fades in the content smoothly.
2. Search for a specific word in the blog page and ensure results update instantly.
3. Verify the search bar looks premium and fits the theme.
