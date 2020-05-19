function Get-SCMSSIDs {
    <#
    .SYNOPSIS
    List all ssids
	#>
    [CmdletBinding()]
    Param (
    )
    
    Write-Verbose -Message "[$($MyInvocation.MyCommand)]"
		
    Invoke-RvbdRestMethod -Resource "/ssids"
}
