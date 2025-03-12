Function bulkCreate{
$users = Import-Csv C:\Users\linivan2003\Desktop\People.csv
foreach($user in $Users){
$Name = $user.Name
$GivenName = $user.GivenName
$Surname = $user.Surname
$samName = $GivenName[0] + $Surname
$userPrincipalName = $samName + "@domain.com"
$path = "OU=30USERS,DC=mydomain,DC=com"
$Password = ConvertTo-SecureString "Farty123" -AsPlainText -Force
New-ADUser -Name $Name -GivenName $GivenName -Surname $Surname -SamAccountName $samName -UserPrincipalName $userPrincipalName -path $path -AccountPassword $Password -Enabled $true
Write-Output "created user $GivenName"
}
}

bulkCreate 
