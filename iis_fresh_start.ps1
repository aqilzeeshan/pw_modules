$IISFeatures = "Web-WebServer","Web-Common-Http","Web-Default-Doc","Web-Dir-Browsing","Web-Http-Errors","Web-Static-Content","Web-Http-Redirect","Web-Health","Web-Http-Logging","Web-Custom-Logging","Web-Log-Libraries","Web-ODBC-Logging","Web-Request-Monitor","Web-Http-Tracing","Web-Performance","Web-Stat-Compression","Web-Security","Web-Filtering","Web-Basic-Auth","Web-Client-Auth","Web-Digest-Auth","Web-Cert-Auth","Web-IP-Security","Web-Windows-Auth","Web-App-Dev","Web-Net-Ext","Web-Net-Ext45","Web-Asp-Net","Web-Asp-Net45","Web-ISAPI-Ext","Web-ISAPI-Filter","Web-Mgmt-Tools","Web-Mgmt-Console"
Install-WindowsFeature -Name $IISFeatures
 
Remove-Website -Name "Default Web Site"
$defaultAppPools = @(".NET v2.0",".NET v2.0 Classic",".NET v4.5",".NET v4.5 Classic","Classic .NET AppPool","DefaultAppPool")
Foreach ($defaultAppPool in $defaultAppPools){
    IF (Test-path "IIS:\AppPools\$defaultAppPool"){Remove-WebAppPool -name $DefaultAppPool}
}
 
$NewFolders = "inetpub", "inetpub\apps", "logs"
$NewFolders | ForEach-Object {New-Item E:\$_ -type directory}
 
Import-Module WebAdministration
Set-WebConfigurationProperty "/system.applicationHost/sites/siteDefaults" -name logfile.directory -value E:\logs
