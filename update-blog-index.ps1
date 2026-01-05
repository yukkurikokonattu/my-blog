# update-blog-index.ps1

$jsPath = "blog-posts.js"
$existingDates = @{}

# 1. Read existing dates
if (Test-Path $jsPath) {
    $content = Get-Content $jsPath -Raw -Encoding UTF8
    if ($null -ne $content) {
        $matches = [regex]::Matches($content, 'url:\s*"([^"]+)",\s*date:\s*"([^"]+)"')
        foreach ($m in $matches) {
            $u = $m.Groups[1].Value
            $d = $m.Groups[2].Value
            if (-not $existingDates.ContainsKey($u)) {
                $existingDates[$u] = $d
            }
        }
    }
}

# 2. Scan HTML files
$posts = @()
$files = Get-ChildItem "post*.html" | Sort-Object Name -Descending

foreach ($file in $files) {
    if ($file.Name -eq "post_template.html") { continue }

    $title = "Untitled"
    $c = Get-Content $file.FullName -Raw -Encoding UTF8
    if ($c -match '<title>(.*?)</title>') {
        $title = $Matches[1] -replace "ブログ記事\s*-\s*", ""
    }

    $dateStr = ""
    if ($existingDates.ContainsKey($file.Name)) {
        $dateStr = $existingDates[$file.Name]
    }
    else {
        $dateStr = $file.CreationTime.ToString("yy/MM/dd/HH:mm")
    }

    $posts += [PSCustomObject]@{
        title = $title
        url   = $file.Name
        date  = $dateStr
    }
}

# 3. Write JS file
$jsOutput = "const blogPosts = [`n"
foreach ($p in $posts) {
    $jsOutput += "    {`n"
    $jsOutput += "        title: `"$($p.title)`",`n"
    $jsOutput += "        url: `"$($p.url)`",`n"
    $jsOutput += "        date: `"$($p.date)`"`n"
    $jsOutput += "    },"
    $jsOutput += "`n"
}
$jsOutput += "];`n`n"
$jsOutput += "// Added by update-blog-index.ps1`n"
$jsOutput += "window.blogPosts = blogPosts;`n"

$jsOutput | Set-Content $jsPath -Encoding UTF8

Write-Host "Done. Updated blog-posts.js with $($posts.Count) posts."
