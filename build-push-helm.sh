#!/bin/bash

export HELM_EXPERIMENTAL_OCI=1

export AZURE_REGISTRY_URI='sitecoredemocontainers.azurecr.io'
export AZURE_ACR='sitecoredemocontainers'
export AZURE_RM='pushhelmcharts'

ACCESS_TOKEN=$(az acr login --name $AZURE_REGISTRY_URI --expose-token --output tsv --query accessToken)
echo $ACCESS_TOKEN | helm registry login $AZURE_REGISTRY_URI -u 00000000-0000-0000-0000-000000000000 --password-stdin

 for chart in $(ls -d helm/stable/*xp0*); 
 do 
    #helm dependency build $chart
    # get the first version from Chart.yaml
    version=$( cat "$chart/Chart.yaml" | grep -Po 'version: \K.*' | head -n 1 ) 
    echo "->> $chart -> $version";
    helm chart save $chart $AZURE_REGISTRY_URI/$chart:$version
    helm chart push $AZURE_REGISTRY_URI/$chart:$version
 done; 
