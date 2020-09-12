#==============================================================
# Make the Connection
#==============================================================
# Authenticate to AzureRM
Login-AzureRmAccount

#==============================================================
# Define environment variables
#==============================================================
  
# Fill in the Resource Group the Azure Sentinel instance exists in
	$ResourceGroup = "YourResourceGroupName"

    
# Fill in your Log Analytics workspace name of your Azure Sentinel instance
	$WorkspaceName = "YourWorkspaceName"


# The Name of your Export Rule
	$ExportRule = "YourExportRuleName"

#==============================================================
# Delete the Export Rule
#==============================================================
  
az monitor log-analytics workspace data-export delete --name $ExportRule --resource-group $ResourceGroup --workspace-name $WorkspaceName