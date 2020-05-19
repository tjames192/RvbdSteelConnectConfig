function Get-SCMStaticRoute {
    <#
	#>
    [CmdletBinding()]
    Param (
        [Parameter(Mandatory = $false)]
        $id
    )
		
    Write-Verbose -Message "[$($MyInvocation.MyCommand)]"
    
    if ($id) {
        write-verbose "getting a static route"

        Invoke-RvbdRestMethod -Resource "/staticroute/$id"
    }
    else {
        write-verbose "getting static routes"
		
        Invoke-RvbdRestMethod -Resource "/staticroutes"
    }
}