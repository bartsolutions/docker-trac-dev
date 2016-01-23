This project contains a `Dockerfile` for the [auomated build in DockerHub](https://hub.docker.com/r/walty8/docker-trac-dev/).

It aims to help people start [developing Trac](http://trac.edgewall.org/wiki/TracDev) in 5 minutes.

***Please note that all Docker commands need the root permssion!***

---- 

**How to Install:**
- [Install docker](https://docs.docker.com/engine/installation/)
- `git clone https://github.com/walty8/docker-trac-dev`
- `cd docker-trac-dev && sudo sh run.sh` (This would download a precompiled **~200MB** image from Dokcer Hub, for the first run.)


**Features**
- Latest source code of Trac and Genshi (up to 2016-01-20)
- Ready-to-go Trac server
- Built-in SSH server
- Two authenticated users (`user1:pass1`, `user2:pass2`)
- A sample subversion and git reposotiry linked to the sample Trac instance
- All services are run by supervisord

**Basic Usage**
- `sudo sh run.sh`
- Start a browser and open the Trac URL: `http://localhost:3080`
- Stop the docker instance: `sudo docker stop trac-dev`
- Restart the docker instance: `sudo docker start trac-dev`
- Remove the docker instance (***caution, all your changes will be lost***): `sudo docker rm trac-dev`

**Development**
- SSH into the docker instance first: `ssh root@localhost -p 3022` (password: `trac`)
- Trac source code is located at: `/root/trac-trunk`
- Testing Trac instance is located at: `/root/test`
- Run unit test: `cd /root/trac-trunk && python -m trac.ticket.tests.batch`
- Modify the source code, for example:
 - Edit source code: `vim /root/trac-trunk/trac/templates/layout.html`
 - Replace the string of `Download in other formats` with `Trac Test Modification`.
 - Restart Trac: `sh /root/restart_trac.sh`
 - Refresh browser (`http://localhost:3080`) to see the change

**Patch Submission**
- Please read the [official Trac development guideline](http://trac.edgewall.org/wiki/TracDev#Howtogetstarted) first.
- For simple and one-off patch, you might use `git diff` to generate a patch and attach to the ticket.
- For continuous work, you are advised to 
 1. Fork [Trac project](https://github.com/edgewall/trac) from github
 2. [Replace the remote repository](http://stackoverflow.com/questions/2432764/change-the-uri-url-for-a-remote-git-repository) of `/root/track-trunk` with your own github project
 3. Commit and push your changes 
 3. In the Trac ticket, submit the patch link of github, e.g. https://github.com/edgewall/trac/commit/596b2e72d63a165dd29d85925fce126d3d2cb10d.diff
