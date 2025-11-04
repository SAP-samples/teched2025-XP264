# Exercise 4 - Explore SAP BTP Connectivity Capabilities in Kyma

In this exercise, you will _explore_ the technical connectivity capabilities in Kyma. This will give you context on what's generally possible and what's relevant to Day-2 operations as in Kyma there are several Kyma Modules which can be enabled, configured and used to facilitate your needs in the realm of hybrid technical connectivity. You're focus more on those being integral part of SAP BTP Connectivity capability.

> [!NOTE]
> Use your student-specific BTP account and Kyma namespace, for example, ```xp264-001```. ```quovadis-btp``` namespace is used in the screenshots and command samples for reference reasons only.

## Exercise 4.1 - Overview of the Kyma Modules

1. Navigate To The Kyma Dashboard

Once working with BTP cockpit and navigated to the account overview page, you can switch the working context to the Kyma Dashboard
- Click here.
<br>![](/exercises/ex4/images/T1_01_01.png)
- As result, you're navigated to the Kyma Dashbaord:
<br>![](/exercises/ex4/images/T1_01_02.png)

2. In the home page of the Kyma Dashabord, you can see an overview of the Kyma instance, for example, health status, important metadata, and link to the modules.
- Click here to navigate to the Modules
<br>![](/exercises/ex4/images/T1_02_01.png)
- Below is the list of currently available Kyma Modules
<br>![](/exercises/ex4/images/kyma-modules-overview.png)

2. Module Delivery Channels

[Delivery channels](https://help.sap.com/docs/BTP/65de2977205c403bbc107264b8eccf4b/95a410144d7c449687c957da0cc43a0d.html) are used to control how fast you'd like the modules to be udpated to newly released versions:
- **fast** for the early adopters of new features or, e**specially relevant for Day-2 Operations** - in the cases of emergency need for applying _bugfixes_ or _hotfixes_
- **regular** for standard delivery for _new features_ and _bugfixes_

Once navigated in the Kyma Modules overview, click on Edit button.
- Click here.
<br>![](/exercises/ex4/images/kyma-modules-overview-click-edit.jpg)

- You can now edit the delivery channel for all the modules. Here's how to change the delivery channel for Transparent Proxy module to _Fast_ or _Regular_.
<br>![](/exercises/ex4/images/kyma-modules-channels-tp.png)

> [!IMPORTANT]
> Once the delivery channel is changed, do watch closely the health of the module to ensure proper operability of the module once it gets updated.

> [!NOTE]
> By default, all modules come as **_Managed_**. This means that their operational health is backed by an operator and in case of any issue, respective Service Reliability Enginering team in SAP will be alerted and as result you get faster problem resolution.

> [!WARNING]
> Do not uncheck the **_Managed_** setting unsless you have deep understanding and expertise on the matter. Disabling this option can lead to potential instability and loss of data within your cluster. Proceed with caution. Once disabled, it may not be possible to revert back.

## Exercise 4.2 - Explore the SAP BTP Connectivity modules

Technical connectivity can be generally categorized as:
- _Inbound_ - External request or data is entering the application environment. An example of a Kyma Module in this category is [API Gateway](https://help.sap.com/docs/BTP/65de2977205c403bbc107264b8eccf4b/f323ab16595a47779bc74344969c0133.html).
- _Local_ - Local workloads are exchanging data. An example of a Kyma Module in this category is [Istio](https://help.sap.com/docs/BTP/65de2977205c403bbc107264b8eccf4b/26ffe00c24574db58697992b93f397ac.html?locale=en-US&version=LATEST).
- _Outbound_ - Local workloads are performing requests or sending data towards remotely hosted worloads.

This exercise focuses on the following two modules. To read more about each of the modules, you can refer to the respective documentation link:
<br>![](/exercises/ex4/images/kyma-modules-btp-connectivity.jpg)
- [**Connectivity Proxy**](https://help.sap.com/docs/CP_CONNECTIVITY/cca91383641e40ffbe03bdc78f00f681/8dd1690aa475477ab44624626f45524b.html) - _Outbound_. An integral part of [SAP BTP Connectivity capabilities](https://help.sap.com/docs/CP_CONNECTIVITY/cca91383641e40ffbe03bdc78f00f681/e54cc8fbbb571014beb5caaf6aa31280.html), and more specifically the [Connectivity service](https://help.sap.com/docs/CP_CONNECTIVITY/cca91383641e40ffbe03bdc78f00f681/bd2d4f45e0494121a058ad9c015ba348.html). Enable workloads to establish technical connectivity towards systems hosted in the customer premise or virtual private cloud environments, securely exposed via [Cloud Connector](https://help.sap.com/docs/CP_CONNECTIVITY/cca91383641e40ffbe03bdc78f00f681/e6c7616abb5710148cfcf3e75d96d596.html).
<br/><br/>
- [**Transparent Proxy**](https://help.sap.com/docs/CP_CONNECTIVITY/cca91383641e40ffbe03bdc78f00f681/1700cfe070704d2e80aa76de1033a6c4.html) - _Outbound_. An integral part of [SAP BTP Connectivity capabilities](https://help.sap.com/docs/CP_CONNECTIVITY/cca91383641e40ffbe03bdc78f00f681/e54cc8fbbb571014beb5caaf6aa31280.html). Enables workloads to establish **_unified, virtually transparent_** technical connectivity to any remote system - hosted either in public or private networks. It works seamlessly with other modules like **Istio** and **Connectivity Proxy** module. The relevant target system-specific technical connectivity configurations are managed centrally as **_destinations_** in [Destination service](https://help.sap.com/docs/CP_CONNECTIVITY/cca91383641e40ffbe03bdc78f00f681/8ff5483fef564eae9f34fe092d1bddcd.html).

This solution diagram shows the big picture through the blend of [SAP BTP Connectivity](https://help.sap.com/docs/CP_CONNECTIVITY/cca91383641e40ffbe03bdc78f00f681/e54cc8fbbb571014beb5caaf6aa31280.html) in the context of Kyma environment:
<br>![](/exercises/ex4/images/sap-btp-connectivity-kyma.jpg)

> [!TIP]
> As you can see, each of the components serves **a dedicated purpose** and **adds to the value of the other**, and **all together** ultimately generate even **greater value**.

## Exercise 4.3 - Explore Day-2 Relevant Operations

## Sizing

By default, the modules are installed with the module specific and balanced sizing, i.e. performance vs resource allocation. In your Day-2 Operations, you may see the need to change the sizing to fit best your current needs:

- [Connectivity Proxy - Sizing Recommendations](https://help.sap.com/docs/CP_CONNECTIVITY/cca91383641e40ffbe03bdc78f00f681/204822a72a6646389d4016b985345bd6.html)
- [Transparent Proxy - Sizing Recommendations](https://help.sap.com/docs/CP_CONNECTIVITY/cca91383641e40ffbe03bdc78f00f681/df31094259054c64a2c206166292d2fd.html)

> [!IMPORTANT]
> The solution architecture of modern cloud applications is generally distributed. This is especially valid for applications that implement complex integration scenarios involving hybrid technical connectivity to remote systems. Therefore, the proper sizing this should involve deep thinking process throughout the whole chain of components. Therefore, [don't forget the components in the private environment](#dont-forget-about-the-private-environment).

## Resilience - High-Availability and Scaling

In the previous point, it was pointed about the balance between performance vs resource allocation. This also mean that, by defauly, the modules come in single instance. Depending on your application SLA requirements, you may need to increase the application resilience via running the modules in high-availability mode:

- [Connectivity Proxy - High Availability](https://help.sap.com/docs/CP_CONNECTIVITY/cca91383641e40ffbe03bdc78f00f681/3c7f10d78d6b43c680c2ab99e28f6b19.html)
- [Transparent Proxy - High Availability](https://help.sap.com/docs/CP_CONNECTIVITY/cca91383641e40ffbe03bdc78f00f681/fb92ab615a57408780bfad79e03b4f86.html)

> [!IMPORTANT]
> Usage of (local) cache is crucial for application resilience.

> [!TIP]
> [**Transparent Proxy**](https://help.sap.com/docs/CP_CONNECTIVITY/cca91383641e40ffbe03bdc78f00f681/1700cfe070704d2e80aa76de1033a6c4.html) module has integrated various of resilience characteristics, including configuration and access token **_cache_** for reliable and optimal performance of the overall system, avoiding any redundant calls (or requests) to remote services, e.g. Destination service or the authorization Service - [SAP Authentication and Trust Management service (aka XSUAA)](https://help.sap.com/docs/BTP/65de2977205c403bbc107264b8eccf4b/649961f8d4ad463daca33b3a20deba4c.html) or [SAP BTP Identity Service](https://help.sap.com/docs/IDENTITY_AUTHENTICATION/6d6d63354d1242d185ab4830fc04feb1/066bda825cb148629aa1934b770eb4ed.html).

> [!WARNING]
> If SAP Cloud SDK is used, make sure **local caching is enabled** in your [Java](https://sap.github.io/cloud-sdk/docs/java/features/connectivity/http-client#configuring-the-cache) or [JavaScript](https://sap.github.io/cloud-sdk/docs/js/features/connectivity/destination-cache) application code using the library.

## Troubleshooting

As you know, it's not a matter of **_if_** the issue will occur but **_when_** it will. Therefore, knowing how to properly troubleshoot in case of issue investigation is crucial:

- [Connectivity Proxy - Troubleshooting](https://help.sap.com/docs/CP_CONNECTIVITY/cca91383641e40ffbe03bdc78f00f681/e7a04d9b30144f40ab0ca3b275ced93f.html)
- [Transparent Proxy - Troubleshooting](https://help.sap.com/docs/CP_CONNECTIVITY/cca91383641e40ffbe03bdc78f00f681/fce292aeb9e24b7abd47c0b38f6fe8a9.html)

> [!NOTE]
> Standard troubleshooting approaches for Kyma and Kubernetes workloads apply to the SAP BTP Connectivity modules. See [Exercise 3 - Explore Kyma Telemetry Features with SAP Cloud Logging](../ex3#exercise-3---exploring-kyma-telemetry-with-sap-cloud-logging).

## Don't forget about the private environment

In the cases the application workload is connecting to remote systems hosted on-premise or in virtual private cloud environments and these systems are securely exposed via [Cloud Connector](https://help.sap.com/docs/CP_CONNECTIVITY/cca91383641e40ffbe03bdc78f00f681/e6c7616abb5710148cfcf3e75d96d596.html), it's crucial to ensure proper sizing and which corresponds to the cloud side components:
- [Monitoring](https://help.sap.com/docs/CP_CONNECTIVITY/cca91383641e40ffbe03bdc78f00f681/6d9c937dd35344bca3eb61ebf34a5c1d.html)
- [Logging, and Troubleshooting](https://help.sap.com/docs/CP_CONNECTIVITY/cca91383641e40ffbe03bdc78f00f681/e7df7f15bb571014ae24bca245319880.html)
- [Administration](https://help.sap.com/docs/CP_CONNECTIVITY/cca91383641e40ffbe03bdc78f00f681/dfec06d670ff4e2e938d9fdd985e5230.html)
- [Sizing Recommendations](https://help.sap.com/docs/CP_CONNECTIVITY/cca91383641e40ffbe03bdc78f00f681/f0084943389a4112bd441c0e014efd04.html)
- [High-Availability](https://help.sap.com/docs/CP_CONNECTIVITY/cca91383641e40ffbe03bdc78f00f681/2f9250b0e6ac488286266461a82518e8.html)


## Summary

You've now got an overview of SAP BTP Connectivity capabilities offered on Kyma as Kyma Modules, namely [**Connectivity Proxy**](https://help.sap.com/docs/CP_CONNECTIVITY/cca91383641e40ffbe03bdc78f00f681/8dd1690aa475477ab44624626f45524b.html) and [**Transparent Proxy**](https://help.sap.com/docs/CP_CONNECTIVITY/cca91383641e40ffbe03bdc78f00f681/1700cfe070704d2e80aa76de1033a6c4.html). Enablement and usage of these modules is fast and simple, however, during Day-2, you mau need to react as fast as possible to adapt the system, for example, to an exceptional situation of abnormally high usage load to the system, or changed overall system requirement. The good news is that SAP has already prepared the modules for such cases.

Continue to - [Exercise 5 - Configure Transparent Proxy Kyma Module ](../ex5/README.md)

## References
* [Kyma Environment - Overview](https://help.sap.com/docs/BTP/65de2977205c403bbc107264b8eccf4b/468c2f3c3ca24c2c8497ef9f83154c44.html)
* [Kyma Environment - Modules](https://help.sap.com/docs/BTP/65de2977205c403bbc107264b8eccf4b/0dda141a58d54f29a860a4b3164bf4a9.html)
* [Administration and Operations in the Kyma Environment](https://help.sap.com/docs/BTP/65de2977205c403bbc107264b8eccf4b/b8e16869e64a4abe93cc194aa6fdacf5.html)
* [Adding and Deleting a Kyma Module](https://help.sap.com/docs/BTP/65de2977205c403bbc107264b8eccf4b/1b548e9ad4744b978b8b595288b0cb5c.html)
* [SAP BTP Connectivity - Landing Page](https://help.sap.com/docs/connectivity)
* [Connectivity in the Kyma Environment](https://help.sap.com/docs/CP_CONNECTIVITY/cca91383641e40ffbe03bdc78f00f681/7501fbc9aebd4e3180eddec977ca288d.html)
* [Transparent Proxy in the Kyma Environment](https://help.sap.com/docs/CP_CONNECTIVITY/cca91383641e40ffbe03bdc78f00f681/1700cfe070704d2e80aa76de1033a6c4.html)
* [SAP BTP Connectivity - Troubleshooting and SAP Support Information](https://help.sap.com/docs/CP_CONNECTIVITY/cca91383641e40ffbe03bdc78f00f681/e5580c5dbb5710149e53c6013301a9f2.html)