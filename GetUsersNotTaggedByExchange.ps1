#Found this useful when trying to troubleshoot a hybrid OnPrem/365 environment and finding users that did not have OnPrem Exchange Attributes. 
#Dynamic Distribution Groups don't work correctly in that setup, very specific, but very painful
#Replace the below line with the entire domain or OU you want to search
$OUpath = 'ou=Anything,DC=Internal,DC=Contoso,DC=local'

Get-ADUser -Filter * -SearchBase $OUPath -Properties * | Where-Object {$_.msExchRemoteRecipientType -eq $null} | Where-Object {$_.WhenCreated -ge ((Get-Date).AddDays(-150))} | Sort-Object -Property WhenCreated -Descending | FL UserPrincipalName,WhenCreated 

 




