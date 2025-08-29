# push_advanced_robust.ps1
try {
    # 随机选择emoji
    $emoji = ":memo:", ":books:", ":rocket:", ":sparkles:", ":bulb:", ":zap:" | Get-Random
    $currentDate = Get-Date -Format "yyyy-MM-dd"
    $commitMessage = "$emoji Vocab update - $currentDate"

    # 执行Git操作
    git add . 2>&1 | Out-Null
    git commit -m $commitMessage 2>&1 | Out-Null
    git push origin main 2>&1 | Out-Null

    # 成功提示
    Write-Host "✅ $commitMessage" -ForegroundColor Green
    Write-Host "✅ Successfully pushed to GitHub!" -ForegroundColor Green
}
catch {
    Write-Host "❌ Error occurred: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host "💡 Check your git status and connection." -ForegroundColor Yellow
}
pause # 按任意键关闭窗口