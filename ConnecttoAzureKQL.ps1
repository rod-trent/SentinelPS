//Another way to run KQL against Azure

# Connect to Azure
Connect-AzAccount

# Define the KQL query
$query = "Resources | where type =~ 'Microsoft.Compute/virtualMachines' | project name, location, type"

# Run the query
$results = Search-AzGraph -Query $query

# Display the results
$results | Select-Object -Property name, location, type
