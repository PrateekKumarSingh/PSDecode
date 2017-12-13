PSDCode
-
PowerShell based module that can decode 2700+ System and Internet Error codes, all port numbers [0 to 65535], HTTP Statuses and more.


Type| Range | Count | Comments
---------|----------|---------
 System Errors | 0 - 15999 | 2764 | 
 Internet Errors | 12000 - 12175 | 114 | Subset of System Errors
 Ports | 0 - 65535 | C3

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
