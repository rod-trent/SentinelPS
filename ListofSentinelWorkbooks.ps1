//Export a list of Microsoft Sentinel Workbooks
//This script connects to Microsoft Sentinel using the Connect-AzSentinel cmdlet and retrieves a list of all workbooks using the Get-AzSentinelWorkbook cmdlet. The list of workbooks is then exported to a CSV file using the Export-Csv cmdlet.

//You can run this script in the Azure Cloud Shell or in a local PowerShell environment with the Azure Sentinel module installed.

# Connect to Microsoft Sentinel
Connect-AzSentinel

# Get a list of all workbooks
$Workbooks = Get-AzSentinelWorkbook

# Export the list of workbooks to a CSV file
$Workbooks | Export-Csv -Path "C:\Workbooks.csv" -NoTypeInformation
