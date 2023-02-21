# This script exports all the analytics rules from your Microsoft Sentinel workspace to a JSON file named Azure_Sentinel_analytic_rules.json. You need to replace the placeholders <tenantId>, <subscriptionId>, and <workspaceId> with your actual values.

# Import the Azure Sentinel module
Import-Module AzureSentinel

# Connect to your Azure Sentinel workspace
Connect-AzSentinel -TenantId <tenantId> -SubscriptionId <subscriptionId> -WorkspaceId <workspaceId>

# Get the analytics rules from the workspace
$rules = Get-AzSentinelAnalyticsRule -WorkspaceId <workspaceId>

# Export the rules to a JSON file
$rules | ConvertTo-Json | Out-File "Azure_Sentinel_analytic_rules.json"
