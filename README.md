POC for using Service Configuration Files in DDM for third party apps - https://developer.apple.com/documentation/devicemanagement/servicesconfigurationfiles

The domain is com.example.demoapp, the config file is demoapp.conf. 

Using a configuration 
{
  "Identifier": "org.example.demoapp.config",
  "Type": "com.apple.configuration.services.configuration-files",
  "Payload": {
    "ServiceType": "com.example.demoapp",
    "DataAssetReference": "org.example.demoapp.asset"
  }
}

Then using an asset
{
  "Identifier": "org.example.demoapp.asset",
  "Type": "com.apple.asset.data",
  "Payload": {
    "Reference": {
      "ContentType": "application/zip",
      "DataURL": "URL-to-hosted-zip",
      "Hash-SHA-256": "Long SHA256"
    }
  },
  "Authentication": {
    "Type": "None"
  }
}

POC Created by Codex
