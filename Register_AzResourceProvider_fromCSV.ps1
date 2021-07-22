#Clear-AzContext -Force

#Connect-AzAccount -Tenant guid

#Get-AzSubscription -TenantId guid

#Set-AzContext -Tenant guid -Subscription guid

$rps = Import-Csv -Path C:\Users\$env:USERNAME\Desktop\RegisterResourceProviders\ProviderNamespaces.csv

$rps

foreach ($r in $rps)
{
	Register-AzResourceProvider -ProviderNamespace $r.ProviderNamespace
}