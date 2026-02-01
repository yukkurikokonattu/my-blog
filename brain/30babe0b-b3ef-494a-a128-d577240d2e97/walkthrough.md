# Image Support Walkthrough

I have implemented a feature to easily add images to your blog posts and announcements directly from the creation scripts.

## Changes Made
- **Templates**: Added a placeholder `<!-- Media Insertion Point -->` to `post_template.html` and `news_template.html` where images will be inserted.
- **Styles**: Updated `style.css` to make images and videos responsive (they will resize to fit the screen) and look nicer with rounded corners.
- **Scripts**: Updated `create-post.ps1` and `create-announcement.ps1` to include an interactive image uploader.

## How to Use
1. Run `create_post.bat` or `create_announcement.bat` as usual.
2. Enter the title of your post.
3. The script will ask: `画像を添付しますか？ (Y/N)`
4. Type `Y` and press Enter.
5. A file selection window will open. You can select one or multiple images (Hold Ctrl to select multiple).
6. Click "Open".
7. The script will:
    - Create a folder for your images inside `assets/images/posts/` (or `news/`).
    - Copy your selected images there.
    - Automatically insert the HTML code for these images into your new post.
8. Open the generated HTML file to check the result. You can move the `<img>` tags around if you want them in different places within the text.

## Verification
Please try creating a test post to verify that the image selection window appears and the images are clear and visible in the resulting HTML file.
