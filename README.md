To build
time docker build -t taf7lwappqystqp4u7wjsqkdc7dquw/angrybeta .

To run
docker run --privileged -ti --volume /sys/fs/cgroup:/sys/fs/cgroup:ro --volume ${PWD}/private:/var/private:ro --volume ${PWD}/repository:/srv --env GIT_URL=git@github.com:AFnRFCb7/lanterngold.git taf7lwappqystqp4u7wjsqkdc7dquw/angrybeta

# Volumes
${PWD}/private - a directory where we store a private ssh key that will be used to push to a git repo

# Env
GIT_URL the url of a repo to push to