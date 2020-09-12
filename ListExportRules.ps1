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


#==============================================================
# Get the list of existing Export Rules
#==============================================================
  
az monitor log-analytics workspace data-export list --resource-group $ResourceGroup --workspace-name $WorkspaceName
