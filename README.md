# Learning
* To include module in path `$env:PSModulePath = $env:PSModulePath + ";C:\Experiments\modules\Module-Folder-Name"`
* To check module path is included `$env:PSModulePath -split ';'`
* To check module is listed `Get-Module -ListAvailable`
* Simple tutorial for powershell modules `https://powershellexplained.com/2017-05-27-Powershell-module-building-basics/`
* To list all IIS features `Get-WindowsFeature *Web*`
* After the script completes the IIS features will be installed the default application pools are removed, the default website is deleted, and the default log directory has been changed to the E: drive. https://github.com/aqilzeeshan/pw_modules/blob/main/iis_fresh_start.ps1
