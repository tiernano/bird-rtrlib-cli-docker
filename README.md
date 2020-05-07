# bird-rtrlib-cli-docker
quick and dirty Docker instance of rtrlib and bird-rtrlib

# how to run?
At the moment, the following seems to work... more work needed though:

docker run -it --name bird-rtrlib-cli-v4 -v /run/bird/:/run/bird/ tiernano/bird-rtrlib-cli-docker /tmp/bird-rtrlib-cli-0.1.1/bird-rtrlib-cli -b /run/bird/bird.ctl -r rtr.rpki.cloudflare.com:8282

change the first /run/bird to where bird writes its bird.ctl socket (/run/bird on ubuntu). If you want to use V6, change bird.ctl to bird6.ctl in the bird-rtrlib-cli parameter. to use a different RTR server, change the -r flag with the new server. 

# Any more info?

Not yet, but stay tuned...
