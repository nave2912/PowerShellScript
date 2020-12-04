$testkey=az storage account keys list --account-name powerhubqatestresult --resource-group powerhub-qa-appservice-rg --query [0].value -o tsv

echo $testkey

$start=Get-Date -UFormat '+%Y-%m-%dT%H:%M:%SZ'
$end=Get-Date -Year 2021 -UFormat '+%Y-%m-%dT%H:%M:%SZ'

$sourceURL="$(System.DefaultWorkingDirectory)/_Utility/drop/CCReport43F6D5EF/*"
echo $sourceURL

$blobURL="https://powerhubqatestresult.blob.core.windows.net/"
echo $blobURL

$folderName='$web/UtilityCodeCoverage'
echo $folderName

$webfolder='$web'
echo $start
echo $end

##generate sas
$sas2=az storage container generate-sas -n $webfolder --permissions rwdl --expiry $end --start $start --account-name powerhubqatestresult --account-key $testkey -o tsv
echo $sas2
$questionmark="?"
echo $questionmark
$destinationURL=$blobURL+$folderName+$questionmark+$sas2
echo $destinationURL
$fullURL=$sourceURL+" "+$destinationURL
echo $fullURL


azcopy copy $sourceURL $destinationURL --log-level=INFO --recursive --overwrite=true