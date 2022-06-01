# CatTrash
Запускаем PowerShell 7 от имени администратора, выполняем скрипт install.ps1

![image](https://user-images.githubusercontent.com/12447382/171308675-3ace5252-b5b3-4847-b292-3bff4a58d3d8.png)

Если возникла ошибка вида
![image](https://user-images.githubusercontent.com/12447382/171308847-28f4b133-fb21-4b03-b547-71c2f5fcdda1.png)

Используем 

<code>Set-ExecutionPolicy Bypass</code>

Не рекомендутся оставлять так, после выполнения скриптов 

<codeSet-ExecutionPolicy Restricted</code>

После появляется скрипт uninstall, который возвращает все на круги своя.
