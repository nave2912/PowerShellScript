#RemoveParticular Value in array

$ArrayList = "Naveen",12,13 

$ArrayList = $ArrayList | where {$_ -ne 12}

$ArrayList