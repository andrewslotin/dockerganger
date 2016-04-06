Dockerganger
============

Docker container for [andrewslotin/doppelganger](https://github.com/andrewslotin/doppelganger).

Usage
-----

### Run with Docker command-line

```bash
docker pull andrewslotin/doppelganger
docker run -d --name doppelganger -e DOPPELGANGER_GITHUB_TOKEN=<YOUR_PERSONAL_ACCESS_TOKEN> -v <MIRRORS_DIR>:/var/mirrors -p 8081:8081 andrewslotin/doppelganger
```

### Run with docker-compose

```bash
# Clone github.com/andrewslotin/dockerganger or just download docker-compose.yml from there
git clone https://github.com/andrewslotin/dockerganger.git
cd dockerganger
# Create data volume with a name doppelganger-mirrors to store mirrored code inside
docker volume create --name=doppelganger-mirrors
# Put your Github access token into .env file in the same directory
echo 'DOPPELGANGER_GITHUB_TOKEN=<YOUR_PERSONAL_ACCESS_TOKEN>' > .env
# Run your container
docker-compose up -d
```

This will launch Doppelganger instance listening on `localhost:8081` and storing mirrored code in a Docker volume `doppelganger-mirrors`.
To customize defaults, i.e. override port or use a local directory instead of volume, create `docker-compose.override.yml` in the same directory
with following content:

```yaml
version: '2'
services:
  doppelganger:
    ports:
      - "1234:8081"
    volumes:
      - /path/to/mirrored/code:/var/mirrors
```

**Important note:** an HTTP authorization for anything except `/apihook` might be a good idea. `/apihook` should be accessible without authentication from [GitHub IPs](https://help.github.com/articles/what-ip-addresses-does-github-use-that-i-should-whitelist/).