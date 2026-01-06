# Site Guide Implementation Plan

## Goal Description
Add an interactive or semi-static "Site Guide" component to the homepage. This will use speech bubbles and a small character to explain the different sections (Blog/Updates, YouTube, Theme) to first-time visitors.

## Proposed Changes
### Root Directory
#### [MODIFY] [index.html](file:///c:/Users/maiku/.gemini/antigravity/index.html)
- **HTML Restructuring**:
    - Move `.guide-content` outside of `.guide-overlay` to separate their stacking contexts.
    - This allows the bubble to sit above the highlight shadow while the overlay sits below.
- **Top-Aligned Positioning**:
    - Update `repositionGuide` to align the bubble with the **top** of the target element (rather than the center).
    - This ensures the text is immediately visible near the heading of the section.
    - Maintain a safe margin (padding) to prevent any perceived overlap.

#### [MODIFY] [style.css](file:///c:/Users/maiku/.gemini/antigravity/style.css)
- **Layering Fix**:
    - `.guide-overlay`: `z-index: 10000` (Bottom)
    - `.guide-highlight`: `z-index: 10001` (Middle - shadow layer)
    - `.guide-content`: `z-index: 10002` (Top - bright layer)
- **Backdrop Clarification**: Ensure no blur and optimize opacity.

## Verification Plan
### Manual Verification
1.  Clear browser `localStorage`.
2.  Reload the site and verify the guide starts automatically.
3.  Click through the steps and verify the bubbles point to the correct elements.
4.  Verify the guide doesn't reappear on subsequent reloads unless manually triggered (optional button).
