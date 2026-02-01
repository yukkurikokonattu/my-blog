# Collapsible Image Support Walkthrough

I have updated the system to make uploaded images "collapsible". They will be hidden behind a "画像を表示する" (Show Image) button by default.

## What's New
- **Show/Hide Button**: Images inserted via the script are now wrapped in a button.
- **Auto-Resize**: When opened, images will automatically fit the screen width and won't exceed 80% of the screen height.
- **Cleaner Templates**: The templates now include commented-out examples of this new structure.

## Structure
The generated code looks like this:
```html
<details class="media-accordion">
    <summary>画像を表示する</summary>
    <img src="..." alt="...">
</details>
```

## How to Test
1. Run `create_post.bat`.
2. Select an image when prompted.
3. Open the created HTML file.
4. You should see a bar saying "画像を表示する".
5. Click it to reveal the image, which should be perfectly sized.
