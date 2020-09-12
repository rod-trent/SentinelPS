#==============================================================
# Make the Connection
#==============================================================
# Authenticate to AzureRM
Login-AzureRmAccount

#==============================================================
# Define environment variables
#==============================================================
  
# Fill in the Resource Group the Azure Sentinel instance exists in
	$ResourceGroup = "YourResourceGroup"

    
# Fill in your Log Analytics workspace name of your Azure Sentinel instance
	$WorkspaceName = "YourName"


# Fill in the table name you want to export
	$TableName = "YourTable"

# Name your new export rule
	$ExportRule = "YourExportRuleName"

# Fill in the destination of the export (full path to your storage blob)
	$ExportDestination = "YourDestinationPath"	

#==============================================================
# Create the Export Rule
#==============================================================
  
az monitor log-analytics workspace data-export create -g $ResourceGroup --workspace-name $WorkspaceName -n $ExportRule --destination $ExportDestination --enable -t $TableName  