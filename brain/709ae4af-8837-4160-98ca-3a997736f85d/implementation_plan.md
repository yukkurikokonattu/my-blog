# Site Guide Implementation Plan

## Goal Description
Add an interactive or semi-static "Site Guide" component to the homepage. This will use speech bubbles and a small character to explain the different sections (Blog/Updates, YouTube, Theme) to first-time visitors.

## Proposed Changes
### Root Directory
#### [MODIFY] [style.css](file:///c:/Users/maiku/.gemini/antigravity/style.css)
- **Blur Reduction**:
    - Remove `backdrop-filter: blur(2px)` from `.guide-overlay` to make the background clearer.
    - Slightly reduce the opacity of the overlay background if it feels too dark.
- **Z-Index Stability**: Ensure `.guide-content` is definitely on top.

#### [MODIFY] [index.html](file:///c:/Users/maiku/.gemini/antigravity/index.html)
- **Aggressive Positioning**:
    - Update `repositionGuide` to calculate positioning based on the *edges* of the target, not just the center.
    - For large elements like the YouTube card, prioritize placing the bubble completely outside the vertical/horizontal boundaries.
    - If placing to the right is impossible, try a smarter fallback that doesn't overlap.

## Verification Plan
### Manual Verification
1.  Clear browser `localStorage`.
2.  Reload the site and verify the guide starts automatically.
3.  Click through the steps and verify the bubbles point to the correct elements.
4.  Verify the guide doesn't reappear on subsequent reloads unless manually triggered (optional button).
