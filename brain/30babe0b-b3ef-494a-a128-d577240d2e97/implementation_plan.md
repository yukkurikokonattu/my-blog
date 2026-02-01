# Enable Image and Video Support in Blog and Announcements

The goal is to allow the user to easily insert images and videos into their blog posts and announcements.

## User Review Required
- **Video Hosting**: Do you want to upload video files directly to the site, or embed from YouTube? (Assumed: YouTube is preferred for bandwidth, but local video support might be needed). I will provide support for both if possible, or focus on responsive YouTube embeds and simple image tags.
- **Workflow**: Since you currently edit HTML files, I will likely add "snippets" or commented-out sections in the templates that you can uncomment and fill in.

## Proposed Changes

### CSS
- Update `style.css` to add:
    - `.post-content img, .post-content video`: Ensure they are responsive (`max-width: 100%`, `height: auto`), have rounded corners (`border-radius`), and a subtle shadow.
    - `.video-container`: Ensure the existing class works well within the post content.

### Scripts (Automation)
- Modify `create-post.ps1` and `create-announcement.ps1` to:
    1.  **Ask**: "画像を添付しますか？ (Y/N)"
    2.  **Select**: If Yes, open a file selection dialog (multiple files allowed).
    3.  **Copy**: Create a folder `assets/images/posts/YYYYMMDD_HHmm/` and copy selected images there.
    4.  **Inject**: Automatically append `<img src="...">` tags to the content of the new HTML file.

### Templates
- Modify `post_template.html` and `news_template.html`:
    - Ensure there is a specific marker (e.g., `<!-- INSERT_IMAGES_HERE -->`) inside the content area for the script to target, or simply appending to the end of the text.

### Scripts (Optional)
- If `create-post.ps1` exists, I might add a prompt, but template modification is usually safer and more flexible for manual editing.

## Verification Plan
### Manual Verification
- Create a temporary test post manually (or via script).
- Insert an image and a YouTube video using the snippets.
- Verify responsiveness on mobile and desktop widths.

