#Shell script to list all the repository and tags from Azure Container Regisrty (ACR)

#!/bin/bash

echo "Enter the registry name: "
read registry

repos="$(az acr repository list -n $registry --output tsv)"

for i in $repos; do 

    images="$(az acr repository show-tags -n $registry --repository $i --output tsv --orderby time_desc)"

    for j in $images; do

        echo $i:$j >> tagslog.txt

    done
done
