# Sentinel PowerShell scripts

<i>Azure Sentinel-related PowerShell scripts</i>

<b>ExportEventstoCSV.ps1</b> exports security events from a server/PC to a CSV that can then be imported to the Log Analytics workspace as a custom log for Azure Sentinel. Details around this here:  https://secureinfra.blog/2020/05/08/exporting-events-from-disconnected-systems-to-ingest-into-azure-sentinel/

<b>ExportSentinelTable.ps1</b> exports an entire Azure Sentinel table from Log Analytics and saves it locally in to a .csv file. The save path is: "C:\SentinelTables". The filename created is Tablename-date.csv. Modify the $TableName to the table you want to export. Modify the $WorkspaceID to include your own Log Analytics workspace ID. For details, see:  https://secureinfra.blog/2020/08/06/export-partial-or-complete-data-from-an-azure-sentinel-table/

<b>Get-LogicApp2JSON.ps1</b> requires the LogicAppTemplate module from the PowerShell gallery. Installation:  <i>PS> Install-Module -Name LogicAppTemplate</i>

<b>SetMMASettings.ps1</b> Configures the MMA/Log Analtyics client for WorkSpaceID, WorksSpaceKey, and Proxy URL.
