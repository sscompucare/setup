git clone https://github.com/sscompucare/web.git
git clone https://github.com/sscompucare/admin.git
git clone https://github.com/sscompucare/docker.git
git clone https://github.com/sscompucare/api.git
git clone https://github.com/sscompucare/uploads.git

docker build -t compucare-api ./docker/images/api/.

docker run -it --rm \
    -v $PWD/web:/root \
    -w /root \
    node:12.16.3-alpine3.9 yarn

docker run -it --rm \
    -v $PWD/admin:/root \
    -w /root \
    node:12.16.3-alpine3.9 yarn

docker run -it --rm \
    -v $PWD/api:/root \
    -w /root \
    compucare-api yarn

docker run -it --rm \
    -v $PWD/uploads:/root \
    -w /root \
    node:12.16.3-alpine3.9 yarn

docker-compose down
docker-compose up