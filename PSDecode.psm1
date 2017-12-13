# Dot Sourcing files

Get-ChildItem "$PSScriptRoot\Source\Public" | Where-Object FullName -Like "*Get-*" | ForEach-Object {
    . $_.FullName
}

# Exporting the members and their aliases
Export-ModuleMember -Function "Get-*" -Alias "*"
