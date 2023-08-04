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

#the CMD command runs a command after te image is built, once we run the container. As with this project, CMD is usually a start command
CMD ["npm", "start"]