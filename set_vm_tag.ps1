### Set VM level tag for SUSD to Excluded if not set ###
## Connect-AzAccount -Subscription 'asosbuyandmerch' ##


[string[]] $VmNames= @()
$VmNames = Read-Host -Prompt 'Input your comma separated server list:'
$VmNames = $VmNames.Split(',')
foreach ($VmName in $VmNames) {
$vmid = Get-AzVM -name $VmName
$Tags = $vmid.tags
if( $Tags.SpinUpSpinDownSchedule -ne "Excluded"){
$Tags.SpinUpSpinDownSchedule = "Excluded"
Update-AzTag -ResourceId $vmid.Id -Tag $Tags -Operation Replace
}
else{
  Write-output "SUSD schedule is already excluded for " $vmid.Name
}
}