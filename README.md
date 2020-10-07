# Sentinel PowerShell scripts

<i>Azure Sentinel-related PowerShell scripts</i>

<b>CreateSentinelExportRule.ps1</b> creates an export rule that automates the backup of Azure Sentinel tables. See: <a href="https://secureinfra.blog/2020/09/12/how-to-back-up-azure-sentinel-tables-to-blob-storage-using-powershell/">How to Automate the Backup of Azure Sentinel Tables to Blob Storage Using PowerShell</a>

<b>DeleteSentinelExportRule.ps1</b> deletes the export rule created by <i>CreateSentinelExportRule.ps1</i>. See: <a href="https://secureinfra.blog/2020/09/12/how-to-back-up-azure-sentinel-tables-to-blob-storage-using-powershell/">How to Automate the Backup of Azure Sentinel Tables to Blob Storage Using PowerShell</a>

<b>ExportEventstoCSV.ps1</b> exports security events from a server/PC to a CSV that can then be imported to the Log Analytics workspace as a custom log for Azure Sentinel. Details around this here:  <a href="https://secureinfra.blog/2020/05/08/exporting-events-from-disconnected-systems-to-ingest-into-azure-sentinel/">Exporting Events from Disconnected Systems to Ingest into Azure Sentinel</a>

<b>ExportSentinelTable.ps1</b> exports an entire Azure Sentinel table from Log Analytics and saves it locally in to a .csv file. The save path is: "C:\SentinelTables". The filename created is Tablename-date.csv. Modify the $TableName to the table you want to export. Modify the $WorkspaceID to include your own Log Analytics workspace ID. For details, see:  <a href="https://secureinfra.blog/2020/08/06/export-partial-or-complete-data-from-an-azure-sentinel-table/">Export and Backup Azure Sentinel Tables Using PowerShell</a>

<b>Get-LogicApp2JSON.ps1</b> requires the LogicAppTemplate module from the PowerShell gallery. Installation:  <i>PS> Install-Module -Name LogicAppTemplate</i>

<b>GetTalosIPfeed.ps1</b> retrieves the current Talos IP list and writes it to a text file named c:\feeds\Talos.txt. Can then be imported into Azure Sentinel as TI.

<b>ListExportRules.ps1</b> generates the list of export rules created by <i>CreateSentinelExportRule.ps1</i>. See: <a href="https://secureinfra.blog/2020/09/12/how-to-back-up-azure-sentinel-tables-to-blob-storage-using-powershell/">How to Automate the Backup of Azure Sentinel Tables to Blob Storage Using PowerShell</a> 

<b>SetMMASettings.ps1</b> Configures the MMA/Log Analtyics client for WorkSpaceID, WorksSpaceKey, and Proxy URL.

<b>TORExitNodeList.ps1</b> retrieves the current TOR Exit Node list and writes it to a text file named c:\feeds\TORExitNodeList.txt. Can then be imported into Azure Sentinel as TI.
