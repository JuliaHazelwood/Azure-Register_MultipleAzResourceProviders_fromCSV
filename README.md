# Azure - register multiple Azure Resource Providers from CSV file

## Intro / Problem Description

Registering a Resource Provider in the Azure portal is an easy task, however, when having to register many resource providers it is cumbersome to do so in the portal. 

An example of when it is required to register many Resource Providers at a time is when creating a new subscription with the intention of migrating resoures from a different subscription. Attempting to validate the resource move prior to actually making that move, would throw many errors if the proper Resource Providers are not yet registered.

## Pre-requisite steps to run script

### File path

The script is expecting the CSV file to exist in this location: `C:\Users\$env:USERNAME\Desktop\RegisterResourceProviders\ProviderNamespaces.csv`

Feel free to modify the file path in the script if preferred to run or save file in a different location.

### CSV file format

The header **ProviderNamespace** is expected by the script, here is an example of the CSV content that is looped through to register the Resource Providers (one name per line):

ProviderNamespace\
Microsoft.Subscription\
Microsoft.SqlVirtualMachine\
Microsoft.Web

### Logging in to Azure

The beginning of the script contains multiple commands which may be needed depending on number of Azure AD tenants your account exists in, and how many subscriptions have permissions in. 

At times, it is necessary to run the `Clear-AzContext` command and then run `Connect-AzAccount` with the Tenant specified in order to ensure you are seeing the proper subscriptions.

I typically check to make sure I am getting the correct subscriptions back using `Get-AzSubscription` and then run `Set-AzContext` and specify both the Tenant and Subscription I want to work with.

For those new to using the Azure PowerShell and needing to install modules, see these links:
* Azure PowerShell install module (https://docs.microsoft.com/en-us/powershell/azure/install-az-ps?view=azps-6.2.1)
* Install with MSI (https://docs.microsoft.com/en-us/powershell/azure/install-az-ps-msi?view=azps-6.2.1)

### Status after running

Once the script runs, should kick off the registration for each Resource Provider, any one off errors I would suggest just re-run those that failed, or can go take care of one or two in the portal.

When you go into the portal to verify, you may see some still in a pending status of 'Registering'. This is normal and just need to wait until everything has finished processing for the registration update.
