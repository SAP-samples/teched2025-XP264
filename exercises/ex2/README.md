# Exercise 2 - Use External Scalers. Keda - the Kubernetes Event-driven Autoscaler.

## Exercise 2.0 - Introduction to kubernetes autoscalers

> [!NOTE]
>
> KEDA, an open-source initiative that facilitates event-driven autoscaling for Kubernetes workloads, was originally developed by Microsoft and Red Hat. It has since become a sandbox project under the Cloud Native Computing Foundation (CNCF). KEDA focuses on autoscaling applications in response to events sourced from a variety of platforms, including Kafka, RabbitMQ, and cloud-specific services such as Azure Service Bus and Google Pub/Sub.

> [!NOTE]
>
> KEDA ushers in a new era of flexibility and efficiency in autoscaling. It enhances Kubernetes' capacity to support fine-grained autoscaling for event-driven workloads. Leveraging KEDA, you can dynamically scale your deployments from zero to any arbitrary number, contingent on the volume of events they are designed to process.



> [!IMPORTANT]
> 
>  A dedicated Python Function is provided, together with its load generator, in every single student namespace, with the replicas value set to 1 to prevent the internal Serverless HPA creation.  

Practice:
- 👉 run the `k8s-hpa-keda-load-generator` workflow (to be run in a separate browser window...  )
- 👉 For the best experience, open the workflow link into into a new window (right click).  
- 👉 Run the provided github actions workflows to experience both HPA and KEDA
- 👉 Take time to inspect the workflows run logs.  
- 👉 use [kyma dashboard](https://url.sap/4r4wbw) for the interactive inspection in your student's namespace.



 |  k8s HPA-KEDA load generator workflow (namespaced)
 | :---------  |
 | [ k8s-hpa-keda-load-generator](../../../../actions/workflows/k8s-hpa-keda-load-generator.yml)


<table style="width: 100%; border-collapse: collapse; background-color: #f5f5f5;" border="1">
<tbody>
<tr style="height: 193px;">
<td style="width: 71.6%; height: 193px;">
<div> 
<h1><a href="https://url.sap/4r4wbw"><img class="aligncenter" src="../ex1/images/k8s-hpa-keda-load-generator.png" alt="" height="600"/></a></h1>
</div>
</td>
</tr>
</tbody>
</table> 

PS. The below steps are for illustration only. 

- step1: initially deployed serveless python 3.12 function with a single replica....
- step2: Scale-out to 3 or 5 replicas 
- step3: After a little while the HPA will be up and running:  
- step4: scale down from 5 to 2 replicas 
- step5: scale back to a single replica.

## Exercise 2.1 - HPA

- 👉 run the `k8s-hpa-student` workflow
- 👉 inspect the `k8s-hpa-student` workflow run log
- 👉 For the best experience, open workflow links into a separate tab or into a new window (right click).  


 |  k8s HPA student workflow (namespaced)
 | :---------  |
 | [ k8s-hpa-student](../../../../actions/workflows/k8s-hpa-student.yml)


<table style="width: 100%; border-collapse: collapse; background-color: #f5f5f5;" border="1">
<tbody>
<tr style="height: 193px;">
<td style="width: 71.6%; height: 193px;">
<div> 
<h1><a href="https://url.sap/4r4wbw"><img class="aligncenter" src="../ex1/images/k8s-hpa-student.png" alt="k8s-hpa-student" height="600"/></a></h1>
</div>
</td>
</tr>
</tbody>
</table> 

## Exercise 2.2 - KEDA

- 👉 run the `k8s-keda-student` workflow
- 👉 inspect the `k8s-keda-student` workflow run log
- 👉 For the best experience, open workflow links into a separate tab or into a new window (right click).

 |  k8s KEDA student workflow (namespaced)
 | :---------  |
 | [ k8s-keda-student](../../../../actions/workflows/k8s-keda-student.yml)


<table style="width: 100%; border-collapse: collapse; background-color: #f5f5f5;" border="1">
<tbody>
<tr style="height: 193px;">
<td style="width: 71.6%; height: 193px;">
<div> 
<h1><a href="https://url.sap/4r4wbw"><img class="aligncenter" src="../ex1/images/k8s-keda-student.png" alt="k8s-keda-student" height="600"/></a></h1>
</div>
</td>
</tr>
</tbody>
</table> 


> [!NOTE]
> For illustration only: a KEDA ScaledObject manifest with the cpu trigger
> ~~~rust
> cat <<EOF | kubectl apply -f - --kubeconfig ~/.kube/kubeconfig-<shoot_id>.yaml
> apiVersion: keda.sh/v1alpha1
> kind: ScaledObject
> metadata:
>  name: faas-srv
>  namespace: xp264-050
> spec:
>  scaleTargetRef:
>    apiVersion:    serverless.kyma-project.io/v1alpha2
>    kind:          Function
>    name:          faas-srv
>  minReplicaCount:  5
>  maxReplicaCount:  10
>  triggers:
>  - type: cpu
>    metricType: Utilization
>    metadata:
>      value: "50"
>EOF
> ~~~



## Exercise 2.3 - KEDA's Cron-Based Scaler

- 👉 run the `k8s-keda-cron-student` workflow
- 👉 inspect the `k8s-keda-cron-student` workflow run log
- 👉 For the best experience, open workflow links into a separate tab or into a new window (right click).

 |  k8s KEDA CRON student workflow (namespaced)
 | :---------  |
 | [ k8s-keda-cron-student](../../../../actions/workflows/k8s-keda-cron-student.yml)

<table style="width: 100%; border-collapse: collapse; background-color: #f5f5f5;" border="1">
<tbody>
<tr style="height: 193px;">
<td style="width: 71.6%; height: 193px;">
<div> 
<h1><a href="https://url.sap/4r4wbw"><img class="aligncenter" src="../ex1/images/k8s-keda-cron-student.png" alt="k8s-keda-cron-student" height="600"/></a></h1>
</div>
</td>
</tr>
</tbody>
</table> 

KEDA offers a broad range of scaling strategies, one of which is the **cron-based scaler**. This scaler allows you to schedule scaling actions according to the time of day, an invaluable feature for managing predictable fluctuations in workload.

As an illustration, the cron-based scaler enables you to:

- **Manage High Traffic and Request Volume Peaks**: With the cron-based scaler, you can program your applications to upscale during peak hours or high-traffic events, such as Black Friday or New Year sales. The same functionality can be used to schedule your applications to upscale during off-peak hours for batch processing tasks.


<table style="width: 100%; border-collapse: collapse; background-color: #f5f5f5;" border="1">
<tbody>
<tr style="height: 193px;">
<td style="width: 71.6%; height: 193px;">
<div>
<h1><a href="https://url.sap/53tot3"><img class="aligncenter" src="images/keda-scale-bf.png" alt="before" height="600"/></a></h1>
</div>
</td>
</tr>
</tbody>
</table>

- **Optimize Resource Utilization and Reduce Expenses**: The cron-based scaler offers a solution to optimize resource utilization and reduce costs by allowing you to schedule your applications to downscale during non-working hours. This feature is useful for your **dev/stage/QA** clusters, which are not required during off-working hours.

> [!NOTE]
>
> This benefits when your workloads require more resources than the base setup. The [current base setup](https://kyma-project.github.io/price-calculator/) consists of 3 VMs, each with 4 CPU and 16 GB of RAM. Therefore, if your workloads need 4 or more VMs to be provisioned, this feature can provide benefits to control costs and keep them to base setup during off-work hours.

> [!NOTE]
>
> The cron scheduling is applicable only to customer workloads and **not to kyma components**.


<table style="width: 100%; border-collapse: collapse; background-color: #f5f5f5;" border="1">
<tbody>
<tr style="height: 193px;">
<td style="width: 71.6%; height: 193px;">
<div>
<h1><a href="https://url.sap/f5p8di"><img class="aligncenter" src="images/keda-scale-off-work.png" alt="off-work" height="600"/></a></h1>
</div>
</td>
</tr>
</tbody>
</table>


> [!NOTE]
>
> Additional reading...  
>
> - [KEDA](https://keda.sh/docs/2.18/), the Kubernetes Event-driven Autoscaler.  
> - [Use External Scalers with SAP Kyma](https://kyma-project.io/#/serverless-manager/user/tutorials/01-130-use-external-scalers)
> - [Keda examples](https://github.com/kyma-project/keda-manager/tree/main/examples)
> - [SAP BTP, Kyma Runtime: Leveraging KEDA module capabilities for efficient and cost-effective scaling | SAP Blogs](https://community.sap.com/t5/technology-blog-posts-by-sap/sap-btp-kyma-runtime-leveraging-keda-module-capabilities-for-efficient-and/ba-p/13573526)
> - https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale/#support-for-horizontalpodautoscaler-in-kubectl  
> - https://kubernetes.io/docs/reference/generated/kubectl/kubectl-commands#autoscale  

## Next steps

Continue to - [Exercise 3 - Exploring Kyma Telemetry with SAP Cloud Logging](../ex3/README.md)
