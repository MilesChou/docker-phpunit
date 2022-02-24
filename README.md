# Dockerized phpunit

> [Docker Hub](https://hub.docker.com/repository/docker/mileschou/phpunit) [GitHub](https://github.com/MilesChou/docker-phpunit)

Pull image

```bash
docker pull mileschou/phpunit
```

Try in your project:

```bash
docker run --rm -it -v `pwd`:/source -w /source mileschou/phpunit phpunit
```
