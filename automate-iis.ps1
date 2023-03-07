#!/bin/bash
Install-WindowsFeature -Name Web-Server
Set-Content -Path "C:\inetpub\wwwroot\Default.htm" -Value "$($env:computername)"
