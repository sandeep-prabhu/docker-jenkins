## How to build and run the docker application :


docker build -t sandeepsp21/mishi:1 .

docker run -itd -p 80:80 sandeepsp21/mishi:1

Note : -p 80:80 is to expose the application running inside the container at port 80 to the local machine in port 80

The Output consist of single html file output , which is defined in index.html file .


## Weakness of the my dockerfile 

- The size of the docker image is high , because we used ubuntu as base images,I always suggest to decrease the images size by using lightweight base images like alpine . 
- we could have directly used the base images of node and nginx directly and server the html with the build folder .
- should have been reduced the docker layers a bit 

- I usually wirte Dockerfile with different build stages you can refer to the file React-Dockerfile which I added here .

- This Dockerfile is not Ready to use in production ( because it needs some optimization )



