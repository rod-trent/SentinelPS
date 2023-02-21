# Exports a Microsoft Sentinel Watchlist

# This script uses the Connect-AzSentinel cmdlet to connect to the Microsoft Sentinel workspace, the Get-AzSentinelWatchlist cmdlet to get the watchlist, and the Export-Csv cmdlet to export the watchlist to a CSV file. Replace <tenantId>, <subscriptionId>, <workspaceId>, <watchlistName>, and <filePath> with the appropriate values for your environment.

# Connect to the Microsoft Sentinel workspace
Connect-AzSentinel -TenantId <tenantId> -SubscriptionId <subscriptionId> -WorkspaceId <workspaceId>

# Get the watchlist
$watchlist = Get-AzSentinelWatchlist -Name <watchlistName>

# Export the watchlist to a CSV file
$watchlist | Export-Csv -Path <filePath>.csv -NoTypeInformation
