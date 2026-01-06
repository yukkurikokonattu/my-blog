# inject-premium-features.ps1
# Robust version using Unicode escapes for non-ASCII characters to avoid corruption.

$files = Get-ChildItem -Path . -Filter "post_*.html"
$files += Get-ChildItem -Path . -Filter "news_*.html"

foreach ($file in $files) {
    if ($file.Name -match "template") { continue }
    
    $content = Get-Content $file.FullName -Raw -Encoding UTF8
    
    Write-Host "Cleaning and Updating $($file.Name)..."

    # --- 1. CLEANUP PREVIOUS ATTEMPTS ---
    # Remove progress bar
    $content = $content -replace '(?s)<div class=''progress-container''>.*?</div>', ''
    # Remove recent section
    $content = $content -replace '(?s)<!-- Recent Section -->.*?/section>', ''
    $content = $content -replace '(?s)<section class="recent-posts-section">.*?</section>', ''
    # Remove injected scripts
    $content = $content -replace '(?s)<script src="(blog-posts|announcements).js"></script>.*?</script>', ''
    # Restore post-date
    $content = $content -replace '(?s)<div style="display: flex; align-items: center; margin-bottom: 0.8rem;">.*?</div>', '<p id="post-date" class="post-date"></p>'
    # Remove post-content ID if it's there
    $content = $content -replace 'id="post-content"', ''
    # Remove extra closing divs that might have appeared from previous regex errors
    $content = $content -replace '(?s)</div>\s+</div>\s+<nav', '</div>`n    <nav'

    # --- 2. INJECT NEW FEATURES ---
    
    # A. Progress Bar
    $content = $content -replace "<body>", "<body>`n    <div class='progress-container'>`n        <div id='scroll-progress' class='progress-bar'></div>`n    </div>"

    # B. Reading time (using unicode escapes for icons if needed, or just emojis)
    $timeHtml = @"
        <div style="display: flex; align-items: center; margin-bottom: 0.8rem;">
            <p id="post-date" class="post-date" style="margin-bottom: 0;"></p>
            <span id="reading-time" class="reading-time"></span>
        </div>
"@
    $content = $content -replace '<p id="post-date" class="post-date"></p>', $timeHtml
    $content = $content -replace '<div class="post-content">', '<div class="post-content" id="post-content">'

    # C. Recent section
    $gridId = if ($file.Name -like "post_*") { "recent-posts-grid" } else { "recent-announcements-grid" }
    $titleClass = if ($file.Name -like "post_*") { "recent-posts-title" } else { "recent-news-title" }
    
    $recentHtml = @"
        <section class="recent-posts-section">
            <h2 class="text-outline $titleClass" style="font-size: 1.3rem;"></h2>
            <div id="$gridId" class="recent-posts-grid"></div>
        </section>
"@
    $content = $content -replace '(?s)(<div style="margin-top: 2rem; text-align: center;">)', "$recentHtml`n`n        `$1"

    # D. JS Logic (Internalized titles to avoid PS encoding issues)
    $jsImport = if ($file.Name -like "post_*") { 'blog-posts.js' } else { 'announcements.js' }
    
    $jsLogic = @"
    <script src="$jsImport"></script>
    <script>
        // --- New Features Logic ---
        (function() {
            // 1. Reading Progress Bar
            window.addEventListener('scroll', () => {
                const winScroll = window.pageYOffset || document.documentElement.scrollTop;
                const height = document.documentElement.scrollHeight - document.documentElement.clientHeight;
                const scrolled = (winScroll / height) * 100;
                const bar = document.getElementById('scroll-progress');
                if (bar) bar.style.width = scrolled + "%";
            });

            // 2. Automated Reading Time
            const contentEl = document.getElementById('post-content');
            if (contentEl) {
                const text = contentEl.textContent.replace(/\s+/g, '');
                const readingTime = Math.ceil(text.length / 500);
                const timeEl = document.getElementById('reading-time');
                if (timeEl) timeEl.textContent = "⏱️ \u7d04 " + readingTime + " \u5206\u3067\u8aad\u3081\u307e\u3059";
            }

            // 3. Load Recent Data
            window.addEventListener('DOMContentLoaded', () => {
                const isPost = $($( $file.Name -like "post_*" ).ToString().ToLower());
                const gridId = isPost ? 'recent-posts-grid' : 'recent-announcements-grid';
                const grid = document.getElementById(gridId);
                const data = isPost ? window.blogPosts : window.announcements;
                
                // Set Title
                const titleEl = document.querySelector('.' + (isPost ? 'recent-posts-title' : 'recent-news-title'));
                if (titleEl) titleEl.textContent = isPost ? '\u6700\u8fd1\u306e\u6295\u7a3f' : '\u6700\u65b0\u306e\u304a\u77e5\u3089\u305b';

                if (!grid || !data) return;
                const currentPath = window.location.pathname.split('/').pop();
                data.filter(item => item.url !== currentPath).slice(0, 2).forEach(item => {
                    const card = document.createElement('a');
                    card.href = item.url;
                    card.className = 'recent-post-mini-card';
                    card.innerHTML = '<h4>' + item.title + '</h4><span class="mini-date">' + item.date + '</span>';
                    grid.appendChild(card);
                });
            });
        })();
    </script>
"@

    $content = $content -replace "</body>", "$jsLogic`n</body>"

    # Use WriteAllText with UTF-8 No BOM for best compatibility
    $utf8NoBom = New-Object System.Text.UTF8Encoding($false)
    [IO.File]::WriteAllText($file.FullName, $content, $utf8NoBom)
}

Write-Host "All files fixed and updated successfully!"
