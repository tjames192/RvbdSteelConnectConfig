function Get-SCMUsers {
    <#
    .SYNOPSIS
    List users
	#>
    [CmdletBinding()]
    Param (
    )
    
    Write-Verbose -Message "[$($MyInvocation.MyCommand)]"
		
    Invoke-RvbdRestMethod -Resource "/users"
}
