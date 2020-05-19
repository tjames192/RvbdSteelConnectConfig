function Get-SCMApps {
    <#
    .SYNOPSIS
    List Apps
	#>
    [CmdletBinding()]
    Param (
    )
    
    Write-Verbose -Message "[$($MyInvocation.MyCommand)]"
		
    Invoke-RvbdRestMethod -Resource "/apps"
}
