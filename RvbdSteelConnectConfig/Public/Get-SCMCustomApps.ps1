function Get-SCMCustomApps {
    <#
    .SYNOPSIS
    List Custom Apps
	#>
    [CmdletBinding()]
    Param (
    )
    
    Write-Verbose -Message "[$($MyInvocation.MyCommand)]"
		
    Invoke-RvbdRestMethod -Resource "/custom_apps"
}
