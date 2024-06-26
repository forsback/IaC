
param landingZone object = loadYamlContent('bicep-variables.yml') // Generated by yq converter (YAML-> JSON)

param location string = resourceGroup().location
param subnetArray array = landingZone.subnets
param vnetPrefixes array = landingZone.vnet.addressPrefixes
param vnetName string = landingZone.vnet.name

// Used network module from https://github.com/Azure/ResourceModules
module vnet 'virtualNetworks/deploy.bicep' = {
  name: vnetName
  params: {
    addressPrefixes: vnetPrefixes
    name: vnetName
    subnets:subnetArray
    location: location
  }
}
