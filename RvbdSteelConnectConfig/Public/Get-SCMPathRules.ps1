function Get-SCMPathRules {
    <#
    .SYNOPSIS
    List path rules
	#>
    [CmdletBinding()]
    Param (
    )
    
    Write-Verbose -Message "[$($MyInvocation.MyCommand)]"
		
    Invoke-RvbdRestMethod -Resource "/path_rules"
}
