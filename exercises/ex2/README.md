# Exercise 2 - Use External Scalers. Keda - the Kubernetes Event-driven Autoscaler.

## Exercise 2.0 - Introduction to kubernetes autoscalers

- [KEDA](https://keda.sh/docs/2.18/), the Kubernetes Event-driven Autoscaler.  
- [Use External Scalers witk SAP Kyma](https://kyma-project.io/#/serverless-manager/user/tutorials/01-130-use-external-scalers)
- [Keda examples](https://github.com/kyma-project/keda-manager/tree/main/examples)
- [SAP BTP, Kyma Runtime: Leveraging KEDA module capabilities for efficient and cost-effective scaling | SAP Blogs](https://community.sap.com/t5/technology-blog-posts-by-sap/sap-btp-kyma-runtime-leveraging-keda-module-capabilities-for-efficient-and/ba-p/13573526)





- Have your Function with the replicas value set to 1 to prevent the internal Serverless HPA creation.

## Exercise 2.1 - HPA


- step1:
Initially deployed serveless python 3.12 function with a single replica....  
As shwon below, no HPA in place yet:  

```
kubectl get hpa faas-srv  -n xp264-050 --kubeconfig ~/.kube/kubeconfig-b84edf3.yaml
Error from server (NotFound): horizontalpodautoscalers.autoscaling "faas-srv" not found
```

- step2:
Scale-out to 5 replicas 
```
kubectl autoscale function faas-srv  -n xp264-050 --cpu-percent=50 --min=5 --max=10 --kubeconfig ~/.kube/kubeconfig-b84edf3.yaml
horizontalpodautoscaler.autoscaling/faas-srv autoscaled
```


- step3:  

After a little while the HPA will be up and running:  
s
```
kubectl get hpa faas-srv  -n xp264-050 --kubeconfig ~/.kube/kubeconfig-b84edf3.yaml                                             
NAME       REFERENCE           TARGETS              MINPODS   MAXPODS   REPLICAS   AGE
faas-srv   Function/faas-srv   cpu: <unknown>/50%   5         10        0          11s

kubectl get hpa faas-srv  -n xp264-050 --kubeconfig ~/.kube/kubeconfig-b84edf3.yaml
NAME       REFERENCE           TARGETS       MINPODS   MAXPODS   REPLICAS   AGE
faas-srv   Function/faas-srv   cpu: 3%/50%   5         10        5          93s
```

- step4:
scale down from 5 to 2 replicas by editiong the `horizontalpodautoscaler.autoscaling/faas-srv` resource

```
kubectl edit hpa faas-srv  -n xp264-050 --kubeconfig ~/.kube/kubeconfig-b84edf3.yaml
horizontalpodautoscaler.autoscaling/faas-srv edited
```

- step5:
scale back to a single replica. how this is to be done ?

In order to scale down from 2 or 5 replicas to 1 replica just remove the HPA resource?

- 
What about scaling down to zero ?



## Exercise 2.2 - KEDA

After completing these steps you will have...

- remove the HPA autoscaler

```
kubectl delete hpa faas-srv  -n xp264-050 --kubeconfig ~/.kube/kubeconfig-b84edf3.yaml
horizontalpodautoscaler.autoscaling "faas-srv" deleted

```

> [!NOTE]
> ~~~rust
> cat <<EOF | kubectl apply -f - --kubeconfig ~/.kube/kubeconfig-b84edf3.yaml
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

`scaledobject.keda.sh/faas-srv created`



## Exercise 2.3 - KEDA's Cron-Based Scaler

KEDA offers a broad range of scaling strategies, one of which is the **cron-based scaler**. This scaler allows you to schedule scaling actions according to the time of day, an invaluable feature for managing predictable fluctuations in workload.

As an illustration, the cron-based scaler enables you to:

- **Manage High Traffic and Request Volume Peaks**: With the cron-based scaler, you can program your applications to upscale during peak hours or high-traffic events, such as Black Friday or New Year sales. The same functionality can be used to schedule your applications to upscale during off-peak hours for batch processing tasks.

![bf](images/keda-scale-bf.png)

- **Optimize Resource Utilization and Reduce Expenses**: The cron-based scaler offers a solution to optimize resource utilization and reduce costs by allowing you to schedule your applications to downscale during non-working hours. This feature is useful for your **dev/stage/QA** clusters, which are not required during off-working hours.

  > **Note:** This benefits when your workloads require more resources than the base setup. The [current base setup](https://kyma-project.github.io/price-calculator/) consists of 3 VMs, each with 4 CPU and 16 GB of RAM. Therefore, if your workloads need 4 or more VMs to be provisioned, this feature can provide benefits to control costs and keep them to base setup during off-work hours.

  > **Note:** The cron scheduling is applicable to only customer workloads and **not kyma components**.

![off-work](images/keda-scale-off-work.png)



## Summary

You've now ...

Continue to - [Exercise 3 - Exploring Kyma Telemetry with SAP Cloud Logging](../ex3/README.md)
