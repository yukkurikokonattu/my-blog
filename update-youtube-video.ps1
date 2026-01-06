# update-youtube-video.ps1
$channelId = "UC9LpqPFPOh650jI6mO9Z2Xg"
$indexPath = "index.html"

Write-Host "Fetching latest video info via RSS..."

try {
    $rssUrl = "https://www.youtube.com/feeds/videos.xml?channel_id=$channelId"
    # Use Invoke-WebRequest for more control over raw content
    $response = Invoke-WebRequest -Uri $rssUrl -UseBasicParsing
    [xml]$xml = $response.Content

    # Navigate the XML structure
    # Namespaces might be needed for some RSS feeds, but YouTube RSS usually works directly or via GetElementsByTagName
    $latestEntry = $xml.feed.entry[0]
    if ($null -eq $latestEntry) {
        Write-Error "No entries found in RSS."
        exit 1
    }

    $latestVideoId = $latestEntry.videoId
    if ([string]::IsNullOrEmpty($latestVideoId)) {
        # Try alternate way if the property isn't directly mapped
        $latestVideoId = $xml.GetElementsByTagName("yt:videoId")[0].'#text'
    }

    Write-Host "Latest Video ID: $latestVideoId"

    if (Test-Path $indexPath) {
        $content = [System.IO.File]::ReadAllText((Resolve-Path $indexPath), [System.Text.Encoding]::UTF8)
        # Match youtube.com/embed/VIDEO_ID or youtube.com/embed/ANYTHING
        $newContent = $content -replace 'youtube\.com/embed/[a-zA-Z0-9_-]+', "youtube.com/embed/$latestVideoId"
        [System.IO.File]::WriteAllText((Resolve-Path $indexPath), $newContent, [System.Text.Encoding]::UTF8)
        Write-Host "index.html updated successfully."
    }
    else {
        Write-Error "$indexPath not found."
        exit 1
    }
}
catch {
    Write-Error "An error occurred: $_"
    exit 1
}

Write-Host "YouTube update completed."
exit 0
