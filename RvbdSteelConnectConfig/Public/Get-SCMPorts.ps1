function Get-SCMPorts {
    <#
    .SYNOPSIS
    List Ports
	#>
    [CmdletBinding()]
    Param (
    )
    
    Write-Verbose -Message "[$($MyInvocation.MyCommand)]"
		
    Invoke-RvbdRestMethod -Resource "/ports"
}
