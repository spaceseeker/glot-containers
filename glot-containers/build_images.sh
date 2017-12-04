#!/bin/bash
shopt -s globstar
set -e

for dockerfile in **/Dockerfile; do
    tagPath=$(dirname "$dockerfile")
    imagePath=$(dirname "$tagPath")
    tag=$(basename "$tagPath")
    image=$(basename "$imagePath")
    imageName="glot/${image}:${tag}"

    if [ "$image" != "elm" ]
    then
      # Build image
      (
          cd "$tagPath"
          docker build --no-cache -t "$imageName" .
      )
    fi
    echo "$image is OK" >> output.log
done
