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
        $uri = "$($BaseUrl)$Resource"

        Write-Verbose "URI: $uri"

        $finalResult = @()
		
        $params = @{
            Uri     = $uri
            Headers = $DefaultRvbdSession['headers']
        }

        write-verbose "Sending:`n$($params | out-string)"
    }
    	
    Process {
        Write-Verbose -Message "[$($MyInvocation.MyCommand)]"
		
        if ($method -in ('Post', 'Put')) {
            $body = $JSON | ConvertTo-Json

            $params.Method = $method
            $params.Body = $body
            $params.ContentType = 'application/json'
        }

        if ($method -in ('Delete')) {
            $params.Method = $method
        }

        if ($method -in ('Get')) {
            $params.Method = $method
        }
    }
	
    End {
        try {
            $params.ErrorVariable = 'apiErr'

            $result = Invoke-RestMethod @params

            if ($result.psobject.properties['items']) {
                $result = $result.Items
            }

            $finalResult += $result

            if ($finalResult.Count -eq 0) {
                return $finalResult.Count
            }

            # Ensure we're always returning our results as an array, even if there is a single result.
            return @($finalResult)
        }
        catch {
            $json = $apiErr.Message | Out-String | ConvertFrom-Json
            Write-Warning $json.Error
            Write-Warning $apiErr.InnerException
            
            <#
            $apiErr
            $apiErr.Data
            $apiErr.ErrorRecord
            $apiErr.HelpLink
            $apiErr.HResult
            $apiErr.InnerException
            $apiErr.Message
            $apiErr.Source
            $apiErr.StackTrace
            $apiErr.TargetSite
            $apiErr.WasThrownFromThrowStatement
            #>
        }
    }
}