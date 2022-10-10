
# TODO
- [db] Duplicati: https://hub.docker.com/r/linuxserver/duplicati
- [ubu] Check out https://www.gitpod.io/

# DONE
- [home] Grocy: https://hub.docker.com/r/linuxserver/grocy
- [web] Endlessh: https://hub.docker.com/r/linuxserver/endlessh
- [3d] Blender: https://hub.docker.com/r/linuxserver/blender
- [vault] Hedgedoc: https://hub.docker.com/r/linuxserver/hedgedoc
- [vault] Paperless-ngx: https://hub.docker.com/r/linuxserver/paperless-ngx
- [ubu] Mysql-Workbench: https://hub.docker.com/r/linuxserver/mysql-workbench
- [web] Libre speed test: https://hub.docker.com/r/linuxserver/librespeed



# Enhancements
- SSO in Firefly: https://docs.firefly-iii.org/firefly-iii/advanced-installation/authentication/`
- Organise the services in relavent groups.


#### Adding intranet network allows services in various stacks to communicate with each other
```docker network create -d overlay --attachable intranet```
#### Deploy a stack
```docker stack deploy --compose-file <(docker-compose config) <stack>```
#### Delete Stack
```docker stack rm <stack>```
#### service logs
```docker service logs --follow <stack>_<service>```
#### Recreate a service
`docker service update --force <stack>_<service>`
