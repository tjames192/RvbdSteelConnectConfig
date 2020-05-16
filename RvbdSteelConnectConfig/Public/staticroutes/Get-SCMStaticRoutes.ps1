function Get-SCMStaticRoutes {
<#
#>
	[CmdletBinding()]
	Param (
    )
	
    Begin {
        #$TypeName = 'Riverbed.SteelConnect.SCMStaticRoutes'
		
		$Resource = "/staticroutes"
		
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