function Get-SCMSites {
    <#
    .SYNOPSIS
    Retrieve all sites
	#>
    [CmdletBinding()]
    Param (
    )
    
    Write-Verbose -Message "[$($MyInvocation.MyCommand)]"
		
    Invoke-RvbdRestMethod -Resource "/sites"
}
