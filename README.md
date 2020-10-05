# ft_server
Server 42

To start:

eval $(docker-machine env)

docker build -t (name) (path)

docker run -it -p 80:80 443:443 (name)

If you want to delete all images:
docker rmi -f $(docker images -q)
