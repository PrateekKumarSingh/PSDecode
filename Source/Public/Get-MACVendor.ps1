<#
.SYNOPSIS
Find MAC Address Vendors

.DESCRIPTION
Lookup Vendor of MAC Address regsitered on IEEE.org (Institute of Electrical and Electronics Engineers) database

.PARAMETER MACAddress
MAC address to lookup

.EXAMPLE
PS > Get-MACVendor -MACAddress "dc-4a-3e-81-d0-66","d4-81-d7-c4-34-43","48-4d-7e-e6-a8-94"

MACAddress        ManufacturerName
----------        ----------------
dc-4a-3e-81-d0-66 Hewlett Packard
d4-81-d7-c4-34-43 Dell Inc.
48-4d-7e-e6-a8-94 Dell Inc.

.EXAMPLE
PS > "18-DB-F2-48-51-F6","58-FB-84-C1-31-26","dc-4a-3e-81-d0-66","00-50-56-C0-00-01","00-50-56-C0-00-08" | Get-MACVendor

MACAddress        ManufacturerName
----------        ----------------
18-DB-F2-48-51-F6 Dell Inc.
58-FB-84-C1-31-26 Intel Corporate
dc-4a-3e-81-d0-66 Hewlett Packard
00-50-56-C0-00-01 VMware, Inc.
00-50-56-C0-00-08 VMware, Inc.

.NOTES
General notes
#> 
Function Get-MACVendor
{
    [cmdletbinding()]
    [alias("macv")]
    Param(
        [Parameter(
            Mandatory = $true,
            HelpMessage = 'MAC Address to lookup',
            ValueFromPipeline = $true,
            Position = 0
        )]
        [ValidateNotNullOrEmpty()]
        [string[]] $MACAddress
    )

    Begin
    {
        Try
        {
            $Data = Import-csv "$(Split-Path (Split-Path $PSScriptRoot))\Data\MACReference.csv"
        }
        Catch
        {
            "Something went wrong! please try running the script again."
        }   
    }
    Process
    {
        Foreach ($MAC in $MACAddress)
        {

            $Data.where( {($MAC.replace(':', '').replace('-', '')[0..5] -join '') -in $_.assignment.split(' ')}) | `
                Select-Object @{n = 'MACAddress'; e = {$MAC}}, ManufacturerName -OutVariable Output

            If (-not $Output)                                   
            {
                Write-Error "Couldn't find Manufacturer information for $MAC"
            }
        }
    }
    End
    {
        Remove-Variable -Name Data; [gc]::Collect()
    }

}
