1) Command -> docker run -it -d ubuntu
This will keep running the container in Daemon mode -( -d is for daemon)
-it is for i->interactive and t is for tty
-d means Daemon mode and it will send it to the background

Now above command will send it to a detached mode and if you want to connect to that container we have the command->
docker attach <containmer-id>
you will be re-directed to the container shell in interactive mode

------------Docker important commands ------

1) docker exec -ti <container-name> command.sh
2) docker logs -ft <container-name>
3) docker-compose up
4) docker pull image
5) docker [start] [stop] container_name
6) 


