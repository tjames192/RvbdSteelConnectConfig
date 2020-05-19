function Get-SCMRollingUpgrades {
    <#
    .SYNOPSIS
    List of schedules
	#>
    [CmdletBinding()]
    Param (
    )
    
    Write-Verbose -Message "[$($MyInvocation.MyCommand)]"
		
    Invoke-RvbdRestMethod -Resource "/rolling_upgrades"
}
