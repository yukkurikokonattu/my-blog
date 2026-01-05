# Blog Post Separation and Collapsible Content

## Goal Description
Create individual HTML files for each blog post (e.g., `post1.html`, `post2.html`). Each post page will include:
- A header with the post title.
- An automatically generated date/time stamp in the format `YY/MM/DD/HH:MM` using JavaScript.
- The post body wrapped in a collapsible section that can be expanded/collapsed if the content is long.
- A navigation link back to the main `blog.html` list page.

## Proposed Changes
---
### Blog List Page (`blog.html`)
#### [MODIFY] blog.html
- Replace the static list of posts with links to the new individual post pages.
- Add a brief excerpt for each post (optional) and a "Read more" link.

---
### New Post Template (`post_template.html`)
#### [NEW] post_template.html
- Create a reusable HTML template for individual posts.
- Include a `<script>` that inserts the current date/time into an element with id `post-date`.
- Wrap the post content inside a `<details>` element for collapsible behavior.

---
### Example Post Files (`post1.html`, `post2.html`)
#### [NEW] post1.html
- Generated from the template with placeholder title and content.
#### [NEW] post2.html
- Same as above for a second post.

---
### Styles (`style.css`)
#### [MODIFY] style.css
- Add CSS for the collapsible `<details>` element to improve appearance.
- Optional: style for the date/time display.

## Verification Plan
### Automated Tests
- Open `blog.html` in a browser and verify that each "Read more" link navigates to the correct post page.
- On a post page, check that the date/time element displays the current date/time in the required format.
- Verify that clicking the post title expands/collapses the content.

### Manual Verification
- Ask the user to open the pages in a browser and confirm the layout, date format, and collapsible behavior.
