# Exercise 0 - Preparation Steps

You must have a personal github account for this session.  


## Exercise 0.0 - Sign up for a new GitHub account

> [!IMPORTANT]
> You must be able to fork the repository and activate the github actions at the fork. This is mandatory in order to be able to follow the exercises in this session!

> [!TIP]
> Thus, you may need a GitHub user.  
> If you haven't got one yet, please sign up for a new Github account following the instructions below.

- 👉 Navigate to [GitHub](https://github.com/).
- 👉 Click **Sign up for Github**.
- 👉 Otherwise, you may click on **Continue with Google** to sign up using your Google social login.
- 👉 Follow all the prompts to create your personal account.

## Exercise 0.1 - Fork the teched2025-XP264 repository.

> [!IMPORTANT]
>
> This is a **mandatory** step to be able to run the session exercises which are implemented as github actions.
>

 - 👉 Login to [GitHub](https://github.com/).
 - 👉 On the [main page of this repository](https://github.com/SAP-samples/teched2025-XP264), choose **Fork** on the top right.

<table style="width: 100%; border-collapse: collapse; background-color: #f5f5f5;" border="1">
<tbody>
<tr style="height: 193px;">
<td style="width: 71.6%; height: 193px;">
<div>
<h1><a href="https://github.com/SAP-samples/teched2025-XP264"><img class="aligncenter" src="../ex0/images/fork_entry.png" alt="" /></a></h1>
</div>
</td>
</tr>
</tbody>
</table>   

 - 👉 Make sure that the **Owner** matches the GitHub account that you want to use for this session. All the other information may remain the same.


<table style="width: 100%; border-collapse: collapse; background-color: #f5f5f5;" border="1">
<tbody>
<tr style="height: 193px;">
<td style="width: 71.6%; height: 193px;">
<div>

<!-- <h1><a href="https://github.com/SAP-samples/teched2025-XP264"><img class="aligncenter" src="../ex0/images/fork_details.png" alt="fork_details" /></a></h1>
</div>
<div>
<h1><a href="https://github.com/SAP-samples/teched2025-XP264"><img class="aligncenter" src="../ex0/images/activate-gha-workflows.png" alt="activate-gha-workflows" /></a></h1>
 -->

<p float="left">
  <a href="https://github.com/SAP-samples/teched2025-XP264">
  <img src="../ex0/images/fork_details.png" width="500" alt="fork_details" />
  </a>
</p>

</div>

<div>
<p float="left">
  <a href="https://github.com/SAP-samples/teched2025-XP264">
  <img src="../ex0/images/activate-gha-workflows.png" width="600" alt="activate-gha-workflows" />
  </a>
</p>    
</div>
</td>
</tr>
</tbody>
</table>   

> [!TIP]
> - 👉 Choose **Create Fork**. You are now redirected to the copy of the teched repository in your personal GitHub account.
> - 👉 Choose **Activate Github Actions**. This is mandatory for this session.

## Exercise 0.2 - The rules of the game

Access to the solution landscape is provided via the [Easy Navigation dashboard](https://url.sap/3kf0ol).  
> [!TIP]
> 👉 For the best experience, use the right click to open the dashboard into a separate tab or into a new window

<table style="width: 100%; border-collapse: collapse; background-color: #f5f5f5;" border="1">
<tbody>
<tr style="height: 193px;">
<td style="width: 71.6%; height: 193px;">
<div>

<!-- <h1><a href="https://url.sap/3kf0ol"><img class="aligncenter" src="../ex0/images/site_navigation.png" alt="site_navigation" height="800"/></a></h1> -->

<p float="left">
  <a href="https://url.sap/3kf0ol">
  <img src="../ex0/images/site_navigation.png" width="600" alt="site_navigation" />
  </a>
</p>
</div>
</td>
</tr>
</tbody>
</table>  




## Exercise 0.3 - BTP landscape at a glance.

All students have their SSO acces with the student's credentials to parts of the SAP-TechEd25-XP264 landscape.  

You may login to [SAP-TechEd25-XP264 Business Technology Platform - Cockpit](https://url.sap/yogrmc) 


<table style="width: 100%; border-collapse: collapse; background-color: #f5f5f5;" border="1">
<tbody>
<tr style="height: 193px;">
<td style="width: 71.6%; height: 193px;">
<div>
<!-- <h1><a href="https://url.sap/yogrmc"><img class="aligncenter" src="../ex0/images/SAP-TechEd25-XP264.png" alt="SAP-TechEd25-XP264" /></a>
</h1> -->

:notebook: FYI: The students can pick and choose any available kyma cluster region the following list:


| BTP region              | Kyma region        |                                                                                                                                Description |
| :------------------------ | :---------: | :------------------------------------------------------------------------------------------------------------------------ |
| japan-east (eu20/azure)               |  JAPAN EAST region | kyma environment with the cluster in the japan east region         |
| uk-south (eu20/azure)                 |  UK SOUTH region | kyma environment with the cluster in the uk south region         |
| xp264-000  (eu20/azure)             |  UK SOUTH region  | kyma environment with the cluster in the uk south region         |
| xp264-045  (eu20/azure)                |  UK SOUTH region | kyma environment with the cluster in the uk south region         |
| xp264-050  (eu20/azure)              |  UK SOUTH region | kyma environment with the cluster in the uk south region        |
| xp264-050  (eu20/azure)              |  UK SOUTH region | kyma environment with the cluster in the uk south region        |
| xp264-001  (eu10/aws)                |  EU Central region | kyma environment with the cluster in the eu central region         |
| us-east (eu20/azure)              |  US EAST region  | kyma environment with the cluster in the us east region         |



```mermaid
graph TB
    subgraph GLOBAL_ACCOUNT["SAP BTP Global Account"]
        
        subgraph PROVIDER_REGION["Provider Region (eu20)"]
            PROVIDER[Provider Subaccount]
            CLS[Cloud Logging Service]
            OSC[(OpenSearch Cluster)]
            HDB[(HANA Cloud)]
            
            PROVIDER --> CLS
            PROVIDER --> HDB
            CLS --> OSC
        end
        
        subgraph REGION_EU["☁️ Europe (uk-south)"]
            RT1_EU[RT1: Production EU]
            RT4_EU[RT4: Development]
            RT5_EU[RT5: QA/Test]
            RT6_EU[RT6: Staging]
            RT7_EU[RT7: Integration]

            KYMA_UK[Kyma Runtime<br/>uk-south]
            KYMA_UK2[Kyma Runtime<br/>xp264-050]
            KYMA_UK3[Kyma Runtime<br/>xp264-045]
            KYMA_UK4[Kyma Runtime<br/>xp264-000]
            KYMA_UK5[Kyma Runtime<br/>uk-xp264]
            
            RT1_EU --> KYMA_UK
            RT4_EU --> KYMA_UK2
            RT5_EU --> KYMA_UK3
            RT6_EU --> KYMA_UK4
            RT7_EU --> KYMA_UK5
        end

        subgraph REGION_EU2["☁️ Europe (eu-central)"]
            RT8_EU[RT8: Sandbox]
            KYMA_EU2[Kyma Runtime<br/>xp264-001]
            RT8_EU --> KYMA_EU2
        end


        subgraph REGION_US["☁️ United States (us-east)"]
            RT2_US[RT2: Production US]
            KYMA_US[Kyma Runtime<br/>us-east]
            
            RT2_US --> KYMA_US
        end
        
        subgraph REGION_APAC["☁️ Asia Pacific (Japan-east)"]
            RT3_APAC[RT3: Production APAC]
            KYMA_APAC[Kyma Runtime<br/>japan-east]
            
            RT3_APAC --> KYMA_APAC
        end
    end
    
    RT1_EU -->|HTTPS| CLS
    RT4_EU -->|HTTPS| CLS
    RT5_EU -->|HTTPS| CLS
    RT6_EU -->|HTTPS| CLS
    RT7_EU -->|HTTPS| CLS
    RT8_EU -->|HTTPS| CLS
    RT2_US -->|HTTPS<br/>Cross-Region| CLS
    RT3_APAC -->|HTTPS<br/>Cross-Region| CLS

    RT1_EU -->|HTTPS| HDB
    RT4_EU -->|HTTPS| HDB
    RT5_EU -->|HTTPS| HDB
    RT6_EU -->|HTTPS| HDB
    RT7_EU -->|HTTPS| HDB
    RT8_EU -->|HTTPS| HDB
    RT2_US -->|HTTPS<br/>Cross-Region| HDB
    RT3_APAC -->|HTTPS<br/>Cross-Region| HDB

    style PROVIDER_REGION fill:#0066cc,color:#fff
    style REGION_EU fill:#00b388,color:#fff
    style REGION_US fill:#00b388,color:#fff
    style REGION_APAC fill:#00b388,color:#fff
    style RT1_EU fill:#006400,color:#fff
    style RT2_US fill:#006400,color:#fff
    style RT3_APAC fill:#006400,color:#fff
    style RT4_EU fill:#f0ab00,color:#000
    style RT5_EU fill:#f0ab00,color:#000
    style RT6_EU fill:#f0ab00,color:#000
    style RT7_EU fill:#f0ab00,color:#000
    style RT8_EU fill:#ff6666,color:#fff
 
```

</div>
</td>
</tr>
</tbody>
</table>   



> [!IMPORTANT]
> - Each cluster has been configured to the same template with dedicated namespaces for each student.
> - As this is an academic exercise, the complete user/namespace isolation has not been enforced.
> 
> Furthermore:
> - The students do not have access to the master components of the landscape. 
> - Any shared component access required for the session is granted via SSO with the links available from the [Easy Navigation site](https://url.sap/3kf0ol).



> [!NOTE]
> - The BTP landscape has a number of subaccounts or **runtime contexts**.  
> - The majority of runtime contexts are hosted in the same BTP region - in the EU20 data center (Azure/Netherlands)
> - However, there are a few hosted in the EU10 data center (AWS/Francfort) as well.
> - Each BTP subaccount can host a single kyma runtime environment.
> - Each kyma runtime environment maps into a single kuberneters cluster in the Azure or AWS region of your choice.
> - Please note the kyma cluster region may be different from the BTP subaccount region.

Furthermore, each student's runtime context features a preconfigured SAP Cloud Connector attached, for instance:


<table style="width: 100%; border-collapse: collapse; background-color: #f5f5f5;" border="1">
<tbody>
<tr style="height: 193px;">
<td style="width: 71.6%; height: 193px;">
<div>
<h1><a href=""><img class="aligncenter" src="https://github.com/user-attachments/assets/5e92690b-41ad-4cf4-993a-f8486d0bb32d" alt="" /></a></h1>
</div>
</td>
</tr>
</tbody>
</table>  


## Exercise 0.4 - SAP BTP, Kyma Runtime (SKR) architecture


There are two main components in the SAP BTP, Kyma Runtime architecture, namely:

  * Kyma Control Plane (KCP)
  * Kyma Runtime (SKR)

### Kyma Control Plane (KCP)  
Kyma Control Plane is a central component that manages the lifecycle of the Kyma Runtime clusters. It is responsible for deploying, configuring, and monitoring the underlying Kubernetes clusters and the Kyma modules running on them. KCP provides a unified interface for users to manage their clusters, install new modules, and monitor the health and performance of the runtime environment.  

Currently, the KCP is a single instance deployed in the Google Cloud Platform on top of GKE cluster. The future plan is to have multiple instances of KCP as to be able to support restricted markets and improve scalability.  

### Kyma Runtime (SKR)  
Each Kyma Runtime instance is a separate Kubernetes cluster managed by the KCP.  
Customers can pick and choose which Kyma modules to install on their runtime, based on their specific requirements.  
The Kyma modules provide additional functionality and services to the runtime environment, such as service mesh integration, serverless computing, telemetry, and API gateway.  
Some of the modules are added by default (istio, api-gateway and btp-operator), while others can be installed on request.

  * Kyma Runtime (SKR) architecture diagram 

<table style="width: 100%; border-collapse: collapse; background-color: #f5f5f5;" border="1">
<tbody>
<tr style="height: 193px;">
<td style="width: 71.6%; height: 193px;">
<div>
<h1><a href="https://url.sap/3kf0ol"><img class="aligncenter" src="../ex0/images/skr.drawio.svg" alt="" height="600"/></a></h1>
</div>
</td>
</tr>
</tbody>
</table> 




## Summary

Now that you have everything you need to successfully go through this TechEd session:

- A GitHub account.
- Your own fork of the session's GitHub repository.
- Access to the SAP BTP managed kubernetes landscape with the easy navigation site
- An idea of the BTP landscape architecture behind the solution brief

Continue to [First things first. Day-2 with SAP managed kubernetes runtime](../ex1/README.md)
