### Check ALL VM level tags  ###
## Connect-AzAccount -Subscription 'asosbuyandmerch' ##

[string[]] $VmNames= @()
$VmNames = Read-Host -Prompt 'Input your server list:'
$VmNames = $VmNames.Split(',')
foreach ($VmName in $VmNames) {
$vmid = Get-AzVM -name $VmName
$vmid.Name
Write-output "######################## "
$vmid.tags
Write-output "************************ "
}