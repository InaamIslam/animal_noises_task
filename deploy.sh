#!/bin/bash


#build server

docker build -t animal_noises_server server

#build animal_api

docker build -t animal_noises_api animal_api

#create network

docker network create animal_noises_network

#Run server

docker run -d -p 5000:5000 --name animal_noises_server --network animal_noises_network animal_noises_server

#run api

docker run -d --name animal_noises_server --network animal_noises_network animal_noises_server