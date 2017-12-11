<#
.SYNOPSIS
HTTP Status code information

.DESCRIPTION
Get detailed information of a HTTP Status code with type, short description and a long description. 
Which can add verbosity to your script results/outputs and making it easy to understand.

.PARAMETER StatusCode
HTTP Status code to lookup

.EXAMPLE
PS> Get-HTTPStatusCode -StatusCode 404, 303

StatusCode Type         ShortDescription LongDescription
---------- ----         ---------------- ---------------
404        Client Error Not Found        The origin server did not find a current representation for  he target resource or is not willing to disclose that one
                                         the target resource or is not willing to disclose that one
                                         exists.                                                      rce, as indicated by a URI in the Location header field,
303        Redirection  See Other        The server is redirecting the user agent to a different      inal request.
                                         resource, as indicated by a URI in the Location header
                                         field, which is intended to provide an indirect response to
                                         the original request.
.EXAMPLE
PS> 301, 404, 202 | Get-HTTPStatusCode

StatusCode Type         ShortDescription   LongDescription
---------- ----         ----------------   ---------------
301        Redirection  Moved Permanently  The target resource has been assigned a new permanent URI
                                           and any future references to this resource ought to use
                                           one of the enclosed URIs.
404        Client Error Not Found          The origin server did not find a current representation
                                           for the target resource or is not willing to disclose
                                           that one exists.
202        Success      Accepted           The request has been accepted for processing, but the
                                           processing has not been completed. The request might or
                                           might not eventually be acted upon, as it might be
                                           disallowed when processing actually takes place.
.NOTES
Author : Prateek Singh
Blog   : http:\\geekeefy.wordpress.com
#> 
Function Get-HTTPStatusCode
{
    Param(
        [Parameter(
            Mandatory = $true,
            HelpMessage = 'HTTP Status Code to lookup',
            ValueFromPipeline = $true,
            Position = 0
        )]
        [ValidateNotNullOrEmpty()]
        [string[]] $StatusCode
    )

    Begin
    {
        Try
        {
            $Data = Import-csv "$(Split-Path $PSScriptRoot)\Data\HTTPStatusCode.csv"
        }
        Catch
        {
            "Something went wrong! please try running the script again."
        }        

    }
    Process
    {
        Foreach ($Item in $StatusCode)
        {

            ($Output = $Data.where( {$Item -eq $_.StatusCode.trim()}))
            
            If (-not $Output)                                   
            {
                Write-Error "Couldn't find HTTP status code information for $Item"
            }
        }
    }
    End
    {
        Remove-Variable -Name Data; [gc]::Collect()
    }

}
