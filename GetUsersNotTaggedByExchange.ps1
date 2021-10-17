#Replace the below line with the entire domain or OU you want to search
$OUpath = 'ou=Anything,DC=Internal,DC=Contoso,DC=local'

Get-ADUser -Filter * -SearchBase $OUPath -Properties * | Where-Object {$_.msExchRemoteRecipientType -eq $null} | Where-Object {$_.WhenCreated -ge ((Get-Date).AddDays(-150))} | Sort-Object -Property WhenCreated -Descending | FL UserPrincipalName,WhenCreated 

 




