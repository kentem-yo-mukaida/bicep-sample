param cosmosName string = '${resourceGroup().location}-cosmos'
param siteName string = '${resourceGroup().location}-site'
param planName string  = '${siteName}-plan'
param planSku string = 'F1'
param location string = resourceGroup().location

// Cosmos DB アカウント（Core SQL）を作成
resource cosmosDbAccount 'Microsoft.DocumentDB/databaseAccounts@2022-05-15' = {
  name: toLower(cosmosName)
  location: location
  properties: {
    enableFreeTier: true
    databaseAccountOfferType: 'Standard'
    consistencyPolicy: {
      defaultConsistencyLevel: 'Session'
    }
    locations: [
      {
        locationName: location
      }
    ]
  }
}
