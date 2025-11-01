# Exercise 1 - First things first. Day-2 with SAP BTP, Kyma Runtime

Day 2 Operations refers to the ongoing operational activities required to maintain, monitor, and optimize systems after the initial deployment (Day 1 - Configuration and Deployment).   


<table style="width: 100%; border-collapse: collapse; background-color: #f5f5f5;" border="1">
<tbody>
<tr style="height: 193px;">
<td style="width: 71.6%; height: 193px;">
<div> 
Summary of the routines or days:  

- Day-0 -- Planning and Design
- Day-1 -- Configuration and Deployment
- Day-2 -- Run and Operations with the focus on Observability/Monitoring (with the OpenTelemetry), Security and Governance, Developers experience (automation, CI/CD tools), Storage, High Availability

<hr>

- The below charts provide different perspectives on Day 2 operations - from process flow to timeline-based activities.


```mermaid
---
config:
  theme: redux
  look: classic
---
flowchart LR
    Start([Day 2 Operations Start]) --> Monitor{Monitoring}
    Monitor --> Alert[Alert Triggered?]
    Alert -->|Yes| Incident[Incident Response]
    Alert -->|No| Optimize[Performance Optimization]
    
    Incident --> Analyze[Root Cause Analysis]
    Analyze --> Fix[Implement Fix]
    Fix --> Test[Test Solution]
    Test --> Deploy[Deploy Fix]
    Deploy --> PostMortem[Post-mortem Review]
    PostMortem --> Improve[Process Improvement]
    
    Optimize --> Scale{Scaling Needed?}
    Scale -->|Yes| Provision[Provision Resources]
    Scale -->|No| Maintain[Maintenance Tasks]
    
    Provision --> Update[Update Capacity Plans]
    Update --> Maintain
    
    Maintain --> Security[Security Updates]
    Security --> Backup[Backup Operations]
    Backup --> Cost[Cost Optimization]
    Cost --> Monitor
    
    Improve --> Monitor
    
    %% Styling
    classDef startEnd fill:#ffcdd2,stroke:#d32f2f
    classDef process fill:#c8e6c9,stroke:#388e3c
    classDef decision fill:#fff3e0,stroke:#f57c00
    
    class Start,PostMortem startEnd
    class Monitor,Incident,Analyze,Fix,Test,Deploy,Optimize,Provision,Update,Maintain,Security,Backup,Cost,Improve process
    class Alert,Scale decision
```

</div>

- Timeline-based activities.

<div>

```mermaid
---
config:
  theme: redux
  look: classic
---
gantt
    title Day 2 Operations Timeline
    dateFormat  HH:mm
    axisFormat %H:%M
    
    section Monitoring
    Continuous Monitoring    :active, monitor, 00:00, 24:00
    Alert Processing         :alert, 00:00, 24:00
    
    section Daily Tasks
    Security Patches         :patch, 02:00, 04:00
    Backup Verification      :backup, 03:00, 05:00
    Performance Review       :perf, 08:00, 10:00
    Cost Analysis            :cost, 14:00, 16:00
    
    section Weekly Tasks
    Capacity Planning       :capacity, 09:00, 12:00
    DR Testing              :dr, 10:00, 14:00
    Security Audit          :audit, 13:00, 17:00
    
    section Monthly Tasks
    Post-mortem Reviews    :review, 09:00, 11:00
    Process Optimization   :optimize, 11:00, 15:00
    Compliance Check       :compliance, 15:00, 17:00
```


</div>
</td>
</tr>
</tbody>
</table> 


> [!IMPORTANT]
> * With the SAP managed kubernetes offering, the entire kubernetes infrastructure is managed 24/7 by the SAP SRE teams. That includes regular kubernetes versions updates, security patches, overall monitoring of the underlying infrastructure, etc. 
> * Customers can decide by themselves to upsize or downsize the kubernetes cluster resources via a change of machine types.  In order to optimize the cluster configuration and resources, additional worker pools can be provisioned/deprovisioned as well. These worker pools may feature nodes sizes (machine types) different from the master cluster nodes. Worker pools with GPU nodes are supported as well.
> * All SAP Kyma kubernetes extensions - the kyma modules - are fully managed and supported. Customer have a choice between the fast and the regular channels with regard to the modules.  
The fast channel offers a 14-day trial window before the modules get promoted to the regular channel.
> * [What's new channel](https://help.sap.com/whats-new/cf0cb2cb149647329b5d02aa96303f56?Environment=Kyma;Kubernetes&Component=Kyma+Runtime) with all the kyma runtime past, current and future changes - this information channel can be subscribed to.
> * SAP L1 /L2 /L3 /SRE support teams are there to assist on request with the customers Day-2 operations via SAP support channel.
>
> * With this, the customers Day-2 operations teams may focus exclusively on Management, Maintenance, Monitoring, and Optimization of their own workloads rather.


## Exercise 1.1 - Easy access to your teched landscape with SSO.

- This SAP Workzone dashboard is to assist you with the landscape discovery and ease the navigation thorugh the landscape components.
- Please use your allocated student's credentials to login...

<table style="width: 100%; border-collapse: collapse; background-color: #f5f5f5;" border="1">
<tbody>
<tr style="height: 193px;">
<td style="width: 71.6%; height: 193px;">
<div> 
<h1><a href="https://url.sap/3kf0ol"><img class="aligncenter" src="../ex0/images/site_navigation.png" alt="" height="600"/></a></h1>
</div>
</td>
</tr>
</tbody>
</table>   
  

## Exercise 1.2 - Built-in github actions automation flows

Does one always need to climb the mountain of the onboarding documentation? Not necessarily.  
A well-thought and designed landscape (Day-0/Day-1) would offer some built-in automation.  
Good to know:  
- This landscape features a number of pre-configured CI/CD github action workflows and Terraform automations.
- The workflows templates have been automatically generated by the Day-1 landscape
- The Day-2 teams have a solid set of automated worfklows to build upon their Day-2/SRE operationas

In this exercise you will:  
- 👉 Explore Kyma runtime environments with the built-in automation flows.  
- 👉 Retrieve the key information about the state of the runtime environment... at a glance.  
- 👉 Both securely and effortlessly!


The pre-configured CI/CD automation workflows are to be manually triggered. 
They come in three different flavors, namely as:
* admin workflows (cluster-wide) 
* students workflows (namespaced)   
* data collection workflows (namespaced).

<table style="width: 100%; max-width:100%; table-layout: fixed; overflow:auto; border-collapse: collapse; background-color: #f5f5f5;" border="1">
<tbody>
<tr style="height: 193px;">
<td style="width: 71.6%; height: 193px;">
<div>
👉 Github automation workflows sequence diagrams. Let's have a look at the common building blocks (steps) of a github action workflow
<hr>

<p float="left">  

```mermaid

---
config:
  theme: redux-color
  look: classic
title: Github automation workflow sequence common building blocks
---
sequenceDiagram
  actor me as student
  participant job as Set up job
  participant repo as Check out Git repository
  participant helm as Install helm
  participant kube as Setup Kube Context
  participant check as permissions check
  participant other as other
  Note over job: pick the runner for the job
  Note over repo: checkout repository
  Note over kube: create kubeconfig with<br/>dynamic credentials
  Note over check: kubeconfig<br>permissions check
  Note over other: the other steps<br>may differ based<br>on workflow types
  autonumber
 rect rgb(191, 223, 255)
  me ->> job: job setup
  job ->> repo: repo checkout
  repo ->> helm: install helm
  helm ->> kube: create kubeconfig
  kube ->> check: permissions check
  check ->> other: admin<br>student<br>diagnostics
end


```
<hr>
👉 Let's have a look at the custom steps of a github action workflow


```mermaid

---
config:
  theme: base
  look: classic
---
flowchart TD
 subgraph other["custom"]
        G["admin"]
        F(("Other steps"))
        H["student"]
        I["data"]
  end
    F L_F_G_0@-- "cluster-wide" --> G
    F L_F_H_0@-- namespaced --> H & I
    L_F_G_0@{ animation: slow } 
    L_F_H_0@{ animation: slow } 
    L_F_I_0@{ animation: slow }

```

</p>
</div>
</td>
</tr>
</tbody>
</table> 

Time to do it yourself...  
- 👉 Pick a region and action of your choice...
- 👉 Trigger the workflow...(hint: you may run them all at once in parallel)
- 👉 Inspect the steps of each workflow...

<table style="width: 100%; border-collapse: collapse; background-color: #f5f5f5;" border="1">
<tbody>
<tr style="height: 193px;">
<td style="width: 71.6%; height: 193px;">

<div>

```mermaid

---
config:
  theme: redux-color
  look: classic
title: 'Github automation workflow per category: admin, student, data'
---
sequenceDiagram
  actor me as me
  participant btp as Kyma Region (BTP Cockpit)
  participant admin as Admin Worklow (cluster-wide)
  participant student as Student Workflow (namespaced)
  participant data as Data Collection Workflow (namespaced)
  rect rgb(191, 223, 255)
    me ->> admin: pick the worflow
    btp -->> admin: cluster-wide automation
    btp -->> student: namespaced automation
    btp -->> data: cluster diagnostic ckeck
    Note over me: Pick an automation workflow<br/>for a regionn<br/>of your choice.
    Note over admin, data: Choose a workflow<br/>and open it<br/>with the right click.
  end


```

</div>
<hr>
<div>

👉 For the best experience, open workflow links into a separate tab or into a new window (right click).  


| Kyma BTP Region (Cockpit) |  Kyma dashboard | Admin Worklow (cluster-wide) | Student Workflow (namespaced)| Data Collection Workflow (namespaced)
| :---------  | --------- | :--------- | :------- | -----------
| [uk-south](https://url.sap/0dd8pm) | [<img src="../landscape/uksouth/kyma-dashboard_url_uksouth.png" width="50" />](https://url.sap/x2ygbf) | [uk-south--admin](../../../../actions/workflows/uk-south-teched-7a69075f-7faf-4604-a62e-806648791dba.yml) | [uk-south--xp264](../../../../actions/workflows/uk-south-teched-7a69075f-7faf-4604-a62e-806648791dba-xp264.yml)| [ k8s-data-context-student](../../../../actions/workflows/k8s-data-context-student.yml)
| [japan-east](https://url.sap/u66itn) | [<img src="../landscape/japaneast/kyma_dashboard_url_japaneast.png" width="50" />](https://url.sap/0ysrs1 ) | [japan-east--admin](../../../../actions/workflows/japan-east-teched-2a6fe480-ac84-4751-ad37-56ec2a493932.yml) | [japan-east--xp264](../../../../actions/workflows/japan-east-teched-2a6fe480-ac84-4751-ad37-56ec2a493932-xp264.yml) | [k8s-data-context-student](../../../../actions/workflows/k8s-data-context-student.yml)
| [us-east](https://url.sap/b24wtp) | [<img src="../landscape/useast/kyma_dashboard_url_useast.png" width="50" />](https://url.sap/ui217f) | [us-east--admin](../../../../actions/workflows/btp-runtime-teched-dbe7346b-88da-430a-8777-4f6aa3e22b5e.yml) | [us-east--xp264](../../../../actions/workflows/btp-runtime-teched-dbe7346b-88da-430a-8777-4f6aa3e22b5e-xp264.yml) | [k8s-data-context-student](../../../../actions/workflows/k8s-data-context-student.yml)
| [xp264-000](https://url.sap/v2dn5g) | [<img src="../landscape/xp264-000/kyma_dashboard_url_xp264_000.png" width="50" />](https://url.sap/9waari ) | [xp264-000--admin](../../../../actions/workflows/xp264-000-teched-622af3fe-a2f5-4fdd-a05f-73e343aec2a5.yml) | [xp264-000--xp264](../../../../actions/workflows/xp264-000-teched-622af3fe-a2f5-4fdd-a05f-73e343aec2a5-xp264.yml) | [k8s-data-context-student](../../../../actions/workflows/k8s-data-context-student.yml)
| [uk-xp264](https://url.sap/ovbfn6) | [<img src="../landscape/uk-xp264/kyma_dashboard_url_uk_xp264.png" width="50" />](https://url.sap/3wchu2 ) | [uk-xp264--admin](../../../../actions/workflows/uk-xp264-teched-76f46b5b-d9ab-486f-8e4f-12e1163af943.yml) | [uk-xp264--xp264](../../../../actions/workflows/uk-xp264-teched-76f46b5b-d9ab-486f-8e4f-12e1163af943-xp264.yml) | [k8s-data-context-student](../../../../actions/workflows/k8s-data-context-student.yml)


</div>  
</td>
</tr>
</tbody>
</table>  


Explanation. What has happened?
----------
- You have manually triggered the pre-configured CI/CD automation workflows.
- Workflows execution is divided into steps. Each step represents a dedicated task.
- Diagnostic data collection from kyma clusters is done using both Kyma CLI and with several Terraform providers, namely:
  * SAP BTP TF provider
  * kubernetes provider 
  * kubectl provider

👉 Inspect the steps of each of the worklow you have run, for instance:

<table style="width: 100%; border-collapse: collapse; background-color: #f5f5f5;" border="1">
<tbody>
<tr style="height: 193px;">
<td style="width: 71.6%; height: 193px;">
<div>
  - admin and students flows
<h1><a href="https://url.sap/0ysrs1">
<p float="left">
  <img src="../ex1/images/japan-east--admin.png" width="450" height="600"/>
  <img src="../ex1/images/japan-east--student.png" width="450" height="600"/>
  <img src="../ex1/images/japan-east--admin-summary.png" width="450" height="800"/> 
  <img src="../ex1/images/japan-east--student-summary.png" width="450" height="800"/> 
</p>
</a></h1>
</div>

<div>
  - diagnostic data (namespaced) flow
<h1><a href="https://url.sap/0ysrs1">
<p float="left">
  <img src="../ex1/images/k8s-data-context-student.png" width="450" height="600"/>
  <img src="../ex1/images/k8s-data-context-student-summary.png" width="450" height="600"/> 
  <img src="../ex1/images/k8s-data-context-student-details.png" height="800"/> 
</p>
</a></h1>
</div>

</td>
</tr>
</tbody>
</table> 

> [!IMPORTANT]
> Good to know:
> - The security is paramount!  
> - The automated workflows leverage the dynamic OIDC credentials with Github Actions acting as the OIDC token provider in the context of a running job.  
> - Thus, there is no need to have any static credentials or be compelled to use a vault.  
> - The implemented mechanism ensures the credentials are rotated automatically which makes it suitable for long running pipelines as well.  


> [!NOTE]
> **In a nutshell, the automation workflow offer the following features and benefits:**
>
>  - 🔐 built-in GitHub's OIDC token trust for secure authentication
>  - ⚙️ easy setup of your Kubernetes kubeconfig with a single or multiple cluster contexts
>  - 🚀 can run kubectl and helm commands in your workflow
>  - 🚀 can run kyma cli commands in your workflow
>  - 🚀 can run terraform automation flows in your workflow
>
> **Benefits:**
>
>  - ✅ No need to store Kubernetes credentials as secrets
>  - ✅ Enhanced security through short-lived tokens
>  - ✅ Automatic token rotation
>  - ✅ Fine-grained access control

📖 Learn more: [Using GitHub Actions OpenID Connect in Kubernetes](https://blogs.sap.com/2022/09/23/using-github-actions-openid-connect-in-kubernetes/)




## Exercise 1.3 - Zoom on Kyma CLI (optional)

In a nutshell, Kyma CLI extends the capabilities of the ubiquitous kubectl CLI against a range of kyma specific features.  

> [!TIP]
> Good to know: 
> - It is already pre-installed on the teched laptops and can be used from either a terminal window or VSCode integrated terminal
> - It is also available out-of-the-box in the automation workflows prepared for this session.
> - It is available for [installation](https://github.com/marketplace/actions/setup-kyma-cli) in the github CI/CD pipelines from the [github actions marketplace](https://github.com/marketplace?query=kyma).  

> [!NOTE]
>
> 👉 run `kyma version`
> 
> ```
> Kyma-CLI Version: 3.2.0
> ```
>
> 👉 run `kyma -h`
> ~~~rust
> kyma -h     
> Use this command to manage Kyma modules and resources on a cluster.
>
> Usage:
>  kyma [command]
>
> Available Commands:
>  alpha       Groups command prototypes for which the API may still change
>  app         Manages applications on the Kubernetes cluster
>  completion  Generate the autocompletion script for the specified shell
>  function    A set of commands for managing Functions
>  help        Help about any command
>  module      Manages Kyma modules
>  version     Displays the version of Kyma CLI
>
> Flags:
>  -h, --help                    Help for the command
>      --kubeconfig string       Path to the Kyma kubeconfig file
>      --show-extensions-error   Prints a possible error when fetching extensions fails
>      --skip-extensions         Skip fetching extensions from the target Kyma environment
>
> Use "kyma [command] --help" for more information about a command.
> ~~~

Practice:

> [!NOTE]
> - 👉 Let's leverage the kyma cli to get simple metadata from a kyma cluster...  
> - 👉 run `kyma alpha diagnose -f json | jq '.metadata'`
>
> ~~~rust
> {
>  "globalAccountID": "4c526f8b-cca9-4837-8b43-87824e3a4d10",
>  "subaccountID": "5524c764-8893-4530-8eb8-feb9e6110f16",
> ............
> }
> ~~~
> - 👉 run and explore `kyma alpha diagnose -f json | jq '.nodes[] | tojson'`

> [!TIP]
>  * Let's use the above information to build the deep link to the BTP subaccount with the kyma runtime environment.  
>  * Use the link to inspect the BTP side of the kyma house....
>  * Goto the [landscape dashboard](https://url.sap/3kf0ol) and choose the right environment...
>  * Scramble the kyma runtime environment with the BTP Provisioning Service REST APIs


- 👉 Last but not least, get familiar with the other *kyma cli* [commands](https://github.com/kyma-project/cli/tree/3.2.0/docs/user/gen-docs)... 

## Exercise 1.4 - Fire-fighter access to your kyma cluster

As usual, in case of fire, one needs well designated escape routes!  

There are mutliple ways to gain access to a kyma cluster in XP264 session landscape, namely:
- from a kyma dashboard (console)
- from a terminal window using the downloaded user OIDC kubeconfig with either `kubectl` and/or `kyma CLI`
- from within a github action diagnostic workflow that comprises the embeded terraform automation (the preferred way)


The first two methods require a kubectl oidc plugin and cannot be performed in a headless context, for instance in a CI/CD pipeline or workflow.  

> [!NOTE]
>
> * For convenience, here goes the table with the links to all btp and k8s resources...  
> * You can initially download the kubeconfig from one of the links below or directly from any SAP Kyma dashboard.  
>
> | Region (BTP Cockpit) | Kubeconfig (download) | Console (dashboard) | Admin Worklow (cluster-wide) | Student Workflow (namespaced) | Data Collection Workflow (cluster-wide)
> | :--------- | :---------:  | --------- | :--------- | :------- | -----------
> | [uk-south](https://url.sap/0dd8pm) | https://url.sap/q9176k | [<img src="../landscape/uksouth/kyma-dashboard_url_uksouth.png" width="50" />](https://url.sap/x2ygbf) | [uk-south--admin](../../../../actions/workflows/uk-south-teched-7a69075f-7faf-4604-a62e-806648791dba.yml) | [uk-south--xp264](../../../../actions/workflows/uk-south-teched-7a69075f-7faf-4604-a62e-806648791dba-xp264.yml)| [ k8s-data-context](../../../../actions/workflows/k8s-data-context-teched.yml)
> | [japan-east](https://url.sap/u66itn) | https://url.sap/0nusi8 | [<img src="../landscape/japaneast/kyma_dashboard_url_japaneast.png" width="50" />](https://url.sap/0ysrs1 ) | [japan-east--admin](../../../../actions/workflows/japan-east-teched-2a6fe480-ac84-4751-ad37-56ec2a493932.yml) | [japan-east--xp264](../../../../actions/workflows/japan-east-teched-2a6fe480-ac84-4751-ad37-56ec2a493932-xp264.yml) | [k8s-data-context](../../../../actions/workflows/k8s-data-context-teched.yml)
> | [us-east](https://url.sap/b24wtp) | https://url.sap/57qy47 | [<img src="../landscape/useast/kyma_dashboard_url_useast.png" width="50" />](https://url.sap/ui217f) | [us-east--admin](../../../../actions/workflows/btp-runtime-teched-dbe7346b-88da-430a-8777-4f6aa3e22b5e.yml) | [us-east--xp264](../../../../actions/workflows/btp-runtime-teched-dbe7346b-88da-430a-8777-4f6aa3e22b5e-xp264.yml) | [k8s-data-context](../../../../actions/workflows/k8s-data-context-teched.yml)
> | [xp264-000](https://url.sap/v2dn5g) | https://url.sap/jdleyl | [<img src="../landscape/xp264-000/kyma_dashboard_url_xp264_000.png" width="50" />](https://url.sap/9waari ) | [xp264-000--admin](../../../../actions/workflows/xp264-000-teched-622af3fe-a2f5-4fdd-a05f-73e343aec2a5.yml) | [xp264-000--xp264](../../../../actions/workflows/xp264-000-teched-622af3fe-a2f5-4fdd-a05f-73e343aec2a5-xp264.yml) | [k8s-data-context](../../../../actions/workflows/k8s-data-context-teched.yml)
> | [uk-xp264](https://url.sap/ovbfn6) |https://url.sap/tyapw7 | [<img src="../landscape/uk-xp264/kyma_dashboard_url_uk_xp264.png" width="50" />](https://url.sap/3wchu2 ) | [uk-xp264--admin](../../../../actions/workflows/uk-xp264-teched-76f46b5b-d9ab-486f-8e4f-12e1163af943.yml) | [uk-xp264--xp264](../../../../actions/workflows/uk-xp264-teched-76f46b5b-d9ab-486f-8e4f-12e1163af943-xp264.yml) | [k8s-data-context](../../../../actions/workflows/k8s-data-context-teched.yml)

> [!TIP]
> 
> - Relying on a user-OIDC kubeconfig is not very convenient due to the periodic redirects that may cause timeouts, even if used in a terminal window.

Practice:
- 👉 Create a permenent or temporary service account based kubeconfig (with uk-south)
- 👉 Choose the uk-south tile or click on the provided deep link

```
kyma alpha kubeconfig generate --serviceaccount kyma-cli-sa --clusterrole cluster-admin --namespace default --permanent  --kubeconfig ~/.kube/kubeconfig--garden-kyma--<shoot>-external.yaml
```
or

```
kyma alpha kubeconfig generate --serviceaccount kyma-cli-sa --clusterrole cluster-admin --namespace default --time 1h  --kubeconfig ~/.kube/kubeconfig--garden-kyma--<shoot>-external.yaml
```


> ~~~rust
> apiVersion: v1
> clusters:
> - cluster:
>    certificate-authority-data: LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSUQ1ekNDQWsrZ0F3SUJBZ0lSQUt3bWpnd1VwQTQ5Rkw2Mkp3Zm56Y2d3R****lGSUNBVEUtLS0tLQo=
>    server: https://api.<shoot>.kyma.ondemand.com
>  name: garden-kyma--<shoot>-external
> contexts:
> - context:
>    cluster: garden-kyma--<shoot>-external
>    namespace: default
>    user: kyma-cli-sa
>  name: garden-kyma--<shoot>-external
> current-context: garden-kyma--<shoot>-external
> kind: Config
> preferences: {}
> users:
> - name: kyma-cli-sa
>  user:
>    token: eyJhbGciOiJSUzI1NiIsImtpZCI6IlRvQlNSVXRhekVNQWpLaE11SF9Ga0lrUUlCTG5ZQUV3dk9wc3Z5czJZR2MifQ.***
> ~~~


```
kyma alpha kubeconfig generate --serviceaccount kyma-cli-sa --clusterrole cluster-admin --namespace default --permanent  --kubeconfig ~/.kube/kubeconfig--garden-kyma--<shoot>-external.yaml > ~/.kube/kubeconfig--<shoot>.yaml
```

```
kyma alpha kubeconfig generate --serviceaccount xp264-000-sa  --namespace xp264-000 --permanent  --kubeconfig ~/.kube/kubeconfig--garden-kyma--<shoot>-external.yaml
```

  * read-only access in a given namespace

```
kyma alpha kubeconfig generate --serviceaccount kyma-cli-view-sa  --namespace default --permanent --clusterrole view --kubeconfig ~/.kube/kubeconfig--garden-kyma--<shoot>-external.yaml
```

  * cluster-wide read-only access

```
kyma alpha kubeconfig generate --serviceaccount kyma-cli-view-sa  --namespace default --permanent --clusterrole view --cluster-wide --kubeconfig ~/.kube/kubeconfig--garden-kyma--<shoot>-external.yaml


kyma alpha kubeconfig generate --serviceaccount xp264-000-sa  --namespace xp264-000 --permanent --clusterrole view --cluster-wide --kubeconfig ~/.kube/kubeconfig--garden-kyma--<shoot>-external.yaml
```  



## Exercise 1.5 - Terraforming kyma runtime environment

Accessing other diagnostic information with btp and kubernetes terraform providers.

> [!NOTE]
> The built-in terraform automation is designed to use the very kyma cluster as its remote backend to persist the terraform state.  
> That's extremely convient as it allows to explore the gathered information at any time time and have it processed with other tools, etc...
> It could be, for instance, shared with the SAP Kyma support.




- 👉 Run the Data Collection Workflow



<table style="width: 100%; border-collapse: collapse; background-color: #f5f5f5;" border="1">
<tbody>
<tr style="height: 193px;">
<td style="width: 71.6%; height: 193px;">

<div>

```mermaid
sequenceDiagram

    Kyma Region (BTP Cockpit)-->>Data Collection Workflow (namespaced): cluster diagnostic ckeck
    Note left of Kyma Region (BTP Cockpit): Pick a region<br/>and action<br/>of your choice.
    Note left of Data Collection Workflow (namespaced): Choose a workflow<br/>and open it<br/>with the right click.


```

</div>

<div>


- 👉 For the best experience, open workflow links into a separate tab or into a new window (right click).  

 |  Data Collection Workflow (namespaced)
 | :---------  |
 | [ k8s-data-context-student](../../../../actions/workflows/k8s-data-context-student.yml)


</div>  
</td>
</tr>
</tbody>
</table>  



- 👉 Let's capitalize on the student diagnostic github action that provides a service account based kubeconfig as an artifact, as follows:


<table style="width: 100%; border-collapse: collapse; background-color: #f5f5f5;" border="1">
<tbody>
<tr style="height: 193px;">
<td style="width: 71.6%; height: 193px;">
<div> 
<h1><a href="https://url.sap/3kf0ol"><img class="aligncenter" src="images/k8s-data-context-artifacts.png" alt="" height="600"/></a></h1>
</div>
</td>
</tr>
</tbody>
</table> 


- 👉 run: `export KUBE_CONFIG_PATH=~/Downloads/kubeconfig_sa/my-kubeconfig_sa.yaml`
- 👉 run: `terraform init`

> ~~~rust       
> Initializing the backend...
>
> Successfully configured the backend "kubernetes"! Terraform will automatically
> use this backend unless the backend configuration changes.
>
>
> Terraform has been successfully initialized!
>
> ~~~

- 👉 run: `terraform workspace list`
```
* default
  k8s-context-xp264-050-c1f19148-71f7-4883-9f86-8d5ee7634dec
  k8s-context-xp264-050-xp264-050
```

- 👉 run: `terraform workspace select k8s-context-xp264-050-xp264-050`
`Switched to workspace "k8s-context-xp264-050-xp264-050".`


- 👉 run and explore: `terraform output -json  KymaModules | jq '.[] | { name: .name, version: .version}'`


## Exercise 1.6 - Subscribe to a kyma multitenant application

Here goes a diagram of the functional architecture of the solution

<table style="width: 100%; border-collapse: collapse; background-color: #f5f5f5;" border="1">
<tbody>
<tr style="height: 193px;">
<td style="width: 71.6%; height: 193px;">
<div>
<!--
<h1><a href="https://url.sap/3kf0ol"><img class="aligncenter" src="../ex0/images/functional_architecture.png" alt=""/></a></h1>
-->
<h1><a href="https://url.sap/3kf0ol"><img class="aligncenter" src="../landscape/images/d-com-multi-tenant-saas.png" alt=""/></a></h1>


```mermaid
---
title: Subscription Flow Chart
---
sequenceDiagram
    participant T as Tenant Admin
    participant BTP as SAP BTP Cockpit
    participant SR as SaaS Registry
    participant PA as Provider App
    participant XSUAA as XSUAA Service
    participant DB as Database
    
    T->>BTP: Access BTP Cockpit
    T->>BTP: Navigate to Service Marketplace
    T->>BTP: Subscribe to Multitenant App
    BTP->>SR: Create Subscription
    SR->>PA: Trigger onSubscription callback
    
    PA->>XSUAA: Create tenant-specific OAuth client
    XSUAA-->>PA: OAuth client created
    
    PA->>DB: Create tenant schema/container
    DB-->>PA: Schema created
    
    PA->>PA: Initialize tenant data
    PA-->>SR: Subscription successful
    SR-->>BTP: Subscription confirmed
    BTP-->>T: Subscription complete
    
    Note over T,DB: Tenant can now access the application
```

<hr>

```mermaid
---
title: Deployment Architecture
---
graph TB   
    subgraph "Production Provider Subaccount"
        PROD[Production k8s cluster]
        PRODAPP[Provider Application]
        SAASREG[SaaS Registry]
        APPREGISTRY[Application Registry]
    end
    
    subgraph "Production Consumer Tenants"
        subgraph "Tenant A"
            TENA[Tenant A Instance]
            DBA[Database A]
        end
        
        subgraph "Tenant B"
            TENB[Tenant B Instance]
            DBB[Database B]
        end
    end    
    
    PRODAPP --> SAASREG
    SAASREG --> TENA
    SAASREG --> TENB
    
    TENA --> DBA
    TENB --> DBB
    
    %% Styling
    classDef prod fill:#ffebee,stroke:#c62828
    classDef tenant fill:#e3f2fd,stroke:#1976d2   
    class PROD,PRODAPP,SAASREG,APPREGISTRY prod
    class TENA,TENB,DBA,DBB tenant

```

</div>
</td>
</tr>
</tbody>
</table>   



👉 In order to subscribe or to retrieve an existing subscription for your session user (xp264-0xx) run the following github action: 

| Run Subscription workflow | Retrieve the subscription URL | Retrieve the consumer tenant URL
| -------- | ------------- | ----------
[teched-xp264-mt](../../../../actions/workflows/teched-xp264-mt.yml) | [subscription URL](https://url.sap/yqpkvr) | [consumer tenant URL](https://url.sap/esb19m)



<table style="width: 100%; border-collapse: collapse; background-color: #f5f5f5;" border="1">
<tbody>
<tr style="height: 193px;">
<td style="width: 71.6%; height: 193px;">
<div>
<h1><a href="https://url.sap/yqpkvr">
<p float="left">
  <img src="../ex1/images/subscription-job.png" width="450" height="600"/>
  <img src="../ex1/images/subscription-manifest.png" width="450" height="600"/>
  <img src="../ex1/images/subscription-url.png" /> 
</p>
</a></h1>
</div>
</td>
</tr>
</tbody>
</table> 


<table style="width: 100%; border-collapse: collapse; background-color: #f5f5f5;" border="1">
<tbody>
<tr style="height: 193px;">
<td style="width: 71.6%; height: 193px;">
<div>
<h1><a href="https://url.sap/yqpkvr">
<p float="left">
  <img src="../ex1/images/subscribed-app.png" height="800"/> 
</p>
</a></h1>
</div>
</td>
</tr>
</tbody>
</table> 

Good to know:
- There is a single subscription in each consumer tenant (a BTP subaccount)
- All students users as a group can access every subscription in each consumer tenant...
- However, the access to the subscribed app is SSO-ringfenced...
- All the subsciptions can be viewed from the subscription dashboard on the provider side...
- The workflow can be used to unsubscribe. If you choose to do it, please make sure you use the allocated students name.


- If this happens to be a first time subscription, please let me go the consumer tenant and disable the SAP IDS for user logon, as depicted below:

<table style="width: 100%; border-collapse: collapse; background-color: #f5f5f5;" border="1">
<tbody>
<tr style="height: 193px;">
<td style="width: 71.6%; height: 193px;">
<div>
<h1><a href="https://url.sap/esb19m">
<p float="left">
  <img src="../ex1/images/Default-identity-provider.png" width="450" height="600"/>
  <img src="../ex1/images/Default-identity-provider-edit.png" width="450" height="600"/>
  <img src="../ex1/images/Default-identity-provider-save.png" /> 
</p>
</a></h1>
</div>
</td>
</tr>
</tbody>
</table> 

- Please observe the consumer context is very much empty. The consumer subaccount acts as a service provider ensuring user authentication and permissions validation in order to access the subscription.


<table style="width: 100%; border-collapse: collapse; background-color: #f5f5f5;" border="1">
<tbody>
<tr style="height: 193px;">
<td style="width: 71.6%; height: 193px;">
<div>
<h1><a href="">
<p float="left">
  <img src="../ex1/images/subscription-mgmt.png" width="450" />
  <img src="../ex1/images/subscription-mgmt-tenant-details.png" width="450" />
  <img src="../ex1/images/subscription-mgmt-tenant-dependencies.png" /> 
</p>
</a></h1>
</div>
</td>
</tr>
</tbody>
</table> 

## Summary

- The automation workflows provide ease of use with the emphasis on both security and on lowering the cost of the run with the Day-2 operations
- The Day-1 self-generated automation workflows templates facilitate the Day-2 operations and allow for targeted extensions of the built-in flows.


Continue to - [Exercise 2 - Use External Scalers. Keda](../ex2/README.md)

