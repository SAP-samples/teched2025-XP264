# XP264- Explore how to run cloud-native applications on SAP BTP, Kyma runtime

## Description

This repository contains the material for the SAP TechEd 2025 session catalog number XP264 - [**Explore how to run cloud-native applications on SAP BTP, Kyma runtime.**](https://www.sap.com/events/teched/berlin/flow/sap/te25/catalog-inperson/page/catalog/session/1749035076180001oik0)  

  * Day-2 Operations: Maintenance, Monitoring, and Optimization
  * Onpremise connectivity

## Overview

This session introduces attendees to **Day-2** operation with SAP BTP, Kyma runtime - a flexible and easy way to connect and extend enterprise applications in the cloud-native world.  

**Kyma** as of such, part of [Kyma project](https://github.com/kyma-project), is an opinionated set of Kubernetes-based modular building blocks (modules) that provide all the necessary capabilities to develop and run enterprise-grade cloud-native applications.  

### During the session you will learn:

  * how to run applications on the Kyma runtime for SAP BTP and discover the power of smooth integration with cloud applications and on-premise systems using the advanced connectivity features.  
  * to explore operational best practices from mastering troubleshooting techniques and intelligent root-cause analysis to event-driven autoscaling that adapts to your business needs in real time.

## Requirements

The requirements to follow the exercises in this repository are...

  * You need to have a GitHub user. If you don't have one so far, please sign-up on GitHub before going through the exercises
  * Additional configuration on your SAP TECHED 2025 Client laptop (that should be pre-installed)
    
  kubectl plugins | install [jq](https://jqlang.org/download/) | [Kyma CLI for SAP BTP, Kyma Runtime](https://tools.hana.ondemand.com/#cloud) |
  -- | -- | -- |
  install [krew.exe](https://github.com/kubernetes-sigs/krew/releases/download/v0.4.5/krew.exe) | install jq with `winget install jqlang.jq` | install [kyma cli](https://github.com/kyma-project/cli/releases/download/3.2.0/kyma_Windows_x86_64.zip) 
  installing the oidc-login plugin | |
  install view-serviceaccount-kubeconfig plugin | |

  * Github actions (GHA). You may run the GHA-based exercises direclty from a browser from your forked repository. Alternatively, you may use VSCode termainal and other plugins you may be familiar with.

  * As this is a Day-2 operation brief, the entire cloud landscape has been pre-configured with a number of shared components like SAP Cloud Logging, SAP HANA Cloud.  
  All the SAP Kyma environments have been configured to the same template.  
  Each SAP Kyma kubernetes ckuster offers the same setup with very minor differences...

## Exercises

* #### [Exercise 0 - Preparation Steps](exercises/ex0#exercice-0---preparation-steps)

  * [Exercise 0.0 - Sign up for a GitHub account](exercises/ex0#exercise-00---sign-up-for-a-new-github-account)
  * [Exercise 0.1 - Create a Copy of This Repository](exercises/ex0#exercise-01---create-a-copy-of-this-repository)
  * [Exercise 0.2 - Discover your SAP BTP managed kubernetes landscape](exercises/ex0#exercise-02---discover-your-managed-kubernetes-landscape)
  * [Exercise 0.3 - Solution brief. Functional architecture](exercises/ex0#exercise-03---solution-brief-funtional-architecture)

* #### [Exercise 1 - SAP BTP, Kyma runtime easy with kyma CLI ](exercises/ex1#exercise-1---set-up-your-delivery-pipeline-and-transport-landscape)

  * [Exercise 1.0 - Get your hands dirty with kyma CLI](exercises/ex1#exercise-10---get-your-hands-dirty-with-kyma-cli)
  * [Exercise 1.1 - Firefighter access to your kyma cluster](exercises/ex1#exercise-11---fire-fighter-access-to-your-kyma-cluster)


Provide the exercise content here directly in README.md using [markdown](https://guides.github.com/features/mastering-markdown/) and linking to the specific exercise pages, below is an example.

- [Getting Started](exercises/ex0/)
- [Exercise 1 - First Exercise Description](exercises/ex1/)
    - [Exercise 1.1 - Exercise 1 Sub Exercise 1 Description](exercises/ex1#exercise-11-sub-exercise-1-description)
    - [Exercise 1.2 - Exercise 1 Sub Exercise 2 Description](exercises/ex1#exercise-12-sub-exercise-2-description)
- [Exercise 2 - Second Exercise Description](exercises/ex2/)
    - [Exercise 2.1 - Exercise 2 Sub Exercise 1 Description](exercises/ex2#exercise-21-sub-exercise-1-description)
    - [Exercise 2.2 - Exercise 2 Sub Exercise 2 Description](exercises/ex2#exercise-22-sub-exercise-2-description)

  
**OR** Link to the Tutorial Navigator for example...

Start the exercises [here](https://developers.sap.com/tutorials/abap-environment-trial-onboarding.html).

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
