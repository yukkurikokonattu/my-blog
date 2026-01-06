# Site Guide Implementation Plan

## Goal Description
Add an interactive or semi-static "Site Guide" component to the homepage. This will use speech bubbles and a small character to explain the different sections (Blog/Updates, YouTube, Theme) to first-time visitors.

## Proposed Changes
### Root Directory
#### [MODIFY] All HTML Files and Templates
- **Default Dark Mode Enforcement**:
    - Search and replace `localStorage.getItem('theme') || 'light'` with `localStorage.getItem('theme') || 'dark'` in all `.html` files (Home, Blog, Announcements, and individual posts/news).
    - Ensure `themeIcon.textContent` matches the default theme.

#### [MODIFY] Individual Posts and News
- **Batch Update**:
    - Use a PowerShell script to update all existing `post*.html` and `news*.html` files.

## Verification Plan
### Manual Verification
1.  Clear browser `localStorage`.
2.  Reload the site and verify the guide starts automatically.
3.  Click through the steps and verify the bubbles point to the correct elements.
4.  Verify the guide doesn't reappear on subsequent reloads unless manually triggered (optional button).
