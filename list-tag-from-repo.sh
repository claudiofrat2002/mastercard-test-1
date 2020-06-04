#!/bin/bash
#Declare local server
LOCAL_REG=localhost:5000
#Query the local registry for check the app that got a latest tag
LIST_TAG=$(curl -s http://$LOCAL_REG/v2/_catalog | \
    jq -r '.["repositories"][]' | \
    xargs -I @REPO@ curl -s http://$LOCAL_REG/v2/@REPO@/tags/list | \
    jq -M '.["name"] + ":" + .["tags"][]'|grep latest)

#List the latest images
echo $LIST_TAG