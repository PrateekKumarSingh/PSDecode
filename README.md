PSDCode
-
PowerShell based module that can decode System Errors, Exit codes, port numbers, HTTP Statuses and more.
This module can be used to quick lookup Error descriptions, to add verbosity to your custom error messages and for a better Error Handling, Investigation and Analysis.

Type| Range | Count | Comments
---------|----------|---------|---------
 System Errors | 0 - 15999 | 2764 | Windows System errors and Exit Codes
 Internet Errors | 12000 - 12175 | 114 | Subset of System Errors
 Port Numbers | 0 - 65535 | 56506 | Registered and Unregistered ports
 HTTP Status Codes | 100-599 | 63 | Status codes - Informational, Success, Redirection, Client/Server Error

Use-Case
-

* Decode Exit Codes and Windows System errors

 ![](https://raw.githubusercontent.com/PrateekKumarSingh/PSDecode/master/Media/Get-ErrorDetail.jpg)

* List all 'Listening' ports and service with description

 ![](https://raw.githubusercontent.com/PrateekKumarSingh/PSDecode/master/Media/Get-Port.jpg)

* Identify MAC vendors for Network related troubleshooting

 ![](https://raw.githubusercontent.com/PrateekKumarSingh/PSDecode/master/Media/Get-MACVendor.jpg)

* Adds verbosity to you HTTP requests

 ![](https://raw.githubusercontent.com/PrateekKumarSingh/PSDecode/master/Media/Get-HTTPStatusCode.jpg)


Installation
 -
 
 #### [PowerShell V5](https://www.microsoft.com/en-us/download/details.aspx?id=50395) and Later
 You can install the `Gridify` module directly from the PowerShell Gallery

 * [Recommended] Install to your personal PowerShell Modules folder
 ```PowerShell
 Install-Module PSDecode -scope CurrentUser
 ```

 ![]()

 * [Requires Elevation] Install for Everyone (computer PowerShell Modules folder)
 ```PowerShell
 Install-Module PSDecode
 ```

 #### PowerShell V4 and Earlier
 To install to your personal modules folder run:

 ```PowerShell
 iex (new-object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/PrateekKumarSingh/PSDecode/master/Install.ps1')
 ```
