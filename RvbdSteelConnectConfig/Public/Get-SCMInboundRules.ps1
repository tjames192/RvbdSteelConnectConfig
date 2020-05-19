function Get-SCMInboundRules {
    <#
    .SYNOPSIS
    SCM status of all currently established ssh tunnels
	#>
    [CmdletBinding()]
    Param (
    )
    
    Write-Verbose -Message "[$($MyInvocation.MyCommand)]"
		
    Invoke-RvbdRestMethod -Resource "/inbound_rules"
}
