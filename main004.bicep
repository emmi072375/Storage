targetScope = 'subscription'

param myResourceGroup string = 'ZellyTestProd-rg'
param location string = 'eastus'

@description('Storage Account type')
@allowed([
  'Premium_LRS'
  'Premium_ZRS'
  'Standard_GRS'
  'Standard_GZRS'
  'Standard_LRS'
  'Standard_RAGRS'
  'Standard_RAGZRS'
  'Standard_ZRS'
])
param storageAccountType string = 'Standard_LRS'

@description('The name of the Storage Account')
param storageAccountName string = 'mystoragetestprod01'



//Create Resource Group 

resource myRG01 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: myResourceGroup
  location: location
}


module myStorage004 'storage.bicep' = {
  name: 'myStorage004Deploy'
  scope: myRG01
  params: {
    
    location: location
    storageAccountName: storageAccountName
    storageAccountType: storageAccountType
  }
}
