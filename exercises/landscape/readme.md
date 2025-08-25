BTP XP264 master landscape
=============


TODO: Add the pictture of the master btp landscape...  





## s4hana HE4 destinations definitions  

  * http://s4hana.tdc.sap.com:50080/sap/opu/odata/sap/api_business_partner/?sap-client=400

<img width="1216" height="1028" alt="image" src="https://github.com/user-attachments/assets/b442c666-8bb5-4ad5-a193-7eb98c1daafa" />

### Rehearse the destination definition  

In order to be able to rehearse subaccount level destinations without writing any code all we need is managed SAP Approuter in the context of the subacount.  

The managed SAP Approuter is brought into the context of a subaccount with the SAP Workzone (Launchpad) service plans free or standard.  

SAP Workzone subacription requires the OIDC subaccount trust be established.  This means, you will need a user with the OIDC provider the subaccount has been trusted with.


  * https://btp-bootstrap-quovadis-fe2eef75.launchpad.cfapps.eu10.hana.ondemand.com/dynamic_dest/destination-service/destinations/QUOVADIS_HE4  
<img width="1195" height="455" alt="image" src="https://github.com/user-attachments/assets/641e42b8-887f-4235-81e3-695ce80413f8" />


```
{
  "owner": {
    "SubaccountId": "6a7fc37b-a1c4-49f7-989a-92c496bd891a",
    "InstanceId": null
  },
  "destinationConfiguration": {
    "KeyStorePassword": "Password1",
    "tokenServiceURLType": "Dedicated",
    "audience": "HE4_400_GCP",
    "Description": "QUOVADIS_HE4-api_business_partner",
    "authnContextClassRef": "urn:oasis:names:tc:SAML:2.0:ac:classes:PreviousSession",
    "tokenServiceUser": "QUOVADIS",
    "tokenServiceURL": "http://s4hana.tdc.sap.com:50081/sap/bc/sec/oauth2/token?sap-client=400",
    "sap-client": "400",
    "URL": "http://s4hana.tdc.sap.com:50081/sap/opu/odata/sap/api_business_partner",
    "Name": "QUOVADIS_HE4",
    "tokenServicePassword": "<QUOVADIS client password>",
    "assertionRecipient": "https://s4hana.tdc.sap.com:50081/sap/bc/sec/oauth2/token?sap-client=400",
    "Type": "HTTP",
    "HTML5.DynamicDestination": "true",
    "KeyStoreLocation": "quovadis_ateam-isveng.p12",
    "clientKey": "QUOVADIS",
    "Authentication": "OAuth2SAMLBearerAssertion",
    "nameIdFormat": "urn:oasis:names:tc:SAML:1.1:nameid-format:unspecified",
    "CloudConnectorLocationId": "he4",
    "SystemUser": "XP264",
    "ProxyType": "OnPremise"
  },
  "certificates": [
    {
      "Content": "MIIQeAIBAzCCEDIGCSqGSIb3DQEHAaCCECMEghAfMIIQGzCCCggGCSqGSIb3DQEHAaCCCfkEggn1MIIJ8TCCCe0GCyqGSIb3DQEMCgECoIIJeHcO5xW0ai3ZkwPTAhMAkGBSsOAwIaBQAEFMyS26dKft/dWRSIVg/SQvDnQmaSBBQTST14Lse+rKA3igKg4Q7gzIB0mAICBAA=",
      "Name": "quovadis_ateam-isveng.p12",
      "Type": "CERTIFICATE"
    }
  ],
  "authTokens": [
    {
      "type": "Bearer",
      "value": "GwmDlnqcH9CggrRYHJfc3I9TZgQ76rrgi2EdPYq-5OUyP3Vr",
      "http_header": {
        "key": "Authorization",
        "value": "Bearer GwmDlnqcH9CggrRYHJfc3I9TZgQ76rrgi2EdPYq-5OUyP3Vr"
      },
      "expires_in": "3600",
      "scope": "/IWFND/SG_MED_CATALOG_0001 /IWFND/SG_MED_CATALOG_0002 PYC_CFG_SRV_0001 PYC_CONF_SRV_0001 SAP_BW_INA_GETSERVERINFO_HTTP SAP_BW_INA_SRV_0001 ZAPI_BUSINESS_PARTNER_0001 ZAPI_SALES_ORDER_SRV_0001 ZMD_BUSINESSPARTNER_SRV_0001",
      "refresh_token": "GwmDlnqcH9CggrRYHJf83CREbIGGtARzGgkqNOuVc9n29LIV"
    }
  ]
}
```

### Run the destination against the target on premise system

  * https://btp-bootstrap-quovadis-fe2eef75.launchpad.cfapps.eu10.hana.ondemand.com/dynamic_dest/QUOVADIS_HE4/  
  * https://btp-bootstrap-quovadis-fe2eef75.launchpad.cfapps.eu10.hana.ondemand.com/dynamic_dest/QUOVADIS_HE4/?$format=json

  ```
  {
  "d": {
    "EntitySets": [
      "A_AddressEmailAddress",
      "A_AddressFaxNumber",
      "A_AddressHomePageURL",
      "A_AddressPhoneNumber",
      "A_BPAddrDepdntIntlLocNumber",
      "A_BPContactToAddress",
      "A_BPContactToFuncAndDept",
      "A_BPCreditWorthiness",
      "A_BPDataController",
      "A_BPEmployment",
      "A_BPFinancialServicesExtn",
      "A_BPFinancialServicesReporting",
      "A_BPFiscalYearInformation",
      "A_BPIntlAddressVersion",
      "A_BPRelationship",
      "A_BPTaxCompliance",
      "A_BuPaAddressUsage",
      "A_BuPaIdentification",
      "A_BuPaIndustry",
      "A_BusinessPartner",
      "A_BusinessPartnerAddress",
      "A_BusinessPartnerAlias",
      "A_BusinessPartnerBank",
      "A_BusinessPartnerContact",
      "A_BusinessPartnerIsBank",
      "A_BusinessPartnerPaymentCard",
      "A_BusinessPartnerRating",
      "A_BusinessPartnerRole",
      "A_BusinessPartnerTaxNumber",
      "A_BusPartAddrDepdntTaxNmbr",
      "A_CustAddrDepdntExtIdentifier",
      "A_CustAddrDepdntInformation",
      "A_Customer",
      "A_CustomerCompany",
      "A_CustomerCompanyText",
      "A_CustomerDunning",
      "A_CustomerSalesArea",
      "A_CustomerSalesAreaTax",
      "A_CustomerSalesAreaText",
      "A_CustomerTaxGrouping",
      "A_CustomerText",
      "A_CustomerUnloadingPoint",
      "A_CustomerWithHoldingTax",
      "A_CustSalesPartnerFunc",
      "A_CustSlsAreaAddrDepdntInfo",
      "A_CustSlsAreaAddrDepdntTaxInfo",
      "A_CustUnldgPtAddrDepdntInfo",
      "A_Supplier",
      "A_SupplierCompany",
      "A_SupplierCompanyText",
      "A_SupplierDunning",
      "A_SupplierPartnerFunc",
      "A_SupplierPurchasingOrg",
      "A_SupplierPurchasingOrgText",
      "A_SupplierText",
      "A_SupplierWithHoldingTax"
    ]
  }
}
  ```


## Next steps  


### Prepare nodejs function code to run this destination via CloudSDK from kyma cluster side  



