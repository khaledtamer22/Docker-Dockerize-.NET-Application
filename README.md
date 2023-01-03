# Dockerize .Net core application with docker

1- Open your CLI in the root folder of the application after you download the repository

2- Build the image using the following command
`docker build --tag imageName .`

3- Make the container that the application will run on using the following command
`docker run  -d -p 8080:80 --name containerName`

Note we choosed port 8080

4- Run you application on localhost
Go to your web browser and write `localhost:8080` then you will find the application home page running.
