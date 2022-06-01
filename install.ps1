$regPath = 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CLSID\{645FF040-5081-101B-9F08-00AA002F954E}\DefaultIcon'
$iconpath = "C:\Windows"
$iconFolderName = "CatTrash"

Copy-Item -Path "$PSScriptRoot\$iconFolderName\" -Destination $iconpath -Force -Recurse

# Сохраняем старое значение
$defaultOpenPath = (Get-ItemProperty -Path $regPath `
    -Name empty).empty
$defaultClosedPath = (Get-ItemProperty -Path $regPath `
    -Name full).full

# Присваиваем новое
Set-ItemProperty -Path $regPath `
    -Name empty -Value "$iconpath\$iconFolderName\Pop_cat_open.ico, 0"
Set-ItemProperty -Path $regPath `
    -Name full -Value "$iconpath\$iconFolderName\Pop_cat_closed.ico, 0"

# Создание uninstall файла
$script = 
"Remove-Item -Path '$iconpath\CatTrash'

Set-ItemProperty -Path '$regPath' ``
    -Name empty -Value '$defaultOpenPath'
Set-ItemProperty -Path '$regPath' ``
    -Name full -Value '$defaultClosedPath'
" + '
Remove-Item -Path $MyInvocation.MyCommand.Source ' 
New-Item -Path $PSScriptRoot -Name "uninstall.ps1" -ItemType "file" -Value $script -Force
