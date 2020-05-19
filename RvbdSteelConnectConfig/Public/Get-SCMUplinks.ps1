function Get-SCMUplinks {
    <#
    .SYNOPSIS
    Retrieve all uplinks
	#>
    [CmdletBinding()]
    Param (
    )
    
    Write-Verbose -Message "[$($MyInvocation.MyCommand)]"
		
    Invoke-RvbdRestMethod -Resource "/uplinks"
}
