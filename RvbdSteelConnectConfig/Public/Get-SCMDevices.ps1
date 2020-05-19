function Get-SCMDevices {
    <#
    .SYNOPSIS
    List devices
	#>
    [CmdletBinding()]
    Param (
    )
    
    Write-Verbose -Message "[$($MyInvocation.MyCommand)]"
		
    Invoke-RvbdRestMethod -Resource "/devices"
}
