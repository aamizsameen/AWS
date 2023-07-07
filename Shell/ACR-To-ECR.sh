#!/bin/bash

echo "Enter the registry name: "
read registry

repos="$(az acr repository list -n $registry --output tsv)"

for i in $repos; do
    images="$(az acr repository show-tags -n $registry --repository $i --output tsv --orderby time_desc)"
    for j in $images; do
        echo $i":"$j

        docker pull aamizreg.azurecr.io/$i:$j

        aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin 321145698548.dkr.ecr.ap-south-1.amazonaws.com

        docker image tag aamizreg.azurecr.io/$i:$j 321145698548.dkr.ecr.ap-south-1.amazonaws.com/aamizsameen:$i-$j

        docker push 321145698548.dkr.ecr.ap-south-1.amazonaws.com/aamizsameen:$i-$j

        echo "Image $i-$j pushed to ECR"

        sleep 5s
    done
done