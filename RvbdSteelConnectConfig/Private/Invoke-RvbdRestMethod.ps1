function Invoke-RvbdRestMethod {
<#
#>
	[CmdletBinding()]
	Param (
		[Parameter(Mandatory = $true)]
		$Resource,
		
		[Parameter(Mandatory = $false)]
		$method = 'Get',
		
		[Parameter(Mandatory = $false)]
		$JSON
    )
	
    Begin {
		$finalResult = @()
		
		$params = @{
			Uri = "$($script:BaseUrl)$Resource"
			Headers = $script:DefaultRvbdSession['headers']
		}
    }
		
    Process {
        Write-Debug -Message "[$($MyInvocation.MyCommand)]"
		
		if ($method -in ('Post','Put')) {
			$body = $JSON | ConvertTo-Json
			
			$params.Method = $method
			$params.Body = $body
			$params.ContentType = 'application/json'
			
			$result = Invoke-RestMethod @params
			$finalResult += $result
		}
		if ($method -in ('Delete')) {
			$params.Headers.Accept = 'text/html'
			$params.Method = $method
			
			Invoke-RestMethod @params
		}
		else {
			$result = Invoke-RestMethod @params
			$finalResult += $result.Items
		}
    }
	
	End {
		# Ensure we're always returning our results as an array, even if there is a single result.
		return @($finalResult)
	}
}