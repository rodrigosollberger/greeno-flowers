#the FROM command establishes the base image to be used for subsequent instructions
FROM node:18

#the COPY command tells Docker where to find source files and where to put them in the image. There are two paths in this command
# path 1: outside the image / the files we are copying in. Below, we are telling Docker to use everything from the current Directry y using '.'
# path 2: inside the image /where the files will be stored. This is detached from our file system
COPY . /app

#the WORKDIR command specifies the working directory. By establishing WORKDIR and where the files will be stored inside the image to be the same, this is now the 'root' of the project
WORKDIR /app

#the RUN command runs a command while the image is being built. Below, we want Docker to install npm packages
RUN npm install

#we are exposing port 3000 as it is the one that the app uses
EXPOSE 3000

#the CMD command runs a command after te image is built, once we run the container. As with this project, CMD is usually a start command
CMD ["npm", "start"]

#go to the terminal then and run Docker build, which has three arguments ('-t' is for tag):
#    docker build -t name-of-the-image where-is-my-Dockerfile
# we should then type: docker build -t first-image .
# the '.' above is used to implicitly tell that's where the Dockerfile is

#RUNNING the docker image:
# the argument '-d' will run in the background, in detach mode, meaning it will not hijack the terminal
# the argument '-p' will bind the port that has been exposed in the container to one in the operating system
#there are further arguments that can be used, but these will suffice for now
#   docker run -d -p 3000:3000 first-image