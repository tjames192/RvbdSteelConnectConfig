function Connect-RvbdSCM {
    <#
	.EXAMPLE
	Connect-RvbdSCM -ocedocontroller <host> -Credential
	#>
    [CmdletBinding()]
    Param (
        [Parameter(Mandatory = $True)]
        [String]$ocedocontroller,
		
        [Parameter(Mandatory = $True)]
        [PSCredential]
        $Credential
    )
	
    begin {
        $UserName = $Credential.UserName
        $Password = $Credential.GetNetworkCredential().Password
		
        write-debug "User: $UserName"
        write-debug	"Pass: $Password"
		
        $EncodedAuthorization = [System.Text.Encoding]::UTF8.GetBytes($Username + ':' + $Password)
        $EncodedPassword = [System.Convert]::ToBase64String($EncodedAuthorization)
    }
	
    process {
        # https://<ocedocontroller>/api/<api>/<version>/
        # https://example.riverbed.com/api/scm.config/1.0/status
        $session = Get-RvbdAuth -ocedocontroller $ocedocontroller -EncodedAuthorization $EncodedPassword
		
        $DefaultRvbdSession.IsConnected = if ($session.headers) { $true } else { $false }
        $DefaultRvbdSession.Host = $ocedocontroller
        $DefaultRvbdSession.Headers = if ($session.headers) { [hashtable]$session.headers } else { $null }
				
        if ($DefaultRvbdSession.IsConnected) {
            $SCMOrgs = Get-SCMOrganization
            $DefaultRvbdSession.orgid = $SCMOrgs.Id
            $DefaultRvbdSession.gid = $SCMOrgs.gid
        }       
    }
	
    end {
        $DefaultRvbdSession
    }
}
