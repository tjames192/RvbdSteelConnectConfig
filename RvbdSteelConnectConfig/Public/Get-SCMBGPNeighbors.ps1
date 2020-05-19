function Get-SCMBGPNeighbors {
    <#
    .SYNOPSIS
    List BGP Neighbors
	#>
    [CmdletBinding()]
    Param (
    )
    
    Write-Verbose -Message "[$($MyInvocation.MyCommand)]"
		
    Invoke-RvbdRestMethod -Resource "/bgpneighs"
}
