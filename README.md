# proxy-docker

docker in docker & shadowsocks for pull docker images

```sh
docker run -it --rm --privileged -e SERVER=1.1.1.1 -e PASSWORD=123456 modules/proxy-docker docker pull gcr.io/google_containers/pause-amd64:3.1
docker cp $(docker ps -alq):/images .
docker load -i images
```
