function Get-SCMWANs {
    <#
    .SYNOPSIS
    List wans
	#>
    [CmdletBinding()]
    Param (
    )
    
    Write-Verbose -Message "[$($MyInvocation.MyCommand)]"
		
    Invoke-RvbdRestMethod -Resource "/wans"
}
