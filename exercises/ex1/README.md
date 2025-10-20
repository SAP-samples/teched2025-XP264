# Exercise 1 - Get your hands dirty with kyma CLI

Quoting after [Kyma CLI | SAP Help](https://help.sap.com/docs/btp/sap-business-technology-platform/kyma-cli):  

> Kyma CLI is an essential tool for application developers who want to get started quickly and efficiently with SAP BTP, Kyma runtime. Designed to streamline workflows, it simplifies complex tasks, enabling developers to deploy and manage applications easily.


```
kyma version
Kyma-CLI Version: 3.2.0
```

```
kyma -h     
Use this command to manage Kyma modules and resources on a cluster.

Usage:
  kyma [command]

Available Commands:
  alpha       Groups command prototypes for which the API may still change
  app         Manages applications on the Kubernetes cluster
  completion  Generate the autocompletion script for the specified shell
  function    A set of commands for managing Functions
  help        Help about any command
  module      Manages Kyma modules
  version     Displays the version of Kyma CLI

Flags:
  -h, --help                    Help for the command
      --kubeconfig string       Path to the Kyma kubeconfig file
      --show-extensions-error   Prints a possible error when fetching extensions fails
      --skip-extensions         Skip fetching extensions from the target Kyma environment

Use "kyma [command] --help" for more information about a command.
```

Please get familiar with the available [commands](https://github.com/kyma-project/cli/tree/3.2.0/docs/user/gen-docs)... 

## Exercise 1.1 - Fire-fighter access to your kyma cluster

Option 1. 

  * Download the OIDC kubeconfig from the kyma dashboard.  

  This method requires a kubectl oidc plugin (already pre-installed) and cannot be performed from a headless context, for instance from a CI/CD pipeline or workflow.  

  Access SAP Kyma dashboard.  
  You can use the easy navigation landscape dashboard with your allocated student's user name or use one of the kyma dashboard deep links below:


  | region | KubeconfigURL (download) | Console URL (dashboard) | Admin Worklow | Student Workflow | Terraform data-only Workflow
 | :--------- | :---------:  | --------- | :--------- | :------- | -----------
 | [uk-south](https://emea.cockpit.btp.cloud.sap/cockpit?idp=anuk8cmfw.accounts.ondemand.com#/globalaccount/c1f19148-71f7-4883-9f86-8d5ee7634dec/subaccount/4457fb7f-3296-40cf-b66b-aac3d9d4a2b2{:target="_blank"}) | https://url.sap/q9176k | [![](../landscape/uksouth/kyma-dashboard_url_uksouth.png)](https://dashboard.kyma.cloud.sap/?kubeconfigID=6D0AF763-179E-4F84-8ED0-724B3C0C2C92) | [uk-south--admin](../../../../actions/workflows/uk-south-teched-7a69075f-7faf-4604-a62e-806648791dba.yml) | |
 | [japan-east](https://emea.cockpit.btp.cloud.sap/cockpit?idp=anuk8cmfw.accounts.ondemand.com#/globalaccount/c1f19148-71f7-4883-9f86-8d5ee7634dec/subaccount/cae18034-657b-478d-89f7-b802b8111cd0) | https://url.sap/0nusi8 | [![](../landscape/japaneast/kyma_dashboard_url_japaneast.png)](https://dashboard.kyma.cloud.sap/?kubeconfigID=79EB720B-2C16-4A7E-AA7F-108C4E3B7E98 ) | [japan-east--admin](../../../../actions/workflows/japan-east-teched-2a6fe480-ac84-4751-ad37-56ec2a493932.yml) | |
 | [us-east](https://emea.cockpit.btp.cloud.sap/cockpit?idp=anuk8cmfw.accounts.ondemand.com#/globalaccount/c1f19148-71f7-4883-9f86-8d5ee7634dec/subaccount/831741eb-0b10-4d2c-9feb-c49afec286f5) | https://url.sap/57qy47 | [![](../landscape/useast/kyma_dashboard_url_useast.png)](https://dashboard.kyma.cloud.sap/?kubeconfigID=72A4A32B-0D0A-47DE-90C9-A65D52C8ADBE) | [us-east--admin](../../../../actions/workflows/) | |
 | [xp264-000](https://emea.cockpit.btp.cloud.sap/cockpit?idp=anuk8cmfw.accounts.ondemand.com#/globalaccount/c1f19148-71f7-4883-9f86-8d5ee7634dec/subaccount/20b6061c-64aa-4397-bc01-df7348704173) | https://url.sap/jdleyl | [![](../landscape/xp264-000/kyma_dashboard_url_xp264_000.png)](https://dashboard.kyma.cloud.sap/?kubeconfigID=B427F082-0D0C-4657-9D99-56629CC03CF6 ) | [xp264-000--admin](../../../../actions/workflows/xp264-000-teched-622af3fe-a2f5-4fdd-a05f-73e343aec2a5.yml) | |
 | [uk-xp264]() |https://url.sap/tyapw7 | [![](../landscape/uk-xp264/kyma_dashboard_url_uk_xp264.png)](https://dashboard.kyma.cloud.sap/?kubeconfigID=0FD84322-535C-4047-89CE-47FC775938FC ) | [uk-xp264--admin](../../../../actions/workflows/uk-xp264-teched-76f46b5b-d9ab-486f-8e4f-12e1163af943.yml) |  |


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

  * Create a permenent or temporary service account based kubeconfig (with uk-south)
  Choose the uk-south tile or click on the provided deep link

```
kyma alpha kubeconfig generate --serviceaccount kyma-cli-sa --clusterrole cluster-admin --namespace default --permanent  --kubeconfig ~/.kube/kubeconfig--garden-kyma--a896778-external.yaml


kyma alpha kubeconfig generate --serviceaccount kyma-cli-sa --clusterrole cluster-admin --namespace default --time 1h  --kubeconfig ~/.kube/kubeconfig--garden-kyma--a896778-external.yaml

apiVersion: v1
clusters:
- cluster:
    certificate-authority-data: LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSUQ1ekNDQWsrZ0F3SUJBZ0lSQUt3bWpnd1VwQTQ5Rkw2Mkp3Zm56Y2d3RFFZSktvWklodmNOQVFFTEJRQXcKRFRFTE1Ba0dBM2ovNzZqWjdXei9BQU9PT2pjUzZVUnRRY0tSellIckRlZlVGdVJXUEVxWkRXTmxBPT0KLS0tLS1FTkQgQ0VSVElGSUNBVEUtLS0tLQo=
    server: https://api.a896778.kyma.ondemand.com
  name: garden-kyma--a896778-external
contexts:
- context:
    cluster: garden-kyma--a896778-external
    namespace: default
    user: kyma-cli-sa
  name: garden-kyma--a896778-external
current-context: garden-kyma--a896778-external
kind: Config
preferences: {}
users:
- name: kyma-cli-sa
  user:
    token: eyJhbGciOiJSUzI1NiIsImtpZCI6IlRvQlNSVXRhekVNQWpLaE11SF9Ga0lrUUlCTG5ZQUV3dk9wc3Z5czJZR2MifQ.***
```


```
kyma alpha kubeconfig generate --serviceaccount kyma-cli-sa --clusterrole cluster-admin --namespace default --permanent  --kubeconfig ~/.kube/kubeconfig--garden-kyma--a896778-external.yaml > ~/.kube/kubeconfig--a896778.yaml


kyma alpha kubeconfig generate --serviceaccount xp264-000-sa  --namespace xp264-000 --permanent  --kubeconfig ~/.kube/kubeconfig--garden-kyma--a896778-external.yaml
```

  * read-only access in a given namespace

```
kyma alpha kubeconfig generate --serviceaccount kyma-cli-view-sa  --namespace default --permanent --clusterrole view --kubeconfig ~/.kube/kubeconfig--garden-kyma--a896778-external.yaml
```

  * cluster-wide read-only access

```
kyma alpha kubeconfig generate --serviceaccount kyma-cli-view-sa  --namespace default --permanent --clusterrole view --cluster-wide --kubeconfig ~/.kube/kubeconfig--garden-kyma--a896778-external.yaml


kyma alpha kubeconfig generate --serviceaccount xp264-000-sa  --namespace xp264-000 --permanent --clusterrole view --cluster-wide --kubeconfig ~/.kube/kubeconfig--garden-kyma--a896778-external.yaml
```  




2.	Insert this line of code.
```abap
response->set_text( |Hello World! | ). 
```



## Exercise 1.2 - Getting to know your kyma cluster

Let's leverage the kyma cli to get simple metadata

```
kyma alpha diagnose -f json | jq '.metadata'
{
  "globalAccountID": "4c526f8b-cca9-4837-8b43-87824e3a4d10",
  "subaccountID": "5524c764-8893-4530-8eb8-feb9e6110f16",
  "clusterID": "eef5b822-8f8f-4d08-af05-f26aafe252b8",
  "clusterDomain": "a416537.stage.kyma.ondemand.com",
  "region": "uksouth",
  "shootName": "a416537",
  "provider": "azure",
  "kubernetesVersion": "1.33.3",
  "natGatewayIPs": [
    "172.167.242.76,",
    "172.187.130.162,",
    "172.187.211.228"
  ],
  "gardenerExtensions": [
    "shoot-auditlog-service",
    "shoot-cert-service",
    "shoot-dns-service",
    "shoot-lakom-service",
    "shoot-networking-filter",
    "shoot-networking-problemdetector",
    "shoot-oidc-service"
  ],
  "kubeAPIServer": "https://api.a416537.stage.kyma.ondemand.com"
}
```

  * Let's use the above information to build the deep link to the BTP subaccount with the kyma runtime environment.  
  * Use the link to inspect the BTP side of the kyma house....
  * Goto the [landscape dashboard](https://url.sap/3kf0ol) and choose the right environment...
  * Scramble the kyma runtime environment with the BTP Provisioning Service REST APIs

```
kyma alpha diagnose -f json | jq '.nodes[] | tojson'

"{\"machineInfo\":{\"name\":\"shoot--kyma-stage--a416537-cpu-worker-0-z1-69d94-hd29q\",\"architecture\":\"amd64\",\"kernelVersion\":\"6.12.47-cloud-amd64\",\"osImage\":\"Garden Linux 1877.4\",\"containerRuntime\":\"containerd://2.1.4\",\"kubeletVersion\":\"v1.33.3\",\"operatingSystem\":\"linux\"},\"capacity\":{\"cpu\":\"4\",\"memory\":\"16384092Ki\",\"eph
```

After completing these steps you will have...

1.	Enter this code.
```
apiVersion: gateway.kyma-project.io/v2
kind: APIRule
metadata:

  name: httpbin-xp264-050
  namespace: xp264-050

spec:
  gateway: kyma-system/kyma-gateway
  hosts:
    - httpbin-xp264-050
  rules:
    - methods:
        - GET
        - POST
        - PUT
        - DELETE
        - PATCH
      noAuth: true
      path: /*
  service:
    name: httpbin-xp264-050
    namespace: xp264-050
    port: 80
  timeout: 300

```

duplicate it to

```
apiVersion: gateway.kyma-project.io/v2
kind: APIRule
metadata:

  name: httpbin-xp264-050-aws-route53-dns
  namespace: xp264-050

spec:
  gateway: aws-route53-dns/quovadis-aws-route53-dns-gateway
  hosts:
    - httpbin-xp264-050.btp-quovadis-d726db6d.quovadis.kyma.dev.sap
  rules:
    - methods:
        - GET
        - POST
        - PUT
        - DELETE
        - PATCH
      noAuth: true
      path: /*
  service:
    name: httpbin-xp264-050
    namespace: xp264-050
    port: 80
  timeout: 300


```
## Exercise 1.3 - Getting diagnostic information with terraform

Run the following github action: 


## Exercise 1.5 - BTP multitenancy with kyma


2.	Click here.
<br>![](/exercises/ex1/images/01_02_0010.png)


## Summary

You've now ...

Continue to - [Exercise 2 - Exercise 2 Description](../ex2/README.md)

