## Table of Contents
- [Requirements](#requirements)
- [Installation](#installation)
- [Stacks](#stacks)

# Requirements
- Docker Swarm
- Folders created for all the mounts
- Overlay Network called db and intranet
# Installation

```sh
git clone https://github.com/prashantsolanki3/doclab
cd doclab
```
Create db and intranet overlay network. Adding overlay network allows services in various stacks to communicate with each other.

```sh
docker network create -d overlay --attachable intranet
docker network create -d overlay --attachable db
```

Deploy a stack

```sh
cd <stack>
docker stack deploy --compose-file <(docker-compose config) <stack>
```

Delete Stack

```sh
docker stack rm <stack>
```

List tasks for service

```sh
docker stack ps <stack>
```

Service logs

```sh
docker service logs --follow <stack>_<service>
```

Recreate a service

```sh
docker service update --force <stack>_<service>
```

# Stacks


| 3d Stack                            | DB Stack                                 | Dev Stack                                                    | Essential Stack                                                 |
| ----------------------------------- | ---------------------------------------- | ------------------------------------------------------------ | --------------------------------------------------------------- |
| [Blender](https://www.blender.org/) | [MariaDB](https://mariadb.org/)          | [Code-Server](https://github.com/coder/code-server)          | [Portainer](https://www.portainer.io/)                          |
|                                     | [Redis](https://redis.io/)               | [MySql Workbench](https://www.mysql.com/products/workbench/) | [Flame](https://github.com/pawelmalak/flame)                    |
|                                     | [PostgreSQL](https://www.postgresql.org) | [Adminer](https://www.adminer.org/)                          | [DockerProxy](https://github.com/Tecnativa/docker-socket-proxy) |


| Home Stack                                       | Media Stack                                      | Vault Stack                                                | Monitor                                               |
| ------------------------------------------------ | ------------------------------------------------ | ---------------------------------------------------------- | ----------------------------------------------------- |
| [Home-Assistant](https://www.home-assistant.io/) | [Deluge](https://deluge-torrent.org/)            | [Firefly-iii](https://www.firefly-iii.org/)                | [Librespeed](https://github.com/librespeed/speedtest) |
| [Grocy](https://grocy.info/)                     | [Radarr](https://radarr.video/)                  | [FIDI](https://docs.firefly-iii.org/data-importer/)        |                                                       |
| [MQTT](https://mqtt.org/)                        | [Sonarr](https://sonarr.tv)                      | [Vault Warden](https://github.com/dani-garcia/vaultwarden) |                                                       |
|                                                  | [Lidarr](https://lidarr.audio/)                  | [Papermerge](https://www.papermerge.com/)                  |                                                       |
|                                                  | [Readarr](https://readarr.com/)                  | [BookStack](https://www.bookstackapp.com/)                 |                                                       |
|                                                  | [Overseerr](https://overseerr.dev/)              | [NextCloud](https://nextcloud.com/)                        |                                                       |
|                                                  | [Prowlarr](https://github.com/Prowlarr/Prowlarr) |                                                            |                                                       |
|                                                  | [Tautulli](https://tautulli.com/)                |                                                            |                                                       |




