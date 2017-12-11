#$PSCommandPath
#$MyInvocation
#$script:MyInvocation.MyCommand.Path
#(Get-Variable MyInvocation -Scope 1).Value

#$Invocation = (Get-Variable MyInvocation -Scope 1).Value
$MyInvocation
#Split-path (Split-Path $Invocation.MyCommand)

"$(Split-path (Split-Path $PSScriptRoot))\Data\ExitCode.csv"
