# bird-rtrlib-cli-docker

quick and dirty Docker instance of [rtrlib](https://github.com/rtrlib/rtrlib/) and [bird-rtrlib](https://github.com/rtrlib/bird-rtrlib-cli).

## how to run

At the moment, the following seems to work... more work needed though:

## Badges

[![](https://images.microbadger.com/badges/image/tiernano/bird-rtrlib-cli-docker.svg)](https://microbadger.com/images/tiernano/bird-rtrlib-cli-docker "Get your own image badge on microbadger.com")

[![](https://images.microbadger.com/badges/version/tiernano/bird-rtrlib-cli-docker.svg)](https://microbadger.com/images/tiernano/bird-rtrlib-cli-docker "Get your own version badge on microbadger.com")

[![](https://images.microbadger.com/badges/commit/tiernano/bird-rtrlib-cli-docker.svg)](https://microbadger.com/images/tiernano/bird-rtrlib-cli-docker "Get your own commit badge on microbadger.com")

### V4, Cloudflare Server, Ubuntu

`docker run -it --name bird-rtrlib-cli-v4 -v /run/bird/:/run/bird/ tiernano/bird-rtrlib-cli-docker /tmp/bird-rtrlib-cli-0.1.1/bird-rtrlib-cli -b /run/bird/bird.ctl -r rtr.rpki.cloudflare.com:8282`

### V6, Cloudflare Server, Ubuntu

`docker run -it --name bird-rtrlib-cli-v6 -v /run/bird/:/run/bird/ tiernano/bird-rtrlib-cli-docker /tmp/bird-rtrlib-cli-0.1.1/bird-rtrlib-cli -b /run/bird/bird6.ctl -r rtr.rpki.cloudflare.com:8282`

### Parameters

* `--name bird-rtrlib-cli-v6` - name your docker instance
* `-v /run/bird/:/run/bird/` - where does bird put its ctl files? on ubuntu its /run/bird. on the docker instance, it is also /run/bird. If bird (on the host) has files are /var/run/bird, then change this to `-v /var/run/bird:/run/bird`. First part is where on the host to go. second is where in the container to go.
* `/tmp/bird-rtrlib-cli-0.1.1/bird-rtrlib-cli` - the path to the file inside the container to run... yea, probably going to fix this to something else...
* `-b /run/bird/bird6.ctl` - bind to the correct bird control file. bird.ctl is V4, bird6.ctl is V6. (this is bird 1.6... 2.0 may be different)
* `-r rtr.rpki.cloudflare.com:8282` - Server to get RPKI data from. Cloudflare's is public, so i use that. You can run your own or use someone elses too... just change the address here.

## Any more info

Not yet, but stay tuned...
