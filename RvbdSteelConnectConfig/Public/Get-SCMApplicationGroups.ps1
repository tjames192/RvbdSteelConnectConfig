function Get-SCMApplicationGroups {
    <#
    .SYNOPSIS
    List Application Groups
	#>
    [CmdletBinding()]
    Param (
    )
    
    Write-Verbose -Message "[$($MyInvocation.MyCommand)]"
		
    Invoke-RvbdRestMethod -Resource "/app_groups"
}
