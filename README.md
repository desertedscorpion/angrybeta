To build
time docker build -t taf7lwappqystqp4u7wjsqkdc7dquw/angrybeta .

To run
docker run --privileged -ti --volume /sys/fs/cgroup:/sys/fs/cgroup:ro --volume ${PWD}/private:/var/private:ro --volume ${PWD}/repository:/srv --env GIT_URL=git@github.com:AFnRFCb7/lanterngold.git taf7lwappqystqp4u7wjsqkdc7dquw/angrybeta

private is a directory where we store a private key

private/id_rsa should be the private key that matches id_rsa.pub (since it is a public key it can be shared and thus is not in the private directory)

repository is the parent directory of a git repository.  
