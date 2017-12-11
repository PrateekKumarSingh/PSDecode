<#
.SYNOPSIS
Short description

.DESCRIPTION
Long description

.PARAMETER ExitCode
Parameter description

.PARAMETER LocalJSONFilePath
Parameter description

.PARAMETER GithubJSONUrl
Parameter description

.EXAMPLE
An example

.NOTES
General notes
#>
Function Get-ErrorDetail
{
    [cmdletbinding()]
    Param(
        [Parameter(ValueFromPipeline = $true)] 
        [String] $ErrorCode
    )

    Begin
    {
        Try
        {
            $Data = Import-csv "$(Split-Path $PSScriptRoot)\Data\ExitCode.csv"
        }
        Catch
        {
            "Something went wrong! please try running the script again."
        }
    }

    Process
    {
        Foreach ($Item in $ErrorCode)
        {
            If ($Item)
            {
                $Data | Where-Object {$_.exitCode -eq $ErrorCode}
            }
            else
            {
                $Data
                break;
            }
        }

    }

    End
    {}

}
