<#
.Synopsis
   Gets information of a port number
.DESCRIPTION
   Function provides detailed information of port numbers, like - the service which use the port, Transport protocol and a small decsription.
.EXAMPLE
 PS > Get-Port -Port 20,21,53
 
 Port Service  Protocol Description                     
 ---- -------  -------- -----------                     
 20   ftp-data tcp      File Transfer [Default Data]    
 20   ftp-data udp      File Transfer [Default Data]    
 20   ftp-data sctp     FTP                             
 21   ftp      tcp      File Transfer Protocol [Control]
 21   ftp      udp      File Transfer Protocol [Control]
 21   ftp      sctp     FTP                             
 53   domain   tcp      Domain Name Server              
 53   domain   udp      Domain Name Server 

.EXAMPLE
 PS > 135, 25, 23 | Get-Port

 Port Service Protocol Description            
 ---- ------- -------- -----------            
 135  epmap   tcp      DCE endpoint resolution
 135  epmap   udp      DCE endpoint resolution
 25   smtp    tcp      Simple Mail Transfer   
 25   smtp    udp      Simple Mail Transfer   
 23   telnet  tcp      Telnet                 
 23   telnet  udp      Telnet 

.EXAMPLE
 PS > port 389

 Port Service Protocol Description                          
 ---- ------- -------- -----------                          
 389  ldap    tcp      Lightweight Directory Access Protocol
 389  ldap    udp      Lightweight Directory Access P
#>
Function Get-Port
{
    [CmdletBinding(HelpUri = 'https://geekeefy.wordpress.com/2017/05/09/query-port-information-using-powershell/')]
    [Alias('port')]
    [OutputType([psobject])]
    Param
    (
        [Parameter(
            Mandatory = $true,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true,
            Position = 0,
            HelpMessage = "Please provide a port number")]
        [ValidateRange(0, 65536)][int[]]$Port
    )

    Begin
    {
        Try
        {
            $Data = Import-csv "$(Split-Path $PSScriptRoot)\Data\Ports.csv"
        }
        Catch
        {
            "Something went wrong! please try running the script again."
        }   
    }
    Process
    {
        $Port | ForEach-Object {
            $pv = $_
            $Data.Where( {$_.port -eq $pv})
        }
    }
    End
    {
        Remove-Variable -Name Data
        [gc]::Collect()
    }
}
