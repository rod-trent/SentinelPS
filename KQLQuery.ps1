

$vulnUrl = '{ "query": "DeviceTvmSoftwareVulnerabilities | join (DeviceTvmSoftwareVulnerabilitiesKB) on CveId | where IsExploitable == 1 | count" }'
$vulnUrlUri = "https://graph.microsoft.com/beta/security/runHuntingQuery"
$vulnResponse = Invoke-WebRequest -Method Post -Uri $vulnUrlUri -Body $vulnUrl -Headers $headers -ErrorAction Stop
