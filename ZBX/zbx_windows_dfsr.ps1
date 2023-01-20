$variavel  = [string]$args[0]
#$dfsMsg   = [string]$args[1]
 

if($variavel -eq "TypeInfo"){

    get-Eventlog -LogName 'DFS Replication' -Newest 1 | Select -expand EntryType

}elseif ($variavel -eq "Message" ){

Get-EventLog -LogName 'DFS Replication' -Newest 1 | Select -expand Message

}else {

    echo "Erro na coleta"

}