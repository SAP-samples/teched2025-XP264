# Exercise 5 - Configure Transparent Proxy Kyma Module

In this exercise, you will _configure_ Transparent Proxy as module in Kyma. This will allow you to _locally_ consume destinations (managed centrally in SAP BTP Destination service) from within the Kyma instance, and technically connect to any remote system in a _simple_, _unified_ and _virtually transparent_ way.

> [!NOTE]
> _Configuring_ the module is relevant for both Day-1 and Day-2 Operations. Usually, modules are expected to be _configured_ during Day-1 Operations. However, this can be done also in later point in time during Day-2 Operations, for example, you already have up-and-running Kyma instance and productive application workload, but you're performing troubleshooting activities as showcased in [Exercise 6 - Use Transparent Proxy Kyma Module](../ex6#exercise-6---use-transparent-proxy-kyma-module).

## Exercise 5.1 Navigate to your working Namespace in Kyma Dashboard

In the home page of Kyma Dashboard, navigate to your working Namespace.

> [!NOTE]
> Use your student-specific namespace, for example, ```xp264-001```. ```quovadis-btp``` namespace is used in the screenshots and command samples for reference reasons only.

1. Navigate to the Namespaces Overview
<br>![](/exercises/ex5/images/T2_01_01.png)

2. Select your working Namespace:
<br>![](/exercises/ex5/images/T2_01_02.png)

3. You see an overview of your Namespace
<br>![](/exercises/ex5/images/T2_01_03.png)

## Exercise 5.2 Create a _dynamic_ Destination Custom Resource

In the home page of the Namespace of your choice, you can see Connectivity section, and under it you find Destination CR. Latter are used to formally expose and reference the destinations - either statically via dedicated or _static_ CRs or dynamically via _dynamic_ (gateway) CR.

1. Click here to create a new dynamic Destination CR
<br>![](/exercises/ex5/images/T2_02_01.png)

2. The actual Destination CR creation. In this example, the Destination CR is a _dynamic_ one used to reference any destination that is accessible in the context of the account in use by Transparent Proxy based on the applied configuration.
<br>![](/exercises/ex5/images/T2_02_02.png)

3. Overview of the available Destination CRs
<br>![](/exercises/ex5/images/T2_02_03.png)
<br>![](/exercises/ex5/images/T2_02_04.png)

## Exercise 5.3 Create a _static_ Destination Custom Resource

In the home page of the Namespace of your choice, you can see Connectivity section, and under it you find Destination CR. Latter are used to formally expose and reference the destinations - either statically via dedicated or _static_ CRs or dynamically via _dynamic_ (gateway) CR.

1. Click here to create a new _static_ Destination CR
<br>![](/exercises/ex5/images/T2_03_01.png)

2. The actual Destination CR creation. In this example, the Destination CR is a _static_ one used to reference a specific destination that is accessible in the context of the account in use by Transparent Proxy based on the applied configuration.
<br>![](/exercises/ex5/images/T2_03_02.png)

3. Overview of the available Destination CRs
<br>![](/exercises/ex5/images/T2_03_03.png)
<br>![](/exercises/ex5/images/T2_03_04.png)

## Exercise 5.4 Explore the results of the creation of the Destination CRs via Kubectl

<details>
<summary>💡 <b>If you prefer using web interface</b>, expand here and follow</summary>
<br></br>
In Kyma Dashboard, within your target namespace:

1. Navigate to ```Connectivity``` &rarr; ```Destination CRs``` and select the items and explore the status and details
2. Navigate to ```Discovery and Network``` &rarr; ```Services```. You'd see ```Kubernetes Service``` items for each of the available Destination CRs.
</details>

> [!TIP]
> On your Windows based student laptop, you can use wither ```Windows PowerShell``` or ```Viual Studio Code``` to get access to the terminal.

> [!IMPORTANT]
> The execution of this exercise requires you to have previosly perforem 
[Exercise 1.4 - Fire-fighter access to your kyma cluster](../ex1#exercise-14---fire-fighter-access-to-your-kyma-cluster). Once done, ```kubeconfig``` YAML file should be already available in the ```Downloads``` folder, e.g. ```C:\Users\<pc-specific-user-here>\Downloads\kubeconfig.yaml```

1. Explore Destination CRs via Terminal and Kubectl Command Line Tool
```
kubectl get destinations -n quovadis-btp
NAME      AGE     DESTINATIONREF   FRAGMENTREF   DESTINATIONSERVICEINSTANCENAME   SERVICEPORT   ACCESSCONTROLSCOPE   STATUS                    CHAINREF
gateway   4d4h    *                                                                                                  ConfigurationSuccessful   
s4any     6m39s   s4-anywhere                                                                                        ConfigurationSuccessful   
```
2. Explore available Kubernetes Services via Terminal and Kubectl Command Line Tool
```
kubectl get services -n quovadis-btp
NAME      TYPE           CLUSTER-IP   EXTERNAL-IP                                               PORT(S)   AGE
gateway   ExternalName   <none>       gateway-x4rf8.sap-transp-proxy-system.svc.cluster.local   <none>    4d4h
s4any     ExternalName   <none>       s4any-5cmhg.sap-transp-proxy-system.svc.cluster.local     <none>    7m11s
```
<br></br>
> [!IMPORTANT]
> For each ```Kuberenetes Service``` associated with a BTP ```destination```, the Transparent Proxy will invisibly but securely handle the traffic sent to the ```Service``` and hide the relevant technical complexity via automating technical connectivity flows and enchancing the requests with needed artefacts. You'd further try it yourself in the next exercise.

<details>
<summary>💡 <b>In case of problems</b> with command line environment, expand here and follow</summary>
<br></br>
You need to download the ```kubeconfig``` YAML file and configure ```kubectl``` to use it, so that you could execute commands against your target Kyma instance.

0.1. Download ```kubeconfig``` YAML file via BTP Cockpit, see [Exercise 1.1 - Easy access to your teched landscape with SSO.](../ex1#exercise-11---easy-access-to-your-teched-landscape-with-sso)

0.2. Open a new ```Windows PowerShell``` or ```Visual Studio Code``` window **as Administrator** via simply typing ```powershell``` or ```vscode``` in the ```Search``` feature of Windows, then right click on ```Windows PowerShell``` or ```Visual Studio Code``` app and choose the option ```Run as administrator```.

0.3. Set the ```KUBECONFIG``` environment variable
```
$env:KUBECONFIG = "C:\Users\<pc-specific-user-here>\Downloads\kubeconfig.yaml"
```
0.4. Validate the access to the Kyma instance

Execute the following command and explore the output is not empty and shows cluster details
```
kubectl config view
```
For example (disclaimer: the below output is intentionally stripped out for simplicity reasons):
```
apiVersion: v1
clusters:
- cluster:
    certificate-authority-data: DATA+OMITTED
    server: https://api.c-13f520f.kyma.ondemand.com
  name: garden-kyma--c-13f520f-external
contexts:
- context:
    cluster: garden-kyma--c-13f520f-external
    user: garden-kyma--c-13f520f-external
  name: garden-kyma--c-13f520f-external
current-context: garden-kyma--c-13f520f-external
kind: Config
preferences: {}
users:
- name: garden-kyma--c-13f520f-external
...
```

Execute the following command and explore the output:
```
kubectl get pods
```
The command may initiate browser based login to establish SSO login for the ```kubectl``` tool. Follow the browser to conduct the login, and then go back to the terminal (PowerShell).

Here's an example output:
```
NAME                           READY   STATUS    RESTARTS   AGE
httpbin-app-5958c987d6-7vptn   2/2     Running   0          12d
```

0.2. (Optional) In case for some reason the ```kubectl``` complains that either ```krew``` or ```kubelogin``` is not installed, run this:

Trigger the installation of ```krew```:
```
krew install krew
```

Install ```kubelogin``` plugin for the ```kubectl``` tool. This is needed for enabling ```kubectl``` effectively use the technical credentials being part of the ```kubeconfig``` YAML file and your user context for SSO login into the Kyma instance:
```
kubectl krew install oidc-login
```
</details>


## Summary

You've now <b>configured</b> the Transparent Proxy via dynamic (gateway) Destination CR. It is simple and straightforward. As result, remote systems defined as destinations are made locally accessible via leveraging Kuberenetes Service resources and the associated technical complexity is handled transparently by the Transparent Proxy.

Practically, you've <b>enabled</b> local workloads to technically connect to any remote system defined as a destination in Destination service in a unified, virtually transparent way. Or course, for security reasons, the usage of destinations is scoped in the context of the account in use by Transparent Proxy based on the applied module configuration

Continue to - [Exercise 6 - Use Transparent Proxy Kyma Module ](../ex6/README.md)

## References
* [Connectivity in the Kyma Environment](https://help.sap.com/docs/CP_CONNECTIVITY/cca91383641e40ffbe03bdc78f00f681/7501fbc9aebd4e3180eddec977ca288d.html)
* [Transparent Proxy in the Kyma Environment](https://help.sap.com/docs/CP_CONNECTIVITY/cca91383641e40ffbe03bdc78f00f681/1700cfe070704d2e80aa76de1033a6c4.html)
* [Transparent Proxy - Configuration Guide](https://help.sap.com/docs/CP_CONNECTIVITY/cca91383641e40ffbe03bdc78f00f681/2a22cd7872964e6a9ceb5af72920cfd0.html)
* [Transparent Proxy - Operator](https://help.sap.com/docs/CP_CONNECTIVITY/cca91383641e40ffbe03bdc78f00f681/2d826aa388524bb8804223b5e2a31968.html)
* [Transparent Proxy - Integration with SAP BTP Connectivity](https://help.sap.com/docs/CP_CONNECTIVITY/cca91383641e40ffbe03bdc78f00f681/aa9fc26f0c74495ea91612994016eaed.html)
* [Transparent Proxy - Troubleshooting](https://help.sap.com/docs/CP_CONNECTIVITY/cca91383641e40ffbe03bdc78f00f681/fce292aeb9e24b7abd47c0b38f6fe8a9.html)
