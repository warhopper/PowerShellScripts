#A little script I attach to a service failure in Windows Server
#Sends an email using 365 as a relay without the need to store credentials on the server
#Just configure as needed below to your environments 365 settings and what address you want it to come from
$mailParams = @{ 
    SmtpServer = 'Contoso.mail.protection.outlook.com'
    Port = '25'
    UseSSL = $true
    From = 'status@contoso.com' #I typically use a general status@ email that doesn't need a mailbox to be created on the tenant
    To = 'user@contoso.com' #Adjust this, typically you would use something that translates it to a ticket 
    Subject = "SMTP Client Test' - $(Get-Date -Format g)" #I use the date like this to reflect when the ticket has arrived
    Body = 'This is a test email message' 
    DeliveryNotificationOption = 'OnFailure', 'OnSuccess'
}

Send-MailMessage @mailParams
