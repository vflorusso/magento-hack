az group create -n "vitotestnetwork" -l "westeurope"
az group create -n "vitotestloganalytics" -l "westeurope"
az group create -n "vitotestcronvm" -l "westeurope"
az group deployment create -n "vitotestnwdeploy01" -g "vitotestnetwork" --template-file "master.json" --parameters "master.parameters.json"

