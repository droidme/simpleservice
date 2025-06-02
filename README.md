# simpleservice


## Dockerfile

## service.yml

### traefik labels

```yaml
services:
  simpleservice:
    image: droidme/simpleservice:latest
    networks:
      - traefik-net
    deploy:
      mode: replicated
      replicas: 1
      labels:
          - traefik.enable=true
          - traefik.http.routers.simpleservice.rule=Host(`simpleservice.swarm.droidme.io`)
          - traefik.http.routers.simpleservice.entrypoints=web
          - traefik.http.services.simpleservice.loadbalancer.server.port=8080
networks:
  traefik-net:
    driver: overlay
    external: true
```
#### Port Detection
Traefik retrieves the private IP and port of containers from the Docker API.
Docker Swarm does not provide any port detection information to Traefik.
Therefore, you must specify the port to use for communication by using the label traefik.http.services.<service_name>.loadbalancer.server.port (Check the reference for this label in the routing section for Swarm).