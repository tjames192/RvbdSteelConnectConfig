function Get-SCMZones {
    <#
    .SYNOPSIS
    Retrieve all zones
	#>
    [CmdletBinding()]
    Param (
    )
    
    Write-Verbose -Message "[$($MyInvocation.MyCommand)]"
		
    Invoke-RvbdRestMethod -Resource "/zones"
}
