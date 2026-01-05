# Single-Page Collapsible Announcements

## Goal Description
Refactor the announcements page to display multiple announcements on a single page, but clearly separated into individual "cards" or "blocks" with their own background styles. Each announcement will be collapsible to keep the page clean.

## Proposed Changes
---
### Announcements Page (`announcements.html`)
#### [MODIFY] announcements.html
- Change the `<ul>` list into a series of `<details>` elements or styled `.announcement-card` divs.
- Use `<details>` for built-in collapsible behavior.
- Add specific classes or inline styles to give each announcement a distinct "background" feel as requested.

---
### Styles (`style.css`)
#### [MODIFY] style.css
- Add styles for `.announcement-card` or the new `details` structure within the announcements context.
- Define a few "card-specific" background variations (e.g., subtle gradients or semi-transparent colors) to ensure each looks distinct.

## Verification Plan
### Automated Tests
- Check `announcements.html` to ensure all announcements are visible on the same page.
- Verify that each announcement can be expanded/collapsed.

### Manual Verification
- Confirm with the user that the "distinction" between posts (backgrounds/separation) meets their expectations without leaving the page.
