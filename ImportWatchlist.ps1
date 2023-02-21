//PowerShell script to import a Microsoft Sentinel Watchlist

# Import the Azure module
Import-Module AzureRM

# Connect to your Azure account
Connect-AzureRmAccount

# Set the storage account name and container name
$storageAccountName = "<your-storage-account-name>"
$containerName = "<your-container-name>"

# Set the blob name and file path
$blobName = "<your-blob-name>.csv"
$filePath = "<your-file-path>.csv"

# Upload the file to the storage account
Set-AzureRmCurrentStorageAccount -ResourceGroupName "<your-resource-group-name>" -Name $storageAccountName
Set-AzureStorageBlobContent -Container $containerName -Blob $blobName -File $filePath

# Create a shared access signature URL for the blob
$sasToken = New-AzureStorageBlobSasToken -Container $containerName -Blob $blobName -Permission r -FullUri

# Add the watchlist to a workspace in Microsoft Sentinel
$workspaceName = "<your-workspace-name>"
$watchlistName = "<your-watchlist-name>"
$watchlistDescription = "<your-watchlist-description>"
$watchlistAlias = "<your-watchlist-alias>"

# Get the workspace
$workspace = Get-AzSentinelWorkspace -Name $workspaceName

# Add the watchlist to the workspace
Add-AzSentinelWatchlist -Workspace $workspace -Name $watchlistName -Description $watchlistDescription -Alias $watchlistAlias -SourceUri $sasToken.AccessUri
