# Exercise 6 - Use Transparent Proxy Kyma Module

In this exercise, you will _consume_ remote systems defined as destinations (managed centrally in SAP BTP Destination service) in a _simple_, _unified_ and _virtually transparent_ way. This is enabled by Transparent Proxy module, which is seamlessly integrated with other modules and services of SAP BTP Connectivity.

For simplicity and illustration purposeses, in this exercise, you will start a [cURL Pod](https://hub.docker.com/r/curlimages/curl-base), open a terminal to the Pod and use the well-known [cURL](https://curl.se/) tool to execute HTTP requests to the target systems.

## Exercise 6.1 Run a cURL Pod Included in the Istio Service Mesh

Using a single command, you will run a Kubernetes Pod hosting a preconfigured environment allowing direct usage of cURL. To be able to access remote systems securely exposed via Transparent Proxy, the Kuberenetes Pod must be included in the Istio Service Mesh.

1. Execute the following command in the terminal

Command:
```
kubectl run -n quovadis-btp --labels=sidecar.istio.io/inject=true -it --rm --image=curlimages/curl-base curly -- /bin/sh
```
Output:
```
All commands and output from this session will be recorded in container logs, including credentials and sensitive information passed through the command prompt.
If you don't see a command prompt, try pressing enter.
/home/curl_user #

```

2. Install _jq_ tool for being able to easily parse the JSON response from the target system

Command:
```
apk add jq
```
Output:
```
fetch https://dl-cdn.alpinelinux.org/alpine/v3.22/main/x86_64/APKINDEX.tar.gz
fetch https://dl-cdn.alpinelinux.org/alpine/v3.22/community/x86_64/APKINDEX.tar.gz
(1/2) Installing oniguruma (6.9.10-r0)
(2/2) Installing jq (1.8.0-r0)
Executing busybox-1.37.0-r19.trigger
OK: 18 MiB in 39 packages
```

## Exercise 6.2 Connect to remote systems defined as destinations using the dynamic "gateway" Destination CR

This ```gateway``` Destination CR can be used to invoke any of the available destinations in the context of the BTP subaccount. For example, let's use the ```cis-httpbin``` destination which targets ```httpbin.org``` system hosted in Internet - a simple HTTP Request & Response Service.

1. Execute the following command in the terminal

Request Command:
```
curl gateway/headers -s -H "X-Destination-Name: cis-httpbin" | jq .headers.Host
```
Response:
```
"httpbin.org"
```

If you'd like to explore the raw JSON output, re-execute the commant ommiting the suffux ```| jq .headers.Host```.

## Exercise 6.3 Connect to a remote system defined as destination using the dedicated (static) "s4any" Destination CR

This ```s4any``` Destination CR points to ```s4-anywhere``` destination which targets an SAP S/4HANA system hosted in the premise and securely exposed to BTP applications via Cloud Connector and SAP Connectivity service. In this example, we will use the [Business Partner (A2X)
](https://api.sap.com/api/API_BUSINESS_PARTNER/overview) OData API and more specifically [GET /A_BusinessPartner](https://api.sap.com/api/API_BUSINESS_PARTNER/resource/get_A_BusinessPartner)

1. Execute the following command in the terminal
Request:
```
curl -s 's4any/sap/opu/odata/sap/api_business_partner/A_BusinessPartner?sap-client=400&$top=5&$select=BusinessPartnerFullName&$format=json' -H "Authorization: $(cat token)" | jq .d.results[].BusinessPartnerFullName
```
Response:
```
"US Apparel DC"
"US Grocery DC"
"Philadelphia Store"
"New York Store"
"Boston Store"
```

If you'd like to explore the raw JSON output, re-execute the commant ommiting the suffux ```| jq .d.results[].BusinessPartnerFullName```.

2. As you might already guess, the same request can technically be performed using the ```gateway``` Destination CR. Here's how it looks like:

Request:
```
curl -s 'gateway/sap/opu/odata/sap/api_business_partner/A_BusinessPartner?sap-client=400&$top=5&$select=BusinessPartnerFullName&$format=js
on' -H "X-Destination-Name: s4-anywhere" -H "Authorization: $(cat token)" | jq .d.results[].BusinessPartnerFullName
```
Response:
```
"US Apparel DC"
"US Grocery DC"
"Philadelphia Store"
"New York Store"
"Boston Store"
```

## Summary

You've now consumed remote systems defined as destinations in Destination service in the context of the account in use by Transparent Proxy based on the applied configuration.

You see how simple is to connect to arbirtary system defined as a destination in Destination service. You practically use the Destination CR as locally accessible hostname and do not do anything more but passing the mandatory API specific parameters. The complex parts are handled automatically by the Transparent Proxy and Destination service. If the target system is hosted on-premise, then the additional complexity is again handled automatically, this time with the automated usage of Connectivity Proxy module and Connectivity service.

## References
* [Connectivity in the Kyma Environment](https://help.sap.com/docs/CP_CONNECTIVITY/cca91383641e40ffbe03bdc78f00f681/7501fbc9aebd4e3180eddec977ca288d.html)
* [Transparent Proxy in the Kyma Environment](https://help.sap.com/docs/CP_CONNECTIVITY/cca91383641e40ffbe03bdc78f00f681/1700cfe070704d2e80aa76de1033a6c4.html)
* [Transparent Proxy - Integration with SAP BTP Connectivity](https://help.sap.com/docs/CP_CONNECTIVITY/cca91383641e40ffbe03bdc78f00f681/aa9fc26f0c74495ea91612994016eaed.html)
* [Transparent Proxy - Concepts](https://help.sap.com/docs/CP_CONNECTIVITY/cca91383641e40ffbe03bdc78f00f681/3f9e8f186d264062874b668ddacfa3fc.html)
* [Transpaernt Proxy - Usage Overview](https://help.sap.com/docs/CP_CONNECTIVITY/cca91383641e40ffbe03bdc78f00f681/c5257cf110bf4b7b9054eab74ededff4.html)
* [Transpaernt Proxy - Destination Custom Resource](https://help.sap.com/docs/CP_CONNECTIVITY/cca91383641e40ffbe03bdc78f00f681/fc7951e80cb0423ebc0d35e3443c32dc.html)
* [Transpaernt Proxy - Destination Gateway (Dynamic Lookup of Destinations)](https://help.sap.com/docs/CP_CONNECTIVITY/cca91383641e40ffbe03bdc78f00f681/6836e007ebb24954b727f1524837f741.html)
* [Transparent Proxy - Troubleshooting](https://help.sap.com/docs/CP_CONNECTIVITY/cca91383641e40ffbe03bdc78f00f681/fce292aeb9e24b7abd47c0b38f6fe8a9.html)