function Start-MSIgniteRaffle {
param(
    [validaterange(1,5)]
    [int]$startingdigits

)
    $surfacepro = @"
                                                  @@@@@@@@@@@@@/                  
                                                   @&@@@@@@&&@@@@@&@@@@@@@@@@@,     
                                                 @@@&@@@&@&&&&&@&&@@&@@@&@@@/*      
                                               /@@@@&@@@&@*,,*#&@@@@&@@@@@@,        
                                              @&&&&&&&&&&/..**%#&&&&&&&&@/&         
                                            @@&@@@@@&*# .*.,*@@&&@@@&@@@(           
                                           @/&/@&@@@@&*&*,#(@&@@&@@@&@**            
                                         @@@#@&&@@@@&#**,@@@&@@@@@@@@,              
                                        @%&@&@&@&@&,//#@&@&&%@&@&@@*/(*             
                                *(((&###@@&@&@@@@,//&@&*((#(((//@@@%###(            
                   *##&(#/%#/(((((((%(#%##%%%#@#/(#@*#*%#((###(@*(&&%%##(*          
          #%##############%(((%%((#((####%#%%%%&%%##///((####@@*%@@&&&%%#(/         
              ############(((##(((#%#%#&######%%%%%%#%%%#.%%@,         &&%#(,       
                 ##################%###%####&%(%#%#((#%@@&&#*                       
                    #%######################                                        
                       .#####((##.        
    
"@
    if($startingdigits){
        $range = ((0..9) | get-random -Count $startingdigits)
        $ticketdigitcount = 6-$startingdigits
    } else {
        $ticketdigitcount = 6
        $range = $Null
    }
    $ticket =  ($range+((0..9) | Get-Random -Count $ticketdigitcount ) )-join "" 
    Write-host "Welcome to this Ignite Session." -ForegroundColor Yellow
    ""
    Write-host "Your Ticket Number is $ticket"
    ""
    Write-host "Now go watch your Ignite video, when finished hit any key to see if you won."
    
    Read-host "Continue?"
    
    $winningTicket = $range+(((0..9) | Get-Random -Count $ticketdigitcount )) 
    Write-host "The winning ticket number is " -NoNewline
    
    $winningTicket | ForEach-Object {
        
        Write-host "$($_)" -NoNewline -ForegroundColor Green
        Start-Sleep -Seconds 1
    
    
    }
    ""
    ""
    $winningTicket = $winningTicket -join ""
    
    if($ticket -eq $winningTicket){
        
        Write-host "You won a Surface Pro!"
        $surfacepro
    } else {
    
        Write-host "You win nothing, some person who has no personality has claimed the prize."
        Write-host "Better Luck Next time!"
    
    }
} 
