#!/bin/bash

##########################################
# Please run this script using sudo
# as some os and docker setup may require so
##########################################


# Check for root access
isRoot="$(id -u)"
if [ $isRoot != "0" ]
then
   echo "This script requires su to run. Enter "sudo su" first before running this script"
   exit 1
fi

# change directory into the source 
cd glot-containers

# Update the source
git fetch && git checkout master
git pull origin master

# Copy our custom build images to the source directory
cp ../custom_build_images.sh .

# Copy our custom run test to the source directory
cp ../custom_run_tests.sh .

# Copy exclude list into the source directory
cp ../exclude.txt .

# Rest the output log file
rm -f output.txt

# Start building and deploying containers
./custom_build_images.sh