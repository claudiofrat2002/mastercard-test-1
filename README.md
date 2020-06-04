# mastercard-test-1

1. I've run the docker registry on my machine -> docker run -d -p 5000:5000 --restart=always --name registry registry:2 

2. Created the simple "Hello World!" app in python, 'app' folder using flask, Packed the app in a container with the Dockerfile in the root folder and created the push-image.sh script to push to local registry. Pushed the code to repo and run the push-image.sh script
