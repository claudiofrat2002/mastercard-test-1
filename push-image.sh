 #!/bin/bash
 
 LOCAL_TAG=$(git rev-parse --short HEAD)
 
 #Building the image with local Dockerfile
 docker build -t python-hello-world:${LOCAL_TAG} .

 #Tagging the image with the local tag
 docker tag python-hello-world:${LOCAL_TAG} localhost:5000/python-hello-world:${LOCAL_TAG}
 
 #Pushing the image to local repository
 docker push localhost:5000/python-hello-world:${LOCAL_TAG}