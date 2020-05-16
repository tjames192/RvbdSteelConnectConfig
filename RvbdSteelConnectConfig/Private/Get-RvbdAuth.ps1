function Get-RvbdAuth {
	[CmdletBinding()]
	Param (
		[Parameter(Mandatory=$True)]
		[String]$ocedocontroller,
		
		[Parameter(Mandatory=$False)]
		$api,
		
		[Parameter(Mandatory=$False)]
		$version,
		
		[Parameter(Mandatory=$True)]
		$EncodedPassword
	)
	
	begin {
		$script:BaseUrl = 'https://'+$ocedocontroller+'/api/scm.config/1.0'
		$Resource= '/status'
		Write-Verbose "URI: $($script:BaseUrl)$Resource"
		
		$header = @{
			Authorization				= "Basic $($EncodedPassword)"
			Accept						= 'application/json'
		}
		write-verbose "Headers:`n$($header | out-string)"
		
		$params = @{
			URI = "$($script:BaseUrl)$Resource"
			Headers = $header
			ErrorVariable = 'apiErr'
			SessionVariable = 'Session'
		}
	}
	
	process {
	}
	
	end {
		Write-Verbose "Sending authentication request"
		try {
			#$null = Invoke-RestMethod -Uri "$($script:BaseUrl)$Resource" -Headers $header -ErrorVariable apiErr -SessionVariable Session
			$null = Invoke-RestMethod @params

			$Session
		}
		catch {
			Write-warning $apiErr.InnerException
		}
	}
}
