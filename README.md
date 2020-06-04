# mastercard-test-1

1. I've run the docker registry on my machine -> docker run -d -p 5000:5000 --restart=always --name registry registry:2 

2. Created the simple "Hello World!" app in python, 'app' folder using flask, Packed the app in a container with the Dockerfile in the root folder and created the push-image.sh script to push to local registry. Pushed the code to repo and run the push-image.sh script

3. Change the app to print a different Message "Hello Brand new World!", Pushed the code to repo and re-run the push-image.sh script


4. Tags are different(27b6ba9 vs 4552dbc) having bind the tagging docker script to the git commit  LOCAL_TAG=$(git rev-parse --short HEAD)

5. Changed the code using a different context root for the app and re-pushed to the repo 
MLWES35909:mc-test-1 c.frattari$ ./push-image.sh



6. At the moment I have this tag in the registry 
{"name":"python-hello-world","tags":["27b6ba9","f8ff250","4552dbc"]}, going to add a manual latest tag on the last version 

docker tag python-hello-world:f8ff250 localhost:5000/python-hello-world:latest
docker push localhost:5000/python-hello-world

In the script list-tag-from-repo.sh I'm going to query the registry API and obtain all the repo/images that got a latest tag, in my case:

./list-tag-from-repo.sh
"python-hello-world:latest" "registry:latest"

7. I've chosen to create for this iac challenge an elastic beanstalk in AWS(terraform-iac folder) configure a k8s cluster could be too expensive in time for my need... I needed to create a role, a sg too for have the EBS up and running. I've created a backend to save the state of the infrastructure.
Executing the command in the makefile the environment will be created(you need to have the right aws creds in your env although).

To deploy the application I've created a script deploy_image_on_ebs.sh that push the build of the app on an ECR registry and then trigger the update of the environment. In this way the latest image pushed will be deployed.

