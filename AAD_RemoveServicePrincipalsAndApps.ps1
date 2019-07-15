#===============================================================================
# Microsoft FastTrack for Azure
# PowerShell Remove Service Principals Sample
#===============================================================================
# Copyright © Microsoft Corporation.  All rights reserved.
# THIS CODE AND INFORMATION IS PROVIDED "AS IS" WITHOUT WARRANTY
# OF ANY KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT
# LIMITED TO THE IMPLIED WARRANTIES OF MERCHANTABILITY AND
# FITNESS FOR A PARTICULAR PURPOSE.
#===============================================================================
 


Install-Module AzureAD -Force -AllowClobber
Connect-AzureAD -TenantId mytenant.onmicrosoft.com 

#Gets all ServicePrincipal and deletes the ones that are not built-in
$AllSPs = Get-AzureADServicePrincipal -All:$true
$AllSPs | ForEach-Object {"Removing '$($_.DisplayName)' (AppId $($_.AppId))"; Remove-AzureADServicePrincipal -ObjectId $_.ObjectId }

#Gets all Applications registered and deletes them, this doesn't list Ent Apps nor removes them
$AllApps = Get-AzureADApplication -All:$true
$AllApps | ForEach-Object {"Removing '$($_.DisplayName)' (AppId $($_.AppId))"; Remove-AzureADApplication -ObjectId $_.ObjectId }

