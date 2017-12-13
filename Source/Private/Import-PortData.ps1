Function Import-PortData {
    [CmdletBinding()]
    Param()
        
    $PortURL = "https://www.iana.org/assignments/service-names-port-numbers/service-names-port-numbers.csv"
    $File =  $env:TEMP+'\Ports.csv'
    $ErrorActionPreference = 'continue'
    $WebClient = New-Object System.Net.WebClient
    
    Try{
        $WebClient.DownloadFile($PortURL, $File)
        $data = Import-Csv $File
        If($data){
            Foreach($item in $data.where({$_.'Port Number'})){
    
                If($item.'Port number' -like "*-*"){
                    [int]$start, [int]$end = ($item.'Port number' -split "-")
                    $start..$end | ForEach-Object{
                        [PSCustomObject] @{
                            Port =  $_
                            Service = $item.'Service Name'
                            Protocol = $item.'Transport Protocol'
                            Description = $item.Description
                        }
                    }
                }
                else{
                    [PSCustomObject] @{
                        Port =  $item.'Port number'
                        Service = $item.'Service Name'
                        Protocol = $item.'Transport Protocol'
                        Description = $item.Description
                    }
                }
    
            }            
        }
    }
    catch{
        $_
    }
}

# Import-PortData -Verbose
    



