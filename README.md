To build
time docker build -t taf7lwappqystqp4u7wjsqkdc7dquw/angrybeta .

To run
docker run --privileged -ti --volume /sys/fs/cgroup:/sys/fs/cgroup:ro --volume ${PWD}/private:/var/private:ro --volume ${PWD}/repository:/srv --env GIT_URL=git@github.com:AFnRFCb7/lanterngold.git taf7lwappqystqp4u7wjsqkdc7dquw/angrybeta

