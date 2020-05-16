function Remove-SCMStaticRoute {
<#
#>
	[CmdletBinding()]
	Param (
		[Parameter(Mandatory=$True)]
		$id
    )
	
    Begin {
        #$TypeName = 'Riverbed.SteelConnect.SCMStaticRoutes'
		$staticrouteid = $id
		
		$Resource = "/staticroutes/$staticrouteid"
		
		$params = @{
			Resource = $Resource
			Method = 'Delete'
		}
    }

    Process {
        Write-Debug -Message "[$($MyInvocation.MyCommand)]"
    }
	
	End {
		Invoke-RvbdRestMethod @params
	}
}