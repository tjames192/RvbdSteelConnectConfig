function Get-SCMRealm {
    <#
    .SYNOPSIS
    Retrieve the realm of SCM
	#>
    [CmdletBinding()]
    Param (
    )
    
    Write-Verbose -Message "[$($MyInvocation.MyCommand)]"
		
    Invoke-RvbdRestMethod -Resource "/realm"
}
