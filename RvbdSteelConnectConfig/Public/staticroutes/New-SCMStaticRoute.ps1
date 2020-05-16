function New-SCMStaticRoute {
<#
#>
	[CmdletBinding()]
	Param (
		[Parameter(Mandatory=$False)]
		$orgid = $script:DefaultRvbdSession.orgid,
		
		# Node == Appliance
		[Parameter(Mandatory=$True)]
		$node,
		
		# Destination Network
		[Parameter(Mandatory=$True)]
		$staticroute,
		
		# Gateway
		[Parameter(Mandatory=$True)]
		$gateway,
		
		# Metric = 2
		[Parameter(Mandatory=$False)]
		$metric,
		
		[Parameter(Mandatory=$False)]
		$notes
    )
	
    Begin {
        #$TypeName = 'Riverbed.SteelConnect.SCMStaticRoutes'
		
		$Resource = "/org/$orgid/staticroutes"
		
		# required defaults
		$json = @{
			node = $node
			destination_network = $staticroute
			gateway = $gateway
		}
		
		if ($metric) {
			$json.metric = $metric
		}
		
		if ($notes) {
			$json.notes = $notes
		}
		
		$params = @{
			Resource = $Resource
			Method = 'Post'
			JSON = $json
		}
    }

    Process {
        Write-Debug -Message "[$($MyInvocation.MyCommand)]"
    }
	
	End {
		Invoke-RvbdRestMethod @params
	}
}