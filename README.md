# mastercard-test-1

1. I've run the docker registry on my machine -> docker run -d -p 5000:5000 --restart=always --name registry registry:2 

2. Created the simple "Hello World!" app in python, 'app' folder using flask, Packed the app in a container with the Dockerfile in the root folder and created the push-image.sh script to push to local registry. Pushed the code to repo and run the push-image.sh script

MLWES35909:mastercard-test-1 c.frattari$ ./push-image.sh
Sending build context to Docker daemon   72.7kB
Step 1/6 : FROM python:3.6
 ---> 2dfb6d103623
Step 2/6 : WORKDIR /app
 ---> Using cache
 ---> dbbc98f0280d
Step 3/6 : COPY app/requirements.txt ./
 ---> Using cache
 ---> bdd5d747e283
Step 4/6 : RUN pip install -r requirements.txt
 ---> Using cache
 ---> db5aa0470fbb
Step 5/6 : COPY app/hello.py /app
 ---> Using cache
 ---> 16b818afbdba
Step 6/6 : CMD [ "python", "hello.py" ]
 ---> Using cache
 ---> 4277b6106b64
Successfully built 4277b6106b64
Successfully tagged python-hello-world:27b6ba9
The push refers to repository [localhost:5000/python-hello-world]
d2d1e04f0bf3: Mounted from registry
e9cd5a79a157: Mounted from python-hello
5c161f4fe957: Mounted from python-hello
bff91611899d: Mounted from python-hello
aaeecd3bafff: Mounted from python-hello
4ecefce7ec49: Mounted from python-hello
3125d8e4d0be: Mounted from python-hello
ca5c6919ea52: Mounted from python-hello
8c39f7b1a31a: Mounted from python-hello
88cfc2fcd059: Mounted from python-hello
760e8d95cf58: Mounted from python-hello
7cc1c2d7e744: Mounted from python-hello
8c02234b8605: Mounted from python-hello
27b6ba9: digest: sha256:d3f390825d622c13ddb697f57620b8aed90bedebedc04abe1bc89ec79c89f111 size: 3049

3. Change the app to print a different Message "Hello Brand new World!", Pushed the code to repo and re-run the push-image.sh script