Install-Module AzureAD -Force -AllowClobber
Connect-AzureAD -TenantId theniceweb3.onmicrosoft.com 

#Gets all ServicePrincipal and deletes the ones that are not built-in
$AllSPs = Get-AzureADServicePrincipal -All:$true
$AllSPs | % {"Removing '$($_.DisplayName)' (AppId $($_.AppId))"; Remove-AzureADServicePrincipal -ObjectId $_.ObjectId }

#Gets all Applications registered and deletes them, this doesn't list Ent Apps nor removes them
$AllApps = Get-AzureADApplication -All:$true
$AllApps | % {"Removing '$($_.DisplayName)' (AppId $($_.AppId))"; Remove-AzureADApplication -ObjectId $_.ObjectId }

