//Displays all Microsoft Sentinel Watchlists

# Connect to Azure Sentinel
Connect-AzAccount
$workspace = Get-AzSentinelWorkspace -Name <workspace name>

# Get all watchlists
$watchlists = Get-AzSentinelWatchlist -Workspace $workspace

# Display all watchlists
$watchlists | Select-Object -Property Name, Description, Alias, Type, SearchKey, CreatedOn, ModifiedOn
