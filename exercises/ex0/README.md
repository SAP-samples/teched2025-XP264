# Exercise 0 - Preparation Steps

In this exercise, you will create your own copy of this repository and optionally, set up a GitHub account.

Finally you will login to for this session prepared BTP account.

## Exercise 0.0 - (Optional) Create a GitHub account

1. Navigate to [GitHub](https://github.com/).

2. Click **Sign up for GiHhub**.

3. Alternatevly, click on **Continue with Google** to sign up using social login.

4. Follow the prompts to create your personal account.

## Exercise 0.1 - Create a Copy of This Repository

1. Login to [GitHub](https://github.com/).

2. On the [main page of this repository](https://github.com/SAP-samples/teched2025-XP266), choose **Fork** on the top right.

   <br>![](../ex0/images/fork_entry.png)

3. Make sure that the **Owner** matches the GitHub account that you want to use for this session. All the other information can remain the same.

   <br>![](../ex0/images/fork_details.png)

4. Choose **Create Fork**. You are now brought to a copy of the repository in your GitHub account.

## Exercise 0.2 - Discover your BTP landscape

1. Navigate to the [SAP Business Technology Platform - Cockpit](https://account.hana.ondemand.com/#/home/welcome)

2. Click "Sign In" and enter the for this session provided user credentials

3. After the BPT Cockpit has been loaded, you should see following account structure:
  * a. with the master landscape:

<img width="1146" height="589" alt="image" src="https://github.com/user-attachments/assets/bb958aee-cd70-496d-b73c-0736ba01c1c1" />


| Account Name              | Type        |                                                                                                                                Description |
| :------------------------ | :---------: | :------------------------------------------------------------------------------------------------------------------------ |
| btp-argocd                |  Session Master  | with a shared ArgoCD instance (with SSO for all participants)             |
| btp-bootstrap             |  Session Master  | XP264 session bootstrap context for the terraform automation. |
| btp-provider              |  Session Master  | with shared SAP HANA Cloud and Cloud Logging (SAML SSO) services instances.|
| btp-runtime               |  US EAST region  | Students runtime context with kyma environment in the us east region         |
| uk-south                  |  UK SOUTH region | Students runtime contexts with kyma environment in the uk south region         |
| japan-east                |  JAPAN EAST region | Students runtime contexts with kyma environment in the japan east region         |

Each student's runtime context has a preconfigured SAP Cloud Connector attached, for instance:

<img width="1661" height="733" alt="image" src="https://github.com/user-attachments/assets/5e92690b-41ad-4cf4-993a-f8486d0bb32d" />

## Summary

Now that you have everything you need to successfully go through this TechEd session:

- A GitHub account.
- Your own fork of the session's GitHub repository.
- A BTP global account with prepared subaccounts.

Continue to [BTP Kyma easy with kyma CLI](../ex1/README.md)
