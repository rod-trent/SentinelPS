#Authenticate to AzureRM
Login-AzureRmAccount

#==============================================================
# Define environment variables
#==============================================================
  
    $SavePath  = "C:\SentinelTables"
    $FileDate    = Get-Date -Format "yyyy-MM-dd"
    $WorkspaceID = "xxxxx-xxxxx-xxxxx-xxxxx-xxxxxx"


# Change the TableName to the table you want to extract
    $TableName = "AzureActivity"
  
# Output to CSV
    $OutputCSV   = "$SavePath\$TableName-$FileDate.csv"
  
#Get the Table data from Log Analytics
        $TableResult = Invoke-AzureRmOperationalInsightsQuery -WorkspaceId $WorkspaceID -Query $TableName | select Results -ExpandProperty Results
        $TableResultCount = ($TableResult | Measure-Object).Count


        #Add to collection
        If ($TableResultCount -ge 1){
            foreach ($Result in $TableResult){
                $Result | Select * | Export-Csv $OutputCsv -NoTypeInformation -Append
            }
        }
  
