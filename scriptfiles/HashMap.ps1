$ip = @{devip = "10.113.2.174"; qaip = "10.113.2.102"}

$a = $ip.devip
$b = $ip.qaip

write-Host "devIp : "$a "qaIp : " $b

Write-Host $ip.Remove("devip")
$ip