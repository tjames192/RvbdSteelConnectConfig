function Get-SCMProxyServices {
    <#
    .SYNOPSIS
    Return all Proxy Services
	#>
    [CmdletBinding()]
    Param (
    )
    
    Write-Verbose -Message "[$($MyInvocation.MyCommand)]"
		
    Invoke-RvbdRestMethod -Resource "/proxyservices"
}
