
testkey="$(az storage account keys list --account-name powerhubdevtestresult --resource-group powerhub-dev-appservice-rg --query [0].value -o tsv)"
echo $testkey

start=`date -u '+%Y-%m-%dT%H:%M:%SZ'`
end=`date -u -d "2 hours" '+%Y-%m-%dT%H:%M:%SZ'`
##generate sas
sas2="$(az storage container generate-sas -n\$web --permissions rwdl --expiry $end --start $start --account-name powerhubdevtestresult --account-key $testkey -o tsv | sed "s/%3A/:/g")"
echo $sas2

azcopy copy "$(System.DefaultWorkingDirectory)/_Utility/drop/CCReport43F6D5EF/*" "https://powerhubdevtestresult.blob.core.windows.net/\$web/UtilityCodeCoverage/?$sas2"  --log-level=INFO --recursive --overwrite=true --check-length=false