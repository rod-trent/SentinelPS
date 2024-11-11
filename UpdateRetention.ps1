# Update retention for all tables in a Log Analytics Workspace

Install-Module -Name Az -AllowClobber -Force

Connect-AzAccount
``### PowerShell Script:

# Define variables
$resourceGroupName = "YourResourceGroupName"
$workspaceName = "YourLogAnalyticsWorkspaceName"
$newRetentionInDays = 365  # Set the desired retention period in days

# Get the Log Analytics Workspace
$workspace = Get-AzOperationalInsightsWorkspace -ResourceGroupName $resourceGroupName -Name $workspaceName

# Get all tables in the Log Analytics Workspace
$tables = Get-AzOperationalInsightsTable -ResourceGroupName $resourceGroupName -WorkspaceName $workspaceName

# Update retention for each table
foreach ($table in $tables) {
    Write-Host "Updating retention for table: $($table.Name)"
    Set-AzOperationalInsightsTable -ResourceGroupName $resourceGroupName -WorkspaceName $workspaceName -Name $table.Name -RetentionInDays $newRetentionInDays
    Write-Host "Retention updated to $newRetentionInDays days for table: $($table.Name)"
}

Write-Host "Retention update completed for all tables."
