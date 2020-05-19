function Get-SCMOutboundRules {
    <#
    .SYNOPSIS
    List outbound rules
	#>
    [CmdletBinding()]
    Param (
    )
    
    Write-Verbose -Message "[$($MyInvocation.MyCommand)]"
		
    Invoke-RvbdRestMethod -Resource "/outbound_rules"
}
