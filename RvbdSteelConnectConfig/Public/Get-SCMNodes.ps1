function Get-SCMNodes {
    <#
    .SYNOPSIS
    List all nodes
    .PARAMETER ChangedSince
    Optional date, time, and/or time zone to filter on last config activation time (2017-01-04 11:00:00 AM PST)
	#>
    [CmdletBinding()]
    Param (
        $ChangedSince
    )
    
    Write-Verbose -Message "[$($MyInvocation.MyCommand)]"

    if ($ChangedSince) {
        Invoke-RvbdRestMethod -Resource "/nodes?ChangedSince=$ChangedSince"
    }
    else {
        Invoke-RvbdRestMethod -Resource "/nodes"
    }
}
