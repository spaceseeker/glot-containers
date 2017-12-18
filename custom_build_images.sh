#!/bin/bash
shopt -s globstar
set -e

for dockerfile in **/Dockerfile; do
    tagPath=$(dirname "$dockerfile")
    imagePath=$(dirname "$tagPath")
    tag=$(basename "$tagPath")
    image=$(basename "$imagePath")
    imageName="glot/${image}:${tag}"
    #echo $image
    #excludeImage='grep -Fx $image exclude.txt'
    #echo "excludeImage is $excludeImage"
    if grep -q -e "^$image$" exclude.txt;
    then
        echo "Skipping $image" >> output.txt
    else
        # Build image
        (
            cd "$tagPath"
	    docker rmi -f "$imageName"
            docker build --no-cache --label "container=$image" -t "$imageName" .
        )
	echo "$image is OK" >> output.txt
    fi
done