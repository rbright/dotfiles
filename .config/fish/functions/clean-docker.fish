function clean-docker
    docker system prune -a --volumes
    docker rm (docker ps --no-trunc -aq)
    docker images -q --filter "dangling=true" | xargs docker rmi
end