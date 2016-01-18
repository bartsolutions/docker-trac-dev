This is a Dockerfile for building development environment for Trac.

Hopefully people could start developing and tuning Trac related code in 5 minutes, from scratch.

**Docker Hub Site**

https://hub.docker.com/r/walty8/docker-trac-dev/

**Dependency**

You should have docker installed, if not please run the following command:

`apt-get install docker.io`

**How to install:**
- `git clone https://github.com/walty8/docker-trac-dev`
- `cd docker-trac-dev && sh run.sh`

**How to use:**
- Check Trac server is up: use any browser to open `http://localhost:3080`
- Access the docker instance: `ssh root@localhost -p 3022` (password: `trac`)
- Stop the docker instance: `docker stop trac-dev`
- Restart the docker instance: `docker start trac-dev`
- Remove the docker instance (***caution***): `docker rm trac-dev`
