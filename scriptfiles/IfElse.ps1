$a = Read-Host "Please enter Username "

if($a -cmatch "naveen")
{
Write-Host "Naveen UserName matched"
}

elseif($a -cmatch "kumar"){
Write-Host "Kumar username matched"
}
else{
Write-Host "please enter new user as naveen or kumar"
}