#Schedule it using this: PowerShell.exe -ExecutionPolicy ByPass -File eventexport.ps1

Set-Variable -Name EventAge -Value 1     #Sets the number of days that will be exported
Set-Variable -Name ServerNames -Value @("Server1", "Server2", "Server3", "Server4")   #Replace with your own Server name or names
Set-Variable -Name Logs -Value @("Application", "System", "Security")  # Checking app, system, and security logs - only use what you want/need
Set-Variable -Name TypesofEvents -Value @("Error", "Warning")  # Loading only Errors and Warnings
Set-Variable -Name ExportFolder -Value "C:\TEMP\"


$exportlog_c = @()   #consolidated error log
$now=get-date
$startdate=$now.adddays(-$EventAge)
$ExportFile=$ExportFolder + "exportlog" + $now.ToString("yyyy-MM-dd---hh-mm-ss") + ".csv"  

foreach($comp in $ServerNames)
{
 foreach($log in $Logs)
 {
  Write-Host Processing $comp\$log
 $exportlog = get-eventlog -ComputerName $comp -log $log -After $startdate -EntryType $TypesofEvents
 $exportlog_c += $exportlog  #consolidating
  }
}
$explortlog_sorted = $explortlog_c | Sort-Object TimeGenerated    
Write-Host Exporting to $ExportFile
$explortlog_sorted|Select EntryType, TimeGenerated, Source, EventID, MachineName | Export-CSV $ExportFile -NoTypeInfo 
Write-Host Done!
