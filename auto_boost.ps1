while ($true) {
    while ($true) {
        Write-Host "正在刷新适配器..."
        ipconfig.exe /release
        ipconfig.exe /renew
        Start-Sleep -Seconds 3

        & "C:\Users\admin\anaconda3\python.exe" "C:\Users\admin\Documents\proj\python\DLUT_auto_login\dlut_autologin.py" -u -p 
        if ($?) {
            break
        }
        Write-Host "登录失败。30秒后再次进行尝试……" -ForegroundColor Red
        Start-Sleep -Seconds 30
    }

    while (Test-Connection -TargetName www.baidu.com, www.bilibili.com, www.bing.com -IPv4) {
        Write-Host (Get-Date).ToString(): "网络已连接，10分钟后再次检测。" -ForegroundColor Green
        Start-Sleep -Duration (New-TimeSpan -Minutes 10)
    }

    Write-Host (Get-Date).ToString(): "网络断开。正在重新连接……" -ForegroundColor Red
}