function Get-SCMStatus {
    <#
    .SYNOPSIS
    SCM status information
	#>
    [CmdletBinding()]
    Param (
    )
    
    Write-Verbose -Message "[$($MyInvocation.MyCommand)]"
		
    Invoke-RvbdRestMethod -Resource "/status"
}
