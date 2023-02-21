# Use a KQL query against a Log Analtyics workspace

# Set the workspace ID and primary key
$workspaceId = "<your workspace ID>"
$primaryKey = "<your primary key>"

# Set the KQL query to execute
$query = @"
    // Example query
    Heartbeat
    | summarize count() by Computer
"@

# Construct the API URI
$apiUri = "https://api.loganalytics.io/v1/workspaces/$workspaceId/query"

# Encode the query as a JSON string
$queryJson = @{
    query = $query
} | ConvertTo-Json

# Set the headers for the API call
$headers = @{
    "Authorization" = "SharedKey $workspaceId:$primaryKey"
    "Content-Type"  = "application/json"
}

# Make the API call and retrieve the response
$response = Invoke-RestMethod -Uri $apiUri -Headers $headers -Method Post -Body $queryJson

# Output the response
$response
