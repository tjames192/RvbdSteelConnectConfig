function Get-SCMOrgs {
<#
#>
	[CmdletBinding()]
	Param (
    )
	
    Begin {
        #$TypeName = 'Riverbed.SteelConnect.SCMOrgs'
		
		$Resource = "/orgs"
		
		$params = @{
			Resource = $Resource
		}
    }

    Process {
        Write-Debug -Message "[$($MyInvocation.MyCommand)]"
    }
	
	End {
		Invoke-RvbdRestMethod @params
	}
}