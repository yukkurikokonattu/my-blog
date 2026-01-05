# create-post.ps1
# 実行例: .\create-post.ps1 -title "新しい記事のタイトル"

param (
    [string]$title = ""
)

if ($title -eq "") {
    $title = Read-Host "記事のタイトルを入力してください"
}

if ($title -eq "") {
    Write-Error "タイトルが入力されていません。終了します。"
    exit
}

# 1. 次の記事番号を探す
$posts = Get-ChildItem "post*.html" | Where-Object { $_.Name -match "post(\d+)\.html" }
$maxNum = 0
foreach ($p in $posts) {
    if ($p.Name -match "post(\d+)\.html") {
        $num = [int]$Matches[1]
        if ($num -gt $maxNum) { $maxNum = $num }
    }
}
$nextNum = $maxNum + 1
$nextFile = "post$nextNum.html"

# 2. テンプレートをコピー (post_template.html を使用)
$templatePath = "post_template.html"
if (-not (Test-Path $templatePath)) {
    Write-Error "$templatePath が見つかりません。"
    exit
}

Copy-Item $templatePath $nextFile

# 3. タイトルを置換
(Get-Content $nextFile -Encoding UTF8) -replace "タイトル", $title -replace "記事タイトル", $title | Set-Content $nextFile -Encoding UTF8

# 4. blog-posts.js に追記
$jsPath = "blog-posts.js"
$dateStr = Get-Date -Format "yy/MM/dd/HH:mm"
$newEntry = "    {`n        title: `"$title`",`n        url: `"$nextFile`",`n        date: `"$dateStr`"`n    },"

$jsContent = Get-Content $jsPath -Raw -Encoding UTF8
$jsContent = $jsContent -replace "const blogPosts = \[", "const blogPosts = [`n$newEntry"
$jsContent | Set-Content $jsPath -Encoding UTF8

Write-Host "----------------------------------------"
Write-Host "成功しました！"
Write-Host "作成されたファイル: $nextFile"
Write-Host "タイトル: $title"
Write-Host "blog-posts.js を更新しました。"
Write-Host "----------------------------------------"

