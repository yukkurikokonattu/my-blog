# cleanup-content.ps1
Write-Host "Cleaning up old posts..."

# Delete posts
Get-ChildItem -Path . -Filter post*.html | Where-Object { $_.Name -ne "post_template.html" } | Remove-Item -Force
# Delete news
Get-ChildItem -Path . -Filter news*.html | Where-Object { $_.Name -ne "news_template.html" } | Remove-Item -Force

Write-Host "Updating index files..."
powershell -ExecutionPolicy Bypass -File .\update-blog-index.ps1

Write-Host "Cleanup completed."
