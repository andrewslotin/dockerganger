Dockerganger
============

Docker container for [andrewslotin/doppelganger](https://github.com/andrewslotin/doppelganger).

Usage
-----

```bash
docker pull andrewslotin/doppelganger
docker run -d --name doppelganger -e DOPPELGANGER_GITHUB_TOKEN=<YOUR_PERSONAL_ACCESS_TOKEN> -v /var/mirrors:<MIRRORS_DIR> -p 8081:8081 andrewslotin/doppelganger
```

**Note:** an HTTP authorization for anything except `/apihook` might be a good idea. `/apihook` should be accessible without authentication from [GitHub IPs](https://help.github.com/articles/what-ip-addresses-does-github-use-that-i-should-whitelist/).