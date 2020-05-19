function Get-SCMNetworks {
    <#
    .SYNOPSIS
    List networks
	#>
    [CmdletBinding()]
    Param (
    )
    
    Write-Verbose -Message "[$($MyInvocation.MyCommand)]"
		
    Invoke-RvbdRestMethod -Resource "/networks"
}
