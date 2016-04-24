FROM taf7lwappqystqp4u7wjsqkdc7dquw/heavytombstone
MAINTAINER “Emory Merryman” emory.merryman+DoTDeCocXJroqaWu@gmail.com>
RUN mkdir /home/${LUSER}/.ssh && chmod 0700 /home/${LUSER}/.ssh
COPY config /home/${LUSER}/.ssh/config
USER root
RUN dnf update --assumeyes && dnf install --assumeyes git dbus && dnf update --assumeyes && dnf clean all && dbus-uuidgen > /var/lib/dbus/machine-id 
COPY angrybeta.sh /usr/local/bin/angrybeta
COPY angrybeta.service /usr/lib/systemd/system/angrybeta.service
COPY angrybeta.timer /usr/lib/systemd/system/angrybeta.timer
RUN  chmod 0555 /usr/local/bin/angrybeta && systemctl enable angrybeta.timer &&  chown --recursive ${LUSER}:${LUSER} /home/${LUSER}/.ssh && chmod 0600 /home/${LUSER}/.ssh/config && echo -e "#!/bin/bash\nsu --login ${LUSER} --command \"/usr/local/bin/angrybeta \${GIT_URL}\"" > /usr/local/sbin/angrybeta && chmod 0500 /usr/local/sbin/angrybeta
VOLUME /var/private
VOLUME /srv
CMD ["/usr/sbin/init"]
