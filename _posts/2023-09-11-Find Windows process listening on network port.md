---
title: Find Windows process listening on network port
tags: Windows Powershell Network
---

To find the Windows process listening on a certain port, open up a Powershell and type:
```
$PORT=22222
Get-Process -Id (Get-NetTCPConnection -LocalPort $PORT).OwningProcess
Get-Process -Id (Get-NetUDPConnection -LocalPort $PORT).OwningProcess
```
