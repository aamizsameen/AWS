#!/bin/bash

echo "Enter the registry name: "
read registry

repos="$(az acr repository list -n $registry --output tsv)"

for i in $repos; do
    images="$(az acr repository show-tags -n $registry --repository $i --output tsv --orderby time_desc)"
    for j in $images; do
        echo $i":"$j

        docker pull example.azurecr.io/$i:$j

        aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin 1234567890.dkr.ecr.ap-south-1.amazonaws.com

        docker image tag example.azurecr.io/$i:$j 1234567890.dkr.ecr.ap-south-1.amazonaws.com/repo:$i-$j

        docker push 1234567890.dkr.ecr.ap-south-1.amazonaws.com/repo:$i-$j

    done
done
