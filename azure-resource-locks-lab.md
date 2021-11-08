A quick lab based on the demo in the Festive Tech Calendar 2021 session "[Locking Around the Christmas Tree](https://isjw.uk/ftc2021)". 

## Pre-Requisites
You will need an Azure subscription to complete this lab. Azure pass, EA, Pay as you go etc are all appropriate. 


## Exercise 1: Apply  an Azure Resource Lock

### Task 1: Deploy the example resources
In this task you will create a resource group and deploy three example resources.
1. Click on the [``Deploy to Azure``](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fisjwuk%2Ffestive-tech-calendar-2021%2Fmain%2Fdeploy.json) button below.

[![](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fisjwuk%2Ffestive-tech-calendar-2021%2Fmain%2Fdeploy.json)

2. 	When prompted, authenticate with the user account that has the owner role in the Azure subscription you will be using in this lab.
3. On the ``Custom deployment`` blade configure the following:
    * Select the Azure subscription you will be using in this lab.
    * Under Resource Group click ``Create new`` and enter ``festive-tech-lock-lab`` as the name of the Resource Group before clicking ``OK``.
    * Leave the Region drop-down at it's default value.
    * Click the ``Review + create`` button.
4. When the validation is complete, click the ``Create`` button.
5. Wait for the deployment to complete, this may take a couple of minutes, and then click the ``Go to resource group`` button.

You should now see a Resource Group containing 4 Storage Accounts. The Storage Accounts have reindeer names, but with some random-looking characters appended. This is because Storage Accounts need globally unique names, so everyone using this lab can't call their storage accounts ``dancer``, ``prancer``, ``dasher``, and ``rudolph``.

![New Resource Group in Azure Portal](resources/portal1.png)

## Task 2: Create and test a DoNotDelete Lock

## Task 3: Remove a Lock

## Tidy Up
1. Return to the Resource Group blade for ``festive-tech-lock-lab`` in the Azure Portal.
2. Click on ``Delete Resource Group`` in the toolbar
3. You are prompted to confirm you are sure. Enter ``festive-tech-lock-lab`` in the prompt and click the ``Delete`` button.


