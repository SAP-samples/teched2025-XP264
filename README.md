# XP264- Explore how to run cloud-native applications on SAP BTP, Kyma runtime

## Description

This repository contains the material for the SAP TechEd 2025 session catalog number XP264 - [**Explore how to run cloud-native applications on SAP BTP, Kyma runtime.**](https://www.sap.com/events/teched/berlin/flow/sap/te25/catalog-inperson/page/catalog/session/1749035076180001oik0)  

  * Day-2 Operations: Management, Maintenance, Monitoring, and Optimization
  * Technical connectivity to public and private (on-premise) systems 

## Overview

This session introduces attendees to **Day-2** operations with SAP BTP, Kyma runtime - a managed kubernetes environment to help connect and extend enterprise applications in the cloud-native world.  

In a nutshell, SAP BTP, Kyma Runtime (SKR) is a managed offering of a Kubernetes Cluster based on Gardener, extended by a set of building blocks called **Kyma modules**.  
The idea being that each instance of SAP BTP Kyma runtime environment is a separate Kubernetes cluster with its own set of modules.  
All these clusters are managed by a central Kyma Control Plane (KCP) that orchestrates the lifecycle of 
 - the underlying hyperscaler project, 
 - the Gardener Cluster, 
 - and the Kyma modules.


<table style="width: 100%; border-collapse: collapse; background-color: #f5f5f5;" border="1">
<tbody>
<tr style="height: 193px;">
<td style="width: 71.6%; height: 193px;">
<div>
<h1><a href="https://help.sap.com/docs/btp/sap-business-technology-platform/kyma-environment"><img class="aligncenter" src="exercises/ex0/images/kyma-runtime-stack.drawio.svg" alt="kyma stack" /></a></h1>
</div>
</td>
</tr>
</tbody>
</table> 

### During the session you will learn

  * how to operate applications with SAP BTP, Kyma runtime and discover the power of smooth integration with cloud applications and on-premise systems using the advanced connectivity features.  
  * to explore operational best practices from mastering troubleshooting techniques and intelligent root-cause analysis to event-driven autoscaling that adapts to your business needs in real time.
  * about multitenant applications with SAP BTP, Kyma runtime.

## Requirements

The requirements to follow the exercises in this repository are...

- You need to fork the repository. Thus, you may need to have a GitHub user.
  If you haven't got one yet, please [sign-up](exercises/ex0#exercise-00---sign-up-for-a-new-github-account) on GitHub before the workshop.

- As the session content is delivered exclusively on SAP-Samples github, many excercises have been implemented as Github actions (GHA). 
- There is no need to provide kubernetes and/or btp credentials when using the github actions. 
  - The Github is acting as the IDP provider. 
  - All the kubernetets environments in the landscape come with the pre-configured Github actions OIDC providers.
  - SAP Cloud Identity Services acting as a platform IDP on the BTP side og the house has been deferated with the Github actions Identity Provider
  - As a result, the very short-lived credentials are being fetched and rotated automatically on the behalf of the repository user for either kubernetes and btp platform operations.
- The good news is you may run the GHA-based exercises directly from a browser from your forked repository on the teched laptop.
- Feel free to inspect the results of the built-in automations and if you feel like go ahead and create your own variants as well.
- The recommendation is to go with the flow of the exercises, ask questions and leave the rest for the homework.

- For all the exercises which may require a desktop terminal you may use VSCode with is built-in terminal as well.

- As this is a Day-2 operation brief, the entire cloud landscape has been pre-configured with a number of shared components, for instance: 
   - SAP Cloud Identity Services (SAP IAS), 
   - SAP Cloud Logging, 
   - SAP HANA Cloud,
   - ArgoCDaaS,
   - SAP BTP Connectivity services - Destination service, Connectivity service, Cloud Connector, Connectivity Proxy and Transparent Proxy
   - S4/HANA On-premise (private cloud) with the Cloud Connector in the private network.

- All of the SAP Kyma environments have been configured to the same template (via terraform automation).  

- Last but not least, you will be able to *play* with a pre-deployed SAP Build multitenant application deployed to one of the kyma clusters.   

- Additional software tools (that are pre-installed on your SAP TECHED 2025 Client laptops)  
    
  kubectl plugins | jq | Kyma CLI |
  -- | :--: | -- |
  install [krew.exe](https://github.com/kubernetes-sigs/krew/releases/download/v0.4.5/krew.exe) | install jq with `winget install jqlang.jq` | download [kyma cli](https://github.com/kyma-project/cli/releases/download/3.2.0/kyma_Windows_x86_64.zip) 
  installing the oidc-login plugin | |
  install view-serviceaccount-kubeconfig plugin | |


## [Let's get started...](exercises/ex0/)

* #### [Exercise 0 - Preparation Steps](exercises/ex0#exercise-0---preparation-steps)

  * [Exercise 0.0 - Sign up for a GitHub account](exercises/ex0#exercise-00---sign-up-for-a-new-github-account)
  * [Exercise 0.1 - Create a Copy of This Repository](exercises/ex0#exercise-01---create-a-copy-of-this-repository)
  * [Exercise 0.2 - Discover SAP-TechEd-XP264 session landscape](exercises/ex0#exercise-02---discover-sap-teched25-xp264-session-landscape)
  * [Exercise 0.3 - Solution brief. Functional architecture](exercises/ex0#exercise-03---solution-brief-funtional-architecture)

* #### [Exercise 1 - First things first. Getting to know SAP Kyma managed kubernetes runtime](exercises/ex1#exercise-1---first-things-first-getting-acquainted-with-sap-btp-kyma-runtime-skr)

  * [Exercise 1.0 - Let's talk SAP BTP, Kyma Runtime architecture](exercises/ex1#exercise-10---lets-talk-sap-btp-kyma-runtime-skr-architecture)
  * [Exercise 1.1 - Easy access to your session landscape (with SSO).](exercises/ex1#exercise-11---easy-access-to-your-teched-landscape-with-sso)
  * [Exercise 1.2 - Built-in automation flows](exercises/ex1#exercise-12---built-in-automation-flows)
  * [Exercise 1.3 - Zoom on Kyma CLI](exercises/ex1#exercise-13---zoom-on-kyma-cli)
  * [Exercise 1.4 - Firefighter access](exercises/ex1#exercise-14---fire-fighter-access-to-your-kyma-cluster)
  * [Exercise 1.5 - Kyma diagnostic check](exercises/ex1#exercise-15---kyma-diagnostic-check)
  * [Exercise 1.6 - Multitenancy playground](exercises/ex1#exercise-16---subscribe-to-a-kyma-multitenant-application)


* #### [Exercise 2 - Using External Scalers. Keda](exercises/ex2#exercise-2---use-external-scalers-keda)

* #### [Exercise 3 - Explore Kyma Telemetry Features with SAP Cloud Logging](exercises/ex3#exercise-3---exploring-kyma-telemetry-with-sap-cloud-logging)

  * [Exercise 3.0 - Simulate some load](exercises/ex3#exercise-30---simulate-some-load)
  * [Exercise 3.1 - Access SAP Cloud Logging](exercises/ex3#exercise-31---access-sap-cloud-logging)
  * [Exercise 3.2 - Explore Logs](exercises/ex3#exercise-32---explore-logs)
  * [Exercise 3.3 - Explore Metrics](exercises/ex3#exercise-33---explore-metrics)
  * [Exercise 3.4 - Explore Traces](exercises/ex3#exercise-34---explore-traces)


* #### [Exercise T1 - Enable Transparent Proxy Kyma Module (optional)](exercises/exT1#exercise-t1---enable-transparent-proxy-kyma-module)

  * [Exercise T1.1 - Navigate To The Kyma Dashboard](exercises/exT1#exercise-t11-navigate-to-the-kyma-dashboard)
  * [Exercise T1.2 - Enable Transparent Proxy Module](exercises/exT1#exercise-t12-enable-transparent-proxy-module)
  * [Exercise T1.3 - Explore What Changed In The Kyma Instance](exercises/exT1#exercise-t12-explore-what-changed-in-the-kyma-instance)


* #### [Exercise T2 - Configure Transparent Proxy Kyma Module](exercises/exT2#exercise-t2---configure-transparent-proxy-kyma-module)

  * [Exercise T2.1 - Navigate to your working Namespace in Kyma Dashboard](exercises/exT2#exercise-t21-navigate-to-your-working-namespace-in-kyma-dashboard)
  * [Exercise T2.2 - Create a dynamic Destination Custom Resource](exercises/exT2#exercise-t22-create-a-dynamic-destination-custom-resource)
  * [Exercise T2.3 - Create a static Destination Custom Resource](exercises/exT2#exercise-t23-create-a-static-destination-custom-resource)
  * [Exercise T2.4 - Explore the results of the creation of the Destination CRs via Kubectl](exercises/exT2#exercise-t24-explore-the-results-of-the-creation-of-the-destination-crs-via-kubectl)

* #### [Exercise T3 - Use Transparent Proxy Kyma Module](exercises/exT3#exercise-t3---use-transparent-proxy-kyma-module)

  * [Exercise T3.1 - Run a cURL Pod Included in the Istio Service Mesh](exercises/exT3#exercise-t31-run-a-curl-pod-included-in-the-istio-service-mesh)
  * [Exercise T3.2 -  Connect to remote systems defined as destinations using the dynamic "gateway" Destination CR](exercises/exT3#exercise-t32-connect-to-remote-systems-defined-as-destinations-using-the-dynamic-gateway-destination-cr)
  * [Exercise T3.3 - Connect to a remote system defined as destination using the dedicated (static) "s4any" Destination CR](exercises/exT3#exercise-t33-connect-to-a-remote-system-defined-as-destination-using-the-dedicated-static-s4any-destination-cr)


----------------------------  
SAP Kyma in Developers Tutorial Navigator: [here](https://developers.sap.com/tutorial-navigator.html?search=kyma).

**IMPORTANT**

Your repo must contain the .reuse and LICENSES folder and the License section below. DO NOT REMOVE the section or folders/files. Also, remove all unused template assets(images, folders, etc) from the exercises folder. 

## Contributing
Please read the [CONTRIBUTING.md](./CONTRIBUTING.md) to understand the contribution guidelines.

## Code of Conduct
Please read the [SAP Open Source Code of Conduct](https://github.com/SAP-samples/.github/blob/main/CODE_OF_CONDUCT.md).

## How to obtain support

Support for the content in this repository is available during the actual time of the online session for which this content has been designed. Otherwise, you may request support via the [Issues](../../issues) tab.

## License
Copyright (c) 2024 SAP SE or an SAP affiliate company. All rights reserved. This project is licensed under the Apache Software License, version 2.0 except as noted otherwise in the [LICENSE](LICENSES/Apache-2.0.txt) file.
