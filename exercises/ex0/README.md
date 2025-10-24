# Exercise 0 - Preparation Steps

You must have a personal github account for this session.  


## Exercise 0.0 - Sign up for a new GitHub account

This step is optional and you can be use instead any existing personal GitHub account of yours.

- Navigate to [GitHub](https://github.com/).
- Click **Sign up for GiHhub**.
- Otherwise, you may click on **Continue with Google** to sign up using your Google social login.
- Follow the prompts to create your personal account.

## Exercise 0.1 - Create a Copy of This Repository

 - Login to [GitHub](https://github.com/).
 - On the [main page of this repository](https://github.com/SAP-samples/teched2025-XP264), choose **Fork** on the top right.

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

 - Make sure that the **Owner** matches the GitHub account that you want to use for this session. All the other information can remain the same.


<table style="width: 100%; border-collapse: collapse; background-color: #f5f5f5;" border="1">
<tbody>
<tr style="height: 193px;">
<td style="width: 71.6%; height: 193px;">
<div>
<h1><a href="https://github.com/SAP-samples/teched2025-XP264"><img class="aligncenter" src="../ex0/images/fork_details.png" alt="" /></a></h1>
</div>
</td>
</tr>
</tbody>
</table>   

 - Choose **Create Fork**. You are now brought to a copy of the repository in your GitHub account.
 - Choose **Activate Github Action**

## Exercise 0.2 - The rules of the game

- The students can pick and choose any available kyma cluster region from the following list:

| Account Name              | Type        |                                                                                                                                Description |
| :------------------------ | :---------: | :------------------------------------------------------------------------------------------------------------------------ |
| us-east               |  US EAST region  | Students runtime context with kyma environment in the us east region         |
| uk-south                  |  UK SOUTH region | Students runtime contexts with kyma environment in the uk south region         |
| japan-east                |  JAPAN EAST region | Students runtime contexts with kyma environment in the japan east region         |



- Access to the landscape via Easy Navigation dashboard:  

<table style="width: 100%; border-collapse: collapse; background-color: #f5f5f5;" border="1">
<tbody>
<tr style="height: 193px;">
<td style="width: 71.6%; height: 193px;">
<div>
<h1><a href="https://url.sap/3kf0ol"><img class="aligncenter" src="../ex0/images/site_navigation.png" alt="site_navigation" height="800"/></a></h1>
</div>
</td>
</tr>
</tbody>
</table>  


Good to know: 
- Each cluster has been configured to the same template with dedicated namespaces for each student.
- As this is an academic exercise, the complete user/namespace isolation has not been enforced.
 
Furthermore:
- The students do not have access to the master components of the landscape. 
- Any shared infrascture access required for the session is granted via SSO with the links available from the Easy Navigation site.

| Account Name              | Type        |                                                                                                                                Description |
| :------------------------ | :---------: | :------------------------------------------------------------------------------------------------------------------------ |
| btp-argocd                |  Session Master  | with a shared ArgoCD instance (with SSO for all participants)             |
| btp-bootstrap             |  Session Master  | XP264 session bootstrap context for the terraform automation. |
| btp-provider              |  Session Master  | with shared SAP HANA Cloud and Cloud Logging (SAML SSO) services instances.|




## Exercise 0.3 - Solution brief.

Here goes a diagram of the functional architecture of the solution

<table style="width: 100%; border-collapse: collapse; background-color: #f5f5f5;" border="1">
<tbody>
<tr style="height: 193px;">
<td style="width: 71.6%; height: 193px;">
<div>
<h1><a href="https://url.sap/3kf0ol"><img class="aligncenter" src="../ex0/images/functional_architecture.png" alt=""/></a></h1>
</div>
</td>
</tr>
</tbody>
</table>   


Login to [SAP-TechEd25-XP264 Business Technology Platform - Cockpit](https://emea.cockpit.btp.cloud.sap/cockpit?idp=anuk8cmfw.accounts.ondemand.com#/globalaccount/c1f19148-71f7-4883-9f86-8d5ee7634dec) with your allocated student's credentials (SSO)


<table style="width: 100%; border-collapse: collapse; background-color: #f5f5f5;" border="1">
<tbody>
<tr style="height: 193px;">
<td style="width: 71.6%; height: 193px;">
<div>
<h1><a href="https://emea.cockpit.btp.cloud.sap/cockpit?idp=anuk8cmfw.accounts.ondemand.com#/globalaccount/c1f19148-71f7-4883-9f86-8d5ee7634dec"><img class="aligncenter" src="../ex0/images/SAP-TechEd25-XP264.png" alt="SAP-TechEd25-XP264" /></a></h1>
</div>
</td>
</tr>
</tbody>
</table>   

- The BTP landscape has a number of subaccounts or runtime contexts.  
- Most of the runtime contexts are hosted in the same BTP region - in the EU20 data center (Azure/Netherlands)
- However, there are a few in the EU10 data center (AWS/Francfort) as well.
- Each BTP subaccount can host a single kyma runtime environment.
- Each kyma runtim environment maps into a single kuberneters cluster in the Azure or AWS region of your choice.
- Please note the kyma cluster region may be different from the BTP subaccount region.


Each student's runtime context has a preconfigured SAP Cloud Connector attached, for instance:


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

## Summary

Now that you have everything you need to successfully go through this TechEd session:

- A GitHub account.
- Your own fork of the session's GitHub repository.
- Access to the SAP BTP managed kubernetes landscape with the easy navigation site
- An idea of the functional architecture behind the solution brief

Continue to [First things first. Getting to know SAP managed kubernetes runtime](../ex1/README.md)
