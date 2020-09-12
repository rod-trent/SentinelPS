#==============================================================
# Make the Connection
#==============================================================
# Authenticate to AzureRM
Login-AzureRmAccount

#==============================================================
# Define environment variables
#==============================================================
  
# Fill in the Resource Group the Azure Sentinel instance exists in
	$ResourceGroup = "6MDMAzureSentinel"

    
# Fill in your Log Analytics workspace name of your Azure Sentinel instance
	$WorkspaceName = "6mdmazuresentinele"


#==============================================================
# Get the list of existing Export Rules
#==============================================================
  
az monitor log-analytics workspace data-export list --resource-group $ResourceGroup --workspace-name $WorkspaceName