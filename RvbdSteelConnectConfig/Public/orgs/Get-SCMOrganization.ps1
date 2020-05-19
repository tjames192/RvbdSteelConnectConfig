function Get-SCMOrganization {
    <#
    #>
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $false)]
        $OrgId
    )

    Write-Verbose -Message "[$($MyInvocation.MyCommand)]"
    
    if ($OrgId) {
        write-verbose "getting org by id..."

        Invoke-RvbdRestMethod -Resource "/org/$OrgId"
    }
    else {
        write-verbose "listing organizations..."
        
        Invoke-RvbdRestMethod -Resource "/orgs"
    }
}