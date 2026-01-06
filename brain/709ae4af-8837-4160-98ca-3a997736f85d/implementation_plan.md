# Site Guide Implementation Plan

## Goal Description
Add an interactive or semi-static "Site Guide" component to the homepage. This will use speech bubbles and a small character to explain the different sections (Blog/Updates, YouTube, Theme) to first-time visitors.

## Proposed Changes
### Root Directory
#### [MODIFY] [index.html](file:///c:/Users/maiku/.gemini/antigravity/index.html)
- **Default Dark Mode**:
    - Update theme script to use `'dark'` as the default if `localStorage.getItem('theme')` is null.
- **Nav Guide Steps**:
    - Add `id="nav-announcements"` and `id="nav-blog"` to navbar links.
    - Update `guideSteps` array.
- **Guide Positioning (Right Shift)**:
    - Update `repositionGuide` logic to prefer placing the bubble to the right or with a significant horizontal offset to avoid covering the center/target.
    - Ensure the "Next" buttons are always visible.

#### [MODIFY] [style.css](file:///c:/Users/maiku/.gemini/antigravity/style.css)
- **Highlight Refinement**:
    - Ensure `.guide-highlight` has a high z-index but is actually visible (not dimmed).
    - Adjust `.guide-content` to have no shadow interference.

## Verification Plan
### Manual Verification
1.  Clear browser `localStorage`.
2.  Reload the site and verify the guide starts automatically.
3.  Click through the steps and verify the bubbles point to the correct elements.
4.  Verify the guide doesn't reappear on subsequent reloads unless manually triggered (optional button).
