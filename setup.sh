git clone https://github.com/sscompucare/web.git
git clone https://github.com/sscompucare/admin.git
git clone https://github.com/sscompucare/docker.git
git clone https://github.com/sscompucare/api.git

sudo docker build -t compucare-api ./docker/images/api/.

sudo docker run -it --rm \
    -v $PWD/web:/root \
    -w /root \
    node:12.16.3-alpine3.9 yarn

sudo docker run -it --rm \
    -v $PWD/admin:/root \
    -w /root \
    node:12.16.3-alpine3.9 yarn

sudo docker run -it --rm \
    -v $PWD/api:/root \
    -w /root \
    compucare-api yarn

sudo docker-compose down
