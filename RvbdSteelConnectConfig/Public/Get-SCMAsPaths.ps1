function Get-SCMAsPaths {
    <#
    .SYNOPSIS
    Lists as-path access-lists
	#>
    [CmdletBinding()]
    Param (
    )
    
    Write-Verbose -Message "[$($MyInvocation.MyCommand)]"
		
    Invoke-RvbdRestMethod -Resource "/aspaths"
}
