# Enabling Image and Video Support

- [ ] Analyze current codebase and templates <!-- id: 0 -->
    - [ ] Check `post_template.html` and `news_template.html`
    - [ ] Check `create-post.ps1` (if exists) and `create-announcement.ps1`
    - [x] Check `create-post.ps1`
    - [x] Check `update-youtube-video.ps1`
    - [ ] Check `create-announcement.ps1`
- [x] Design solution for embedding media <!-- id: 1 -->
    - [x] Determine best HTML structure for responsive images and videos
    - [x] Create CSS for media containers
    - [x] Design PowerShell logic for file selection and copying
- [/] Implement changes <!-- id: 2 -->
    - [/] Update `style.css` for responsive media
    - [ ] Update `post_template.html` and `news_template.html` with placeholders
    - [ ] Update `create-post.ps1`: Add file picker, copy structure, tag injection
    - [ ] Update `create-announcement.ps1`: Add file picker, copy structure, tag injection
- [ ] Implement "Show Image" button logic <!-- id: 4 -->
    - [ ] Update `style.css` for `<details>` styling
    - [ ] Update `create-post.ps1` to wrap images in `<details>`
    - [ ] Update `create-announcement.ps1` to wrap images in `<details>`
    - [ ] Update templates
- [ ] Verify functionality <!-- id: 3 -->
    - [ ] Create a test post with image and video
    - [ ] Verify responsive design and styling

