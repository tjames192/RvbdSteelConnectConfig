function Remove-SCMStaticRoute {
    <#
    #>
    [CmdletBinding()]
    Param (
        [Parameter(Mandatory = $True)]
        $id
    )
	
    Begin {
        #$TypeName = 'Riverbed.SteelConnect.SCMStaticRoutes'
        $staticrouteid = $id
		
        $Resource = "/staticroute/$staticrouteid"
		
        $params = @{
            Resource = $Resource
            Method   = 'Delete'
        }
    }

    Process {
        Write-Debug -Message "[$($MyInvocation.MyCommand)]"
    }
	
    End {
        # On success there will be no output except a new blank line, redirect to null
        $null = Invoke-RvbdRestMethod @params
        # On failure an exception will be caught will output to warning stream
    }
}