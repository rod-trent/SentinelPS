# PowerShell script that connects to Microsoft Sentinel and displays only the enabled Microsoft Sentinel Analytics Rules
# Replace <TenantId> and <SubscriptionId> with your actual values.

# Connect to Microsoft Sentinel
Connect-AzSentinel -TenantId <TenantId> -SubscriptionId <SubscriptionId>

# Get all analytics rules
$rules = Get-AzSentinelAnalyticsRule

# Filter only enabled rules
$enabledRules = $rules | Where-Object { $_.Enabled -eq $true }

# Display only the enabled rules
$enabledRules | Select-Object DisplayName, Description, Enabled
