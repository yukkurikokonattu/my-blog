# update-blog-index.ps1

function Update-Index {
    param (
        [string]$FilePattern,
        [string]$JsPath,
        [string]$JsArrayName,
        [string]$TitlePrefixToRemove
    )

    $existingDates = @{}

    # 1. Read existing dates from JS file
    if (Test-Path $JsPath) {
        $content = Get-Content $JsPath -Raw -Encoding UTF8
        if ($null -ne $content) {
            $regexMatches = [regex]::Matches($content, 'url:\s*"([^"]+)",\s*date:\s*"([^"]+)"')
            foreach ($m in $regexMatches) {
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
    $files = Get-ChildItem $FilePattern | Sort-Object Name -Descending

    foreach ($file in $files) {
        if ($file.Name -match "_template.html$") { continue }

        $title = "Untitled"
        $c = Get-Content $file.FullName -Raw -Encoding UTF8
        if ($c -match '<title>(.*?)</title>') {
            $title = $Matches[1]
            if (-not [string]::IsNullOrEmpty($TitlePrefixToRemove)) {
                $title = $title -replace $TitlePrefixToRemove, ""
            }
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
    $jsOutput = "const $JsArrayName = [`n"
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
    $jsOutput += "window.$JsArrayName = $JsArrayName;`n"

    $jsOutput | Set-Content $JsPath -Encoding UTF8
    Write-Host "Updated $JsPath with $($posts.Count) items."
}

# Update Blogs
Update-Index -FilePattern "post*.html" `
    -JsPath "blog-posts.js" `
    -JsArrayName "blogPosts" `
    -TitlePrefixToRemove "ブログ記事\s*-\s*"

# Update Announcements
Update-Index -FilePattern "news*.html" `
    -JsPath "announcements.js" `
    -JsArrayName "announcements" `
    -TitlePrefixToRemove "お知らせ\s*-\s*"

Write-Host "All updates complete."
