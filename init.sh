#!/bin/bash
docker rm -f $(docker ps -aq)
docker build . -t timerservice:1.0 -f timerservice/Dockerfile
docker build . -t loggerservice:1.0 -f loggerservice/Dockerfile
docker run -itd --network=mynet -p 8000:5000 timerservice:1.0
docker run -itd --network=mynet -p 8001:5000 loggerservice:1.0
