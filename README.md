# RvbdSteelConnectConfig
PowerShell Module as a wrapper for the REST API in Riverbed SteelConnect Configuration

# Work in Progress
It is being developed and improved on as and when time permits.

### Install the module
```powershell
# manual setup
    # Download the repository
    # Unblock the zip
    # Extract the  folder to a module path (e.g. $env:USERPROFILE\Documents\WindowsPowerShell\Modules\)

# Import the module
    Import-Module RvbdSteelConnectConfig # Alternatively, Import-Module \\Path\To\RvbdSteelConnectConfig

# Get commands in the module
    Get-Command -Module RvbdSteelConnectConfig

# Get help
```
# Examples
### Connecting to Riverbed SteelConnect Manager

The first thing to do is connect to Riverbed SteelConnect Manager with the command `Connect-RvbdSCM`:

```powershell
# Connect to Riverbed SteelConnect Manager
Connect-RvbdSCM -ocedocontroller example.riverbed.cc -Credential $credential
Name                           Value
----                           -----
orgid                          org-Example-x00x0xx0000x0000
Host                           example.riverbed.cc
IsConnected                    True
gid                            SDDEDGERTSDGAGASG
Headers                        {Accept, Authorization}

```

### Copy static routes from SD to SDI
```powershell
# get a site's static routes
$StaticRoute = Get-SCMStaticRoute | ? {$_.site -eq 'site-site-7e7b7af777bd777d'}

# copy static route from SD to SDI
# create new zone for each route
foreach ($route in $StaticRoute) {
    $network = $route.destination_network
    $site    = $route.site
    $name    = "thirdparty-" + ($route.destination_network.split('.')[0..2] -join '-')

    new-scmzone -network $network -site $site -name $name
}

```
