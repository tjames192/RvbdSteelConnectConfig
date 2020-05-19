function Get-SCMPortal {
    <#
    .SYNOPSIS
    Retrieve all portals
	#>
    [CmdletBinding()]
    Param (
    )
    
    Write-Verbose -Message "[$($MyInvocation.MyCommand)]"
		
    Invoke-RvbdRestMethod -Resource "/portals"
}
