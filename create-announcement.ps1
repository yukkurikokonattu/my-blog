# create-announcement.ps1
param (
    [string]$title = ""
)

# Set console encoding to UTF-8 to handle Japanese characters correctly
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
[Console]::InputEncoding = [System.Text.Encoding]::UTF8

if ($title -eq "") {
    $title = Read-Host "お知らせのタイトルを入力してください"
}

if ($title -eq "") {
    Write-Error "タイトルが入力されていません。終了します。"
    exit
}

# 1. Generate unique filename (news_YYYYMMDD_HHmm.html)
$dateStrForFile = Get-Date -Format "yyyyMMdd_HHmm"
$nextFile = "news_$dateStrForFile.html"

# 2. Check template
$templatePath = "news_template.html"
if (-not (Test-Path $templatePath)) {
    Write-Error "$templatePath が見つかりません。"
    exit
}

# 3. Copy template
Copy-Item $templatePath $nextFile

# 4. Replace content
$content = Get-Content $nextFile -Encoding UTF8
$content = $content -replace "記事タイトル", $title
$content = $content -replace "<title>お知らせ - タイトル</title>", "<title>お知らせ - $title</title>"
$content | Set-Content $nextFile -Encoding UTF8

# 5. Update index
Write-Host "記事を作成しました: $nextFile"
Write-Host "インデックスを更新しています..."
& .\update-blog-index.ps1
if ($LASTEXITCODE -ne 0) {
    Write-Warning "インデックスの更新でエラーが発生した可能性があります。"
}

Write-Host "----------------------------------------"
Write-Host "完了！"
Write-Host "作成されたファイル: $nextFile"
Write-Host "内容を編集してから、publish_site.bat で公開してください。"
Write-Host "----------------------------------------"
