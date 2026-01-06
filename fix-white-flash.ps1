# fix-white-flash.ps1
$files = Get-ChildItem "post*.html", "news*.html" | Where-Object { $_.Name -notmatch "_template.html$" }

foreach ($file in $files) {
    Write-Host "Updating $($file.Name)..."
    $content = Get-Content $file.FullName -Raw -Encoding UTF8
    
    # 1. Inject inline script into head
    if ($content -notmatch 'Inline script to prevent FOUC') {
        $inlineScript = @"
    <script>
        (function() {
            const savedTheme = localStorage.getItem('theme') || 'dark';
            document.documentElement.setAttribute('data-theme', savedTheme);
        })();
    </script>
</head>
"@
        $content = $content -replace '</head>', $inlineScript
    }

    # 2. Update Theme logic block
    $newThemeLogic = @"
        // Theme logic
        const themeToggle = document.getElementById('theme-toggle');
        const themeIcon = document.getElementById('theme-icon');
        const root = document.documentElement;

        function updateThemeUI(theme) {
            themeIcon.textContent = theme === 'dark' ? '🌙' : '☀️';
        }

        updateThemeUI(root.getAttribute('data-theme'));

        themeToggle.addEventListener('click', () => {
            const currentTheme = root.getAttribute('data-theme');
            const newTheme = currentTheme === 'dark' ? 'light' : 'dark';
            root.setAttribute('data-theme', newTheme);
            localStorage.setItem('theme', newTheme);
            updateThemeUI(newTheme);
        });
"@
    # Regex to find the old theme logic block and replace it
    $pattern = '(?s)// Theme logic.*?themeIcon\.textContent = newTheme === ''dark'' \? ''🌙'' : ''☀️'';\s*\}\);'
    $content = $content -replace $pattern, $newThemeLogic

    $content | Set-Content $file.FullName -Encoding UTF8
}
Write-Host "Batch update complete."
