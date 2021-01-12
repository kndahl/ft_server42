# ft_server
Dockerfile that sets up an nginx server. It must run a Wordpress with a MySQL database and and PHPMyAdmin.

##To start:

eval $(docker-machine env)

docker build -t (name) (path)

docker run -it -p 80:80 -p 443:443 (name)

If you want to delete all images:
docker rmi -f $(docker images -q)
