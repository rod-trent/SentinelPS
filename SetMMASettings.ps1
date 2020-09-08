# Parameters for Log Analytics Workspace
$WorkspaceID = "xxxxxxxxxxxxxxxxx"
$WorkspaceKey = "yyyyyyyyyyyyyyyyyy"
$ProxyURL = "http://proxy.yxxxxxxx.local:3128"

# Load agent scripting object
$AgentCfg = New-Object -ComObject AgentConfigManager.MgmtSvcCfg
  
# Add LA Workspace
$AgentCfg.AddCloudWorkspace($WorkspaceID,$WorkspaceKey)

# Set a proxy for the LA Agent
$AgentCfg.SetProxyUrl($ProxyURL)  
