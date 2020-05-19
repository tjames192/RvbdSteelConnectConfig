function Get-RvbdAuth {
    <#
    #>
    [CmdletBinding()]
    Param (
        [Parameter(Mandatory = $True)]
        [String]$ocedocontroller,
		
        [Parameter(Mandatory = $False)]
        $api,
		
        [Parameter(Mandatory = $False)]
        $version,
		
        [Parameter(Mandatory = $True)]
        $EncodedAuthorization
    )
	
    begin {
        $script:BaseUrl = $BaseUrl + $ocedocontroller + '/api/scm.config/1.0'
        $Resource = '/status'
        $uri = "$($BaseUrl)$Resource"

        Write-Verbose "URI: $uri"
		
        $header = @{
            Authorization = "Basic $EncodedAuthorization"
            Accept        = 'application/json'
        }
		
        write-verbose "Headers:`n$($header | out-string)"
	
        $params = @{
            URI             = $uri
            Headers         = $header
            ErrorVariable   = 'apiErr'
            SessionVariable = 'Session'
        }
    }
	
    end {
        Write-Verbose "Sending authentication request"
        try {
            $null = Invoke-RestMethod @params

            $Session
        }
        catch {
            Write-warning $apiErr.InnerException
        }
    }	
}
